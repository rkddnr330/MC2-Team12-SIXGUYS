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

    
    let uid = Auth.auth().currentUser?.uid
    var studyCode: [String] = [String]()
    
    // 방 참가 로직
    func enterRoom(id: String) -> Void {
        let defaultName = UserDefaults.standard.string(forKey: "defaultUserName")
        let db = Firestore.firestore()
        var arr = user!.joinedStudy!
        arr.append(id)
        db.collection("User1").document(Auth.auth().currentUser!.uid).updateData(["joinedStudy" : arr])
        db.collection("Study1").document(id).getDocument(as: Study.self) { result in
            switch result {
                case .success(var study):
                    db.collection("Study1").document(id).updateData([
                        "memberId": FieldValue.arrayUnion([Auth.auth().currentUser!.uid]),
                        "numberOfAttendance.\(study.memberId!.count)" : 0,
                        "numberOfAbsent.\(study.memberId!.count)" : 0,
                        "numberOfLate.\(study.memberId!.count)" : 0,
                        "attendancePoint.\(study.memberId!.count)" : 0,
                        "currentAtt.\(Auth.auth().currentUser!.uid)" : 0,
                        "userName.\(Auth.auth().currentUser!.uid)": defaultName
                    ])
                   
                
                case .failure(let error):
                    // 실패했을 때
                    print("Error decoding Study: \(error)")
                }
        }
        
    }
    
    // 방 생성 로직
    func createRoom(title: String  = "EmptyTitle", days: [String : String], times: [String : String] ) -> Void {
        
        let db = Firestore.firestore()
        var ref: DocumentReference? = nil
        let defaultName = UserDefaults.standard.string(forKey: "defaultUserName")
        ref = db.collection("Study1").addDocument(data: ["title" : ""]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")

                // 로직짜야함
                db.collection("Study1").document(ref!.documentID).setData(["id": ref!.documentID , "title" : title, "day" : days, "time" : times, "memberId" : [Auth.auth().currentUser!.uid], "numberOfAttendance" : ["0": 0] , "numberOfAbsent" : ["0": 0] , "numberOfLate" : ["0": 0], "attendancePoint" : ["0": 0], "currentAtt" : [Auth.auth().currentUser!.uid : 0], "userName" : [Auth.auth().currentUser!.uid : defaultName]])
                
                db.collection("User1").document(Auth.auth().currentUser!.uid).updateData([
                    "joinedStudy": FieldValue.arrayUnion([ref!.documentID])
                ])
                
                
            }
        }
    }
    
    
    
    init(){
        print("[uid] : \(Auth.auth().currentUser?.uid)")
        let db = Firestore.firestore()
        let userDB = db.collection("User1").document(uid!)
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
                        self.user!.id = Auth.auth().currentUser?.uid
                    // 빈배열로 초기화
                    self.study = []
                    for studyCode in self.user?.joinedStudy ?? [] {
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
