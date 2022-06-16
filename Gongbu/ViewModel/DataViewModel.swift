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
    @Published var study: [Study]?
    
    init(){
        FirebaseApp.configure()
        let db = Firestore.firestore()
        let userDB = db.collection("User1").document("U123")
        let studyDB = db.collection("Study1").document("S123")

        userDB.getDocument(as: User.self) { result in
            switch result {
                case .success(let user):
                    // 성공했을 때
                    self.user = user
                    print("[user] : \(user)")
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
                        print("[user] : \(user)")
                    case .failure(let error):
                        // 실패했을 때
                        print("Error decoding User: \(error)")
                    }
            }
            print("Current data: \(data)")
          }
        
        studyDB.addSnapshotListener { documentSnapshot, error in
            guard let document = documentSnapshot else {
              print("Error fetching document: \(error!)")
              return
            }
            guard let data = document.data() else {
              print("Document data was empty.")
              return
            }
            studyDB.getDocument(as: Study.self) { result in
                switch result {
                    case .success(var study):
                        // 성공했을 때
                    study.id = "S123"
                    self.study?.append(study)
                        print("[study] : \(study)")
                    case .failure(let error):
                        // 실패했을 때
                        print("Error decoding Study: \(error)")
                    }
            }
            print("Current data: \(data)")
          }
        
        studyDB.getDocument(as: Study.self) { result in
            switch result {
                case .success(var study):
                    // 성공했을 때
                study.id = "S123"
                self.study?.append(study)
                    print("[study] : \(study)")
                case .failure(let error):
                    // 실패했을 때
                    print("Error decoding Study: \(error)")
                }
        }
    } // init()
    
    
    
}
