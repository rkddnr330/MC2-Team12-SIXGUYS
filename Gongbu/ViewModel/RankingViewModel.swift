//
//  DetailRankingModel.swift
//  Gongbu
//
//  Created by Kyubo Shim on 2022/06/15.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase
import FirebaseFirestore

class RankingModel: ObservableObject {
    @Published var studies = [Study]()
    @Published var study = Study(id: "",title: "", day: [:], time: [:], numberOfAttendance: [:], numberOfAbsent: [:], numberOfLate: [:], attendancePoint: [:], userName: [:])
    
    private var db = Firestore.firestore()
    
    
    func fetchData(RoomId: String){
        db.collection("Study1").document(RoomId).addSnapshotListener{ documentSnapshot, error in
            guard let document = documentSnapshot else {
                return
            }
            self.study = document.data().map { (data) -> Study in
                let title = data["title"] as? String ?? ""
                let day = data["day"] as? Dictionary<String, String> ?? [:]
                let time = data["time"] as? Dictionary<String, String> ?? [:]
                let numberOfAttendance = data["numberOfAttendance"] as? Dictionary<String, Int> ?? [:]
                let numberOfAbsent = data["numberOfAbsent"] as? Dictionary<String, Int> ?? [:]
                let numberOfLate = data["numberOfLate"] as? Dictionary<String, Int> ?? [:]
                let attendancePoint = data["attendancePoint"] as? Dictionary<String, Int> ?? [:]
                let memberId = data["memberId"] as? Array<String>
                let userName = data["userName"] as? Dictionary<String, String> ?? [:]
 
                return Study(id: RoomId, title: title, day: day, time: time, numberOfAttendance: numberOfAttendance, numberOfAbsent: numberOfAbsent, numberOfLate: numberOfLate, attendancePoint: attendancePoint, memberId: memberId, userName: userName)
            }!
        }
    }
    
    
    func getFullName(id: String) -> String{
        print("[id] : \(id)")
        let db = Firestore.firestore()
        let userDB = db.collection("User1").document(id)
        var user1: User = User(id: "", fullName: "", joinedStudy: [""])
        
        userDB.getDocument(as: User.self) { result in
            switch result {
                case .success(let user):
                print("[fullName1] : \(user.fullName)")
                user1 = user
                case .failure(let error):
                    // 실패했을 때
                    print("Error decoding User: \(error)")
            }
        }
        print("[fullName] : \(user1.fullName)")
        return user1.fullName!
    }
    
}
