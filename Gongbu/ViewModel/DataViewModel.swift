//
//  StudyData.swift
//  Gongbu
//
//  Created by Terry Koo on 2022/06/14.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class DataViewModel: ObservableObject {
    @Published var user: User?
    @Published var study: [Study]? = [Study]()

    
    let uid = Auth.auth().currentUser?.uid ?? "zlFvXcUxhoaBlaESJEhbtaVCrTF2"
    var studyCode: [String] = [String]()
    
    // 방 참가 로직
    func enterRoom(id: String) -> Void {
        let db = Firestore.firestore()
        var arr = user!.joinedStudy!
        arr.append(id)
        db.collection("User1").document(Auth.auth().currentUser!.uid).updateData(["joinedStudy" : arr])
    }
    
    // 방 생성 로직
    func createRoom(title: String  = "EmptyTitle", days: [String : String], times: [String : String] ) -> Void {
        
        let db = Firestore.firestore()
        var ref: DocumentReference? = nil
        ref = db.collection("Study1").addDocument(data: ["title": title]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
                // 방 생성 성공해서 방 id 리턴 받았을때
                
                
                // 로직짜야함
                
                
                
                
                
            }
        }
    }
    
    
    
    init(){
        print("[uid] : \(Auth.auth().currentUser?.uid ?? "zlFvXcUxhoaBlaESJEhbtaVCrTF2")")
        let db = Firestore.firestore()
        let userDB = db.collection("User1").document(uid)
        //let studyDB = db.collection("Study1").document("S123")

        userDB.getDocument(as: User.self) { result in
            switch result {
                case .success(let user):
                    // 성공했을 때
                    self.user = user
                    print("[user1] : \(user)")
                case .failure(let error):
                    // 실패했을 때
                    print("Error decoding User: \(error)")
                }
        }
        
        userDB.addSnapshotListener { documentSnapshot, error in
            guard let document = documentSnapshot else {
              print("Error fetching document: \(error!)")
              return
            }
            guard let data = document.data() else {
              print("Document data was empty.")
              return
            }
            userDB.getDocument(as: User.self) { result in
                switch result {
                    case .success(let user):
                        // 성공했을 때
                        self.user = user
                        self.user!.id = Auth.auth().currentUser?.uid ?? "zlFvXcUxhoaBlaESJEhbtaVCrTF2"
                    // 빈배열로 초기화
                    self.study = []
                    for studyCode in self.user?.joinedStudy! ?? [] {
                        let db = Firestore.firestore()
                        db.collection("Study1").document(studyCode).addSnapshotListener { documentSnapshot, error in
                            guard let document = documentSnapshot else {
                              print("Error fetching document: \(error!)")
                              return
                            }
                            guard let data = document.data() else {
                              print("Document data was empty.")
                              return
                            }
                            db.collection("Study1").document(studyCode).getDocument(as: Study.self) { result in
                                switch result {
                                    case .success(var study):
                                    study.id = studyCode
                                    self.study?.append(study)
                                        print("[study] : \(study)")
                                    case .failure(let error):
                                        // 실패했을 때
                                        print("Error decoding Study: \(error)")
                                    }
                            }
                            print("Current data: \(data)")
                          }
                    }
                        print("[user2] : \(user)")
                    case .failure(let error):
                        // 실패했을 때
                        print("Error decoding User: \(error)")
                }
            }
            print("Current data: \(data)")
        }
    } // init()
}
