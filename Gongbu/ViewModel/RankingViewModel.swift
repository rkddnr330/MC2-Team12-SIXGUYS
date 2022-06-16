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
    @Published var study = Study(title: "", numberOfAttendance: [:], numberOfAbsent: [:], numberOfLate: [:], attendancePoint: [:])
    
    private var db = Firestore.firestore()
    
    func fetchDate(){
        db.collection("Study1").addSnapshotListener{(querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No Documents")
                return
            }
            
            self.studies = documents.map{ (queryDocumentSnapshot) -> Study in
                let data = queryDocumentSnapshot.data()
                
                let title = data["title"] as? String ?? ""
                let day = data["day"] as? Array<String>
                let time = data["time"] as? Array<String>
                let numberOfAttendance = data["numberOfAttendance"] as? Dictionary<String, Int> ?? [:]
                let numberOfAbsent = data["numberOfAbsent"] as? Dictionary<String, Int> ?? [:]
                let numberOfLate = data["numberOfLate"] as? Dictionary<String, Int> ?? [:]
                let attendancePoint = data["attendancePoint"] as? Dictionary<String, Int> ?? [:]
                let memberId = data["memberId"] as? Array<String>
                
                
                return Study(title: title, day: day, time: time, numberOfAttendance: numberOfAttendance, numberOfAbsent: numberOfAbsent, numberOfLate: numberOfLate, attendancePoint: attendancePoint, memberId: memberId)
            }
        }
    }
    
    func fetchData(RoomId: String){
        db.collection("Study1").document(RoomId).addSnapshotListener{ documentSnapshot, error in
            guard let document = documentSnapshot else {
                return
            }
            self.study = document.data().map { (data) -> Study in
                let title = data["title"] as? String ?? ""
                let day = data["day"] as? Array<String>
                let time = data["time"] as? Array<String>
                let numberOfAttendance = data["numberOfAttendance"] as? Dictionary<String, Int> ?? [:]
                let numberOfAbsent = data["numberOfAbsent"] as? Dictionary<String, Int> ?? [:]
                let numberOfLate = data["numberOfLate"] as? Dictionary<String, Int> ?? [:]
                let attendancePoint = data["attendancePoint"] as? Dictionary<String, Int> ?? [:]
                let memberId = data["memberId"] as? Array<String>
                
                return Study(title: title, day: day, time: time, numberOfAttendance: numberOfAttendance, numberOfAbsent: numberOfAbsent, numberOfLate: numberOfLate, attendancePoint: attendancePoint, memberId: memberId)
            }!
        }
    }
}
