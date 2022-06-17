//
//  DetailQRViewModel.swift
//  Gongbu
//
//  Created by Kyubo Shim on 2022/06/16.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase
import FirebaseFirestore



class QRViewModel: ObservableObject {
    // @Published var study = Study(title: "", numberOfAttendance: [:], numberOfAbsent: [:], numberOfLate: [:], attendancePoint: [:])
    @Published var currentAttendance:[String: Int] = [:]
    
    private var db = Firestore.firestore()
    
    func fetchData(RoomId: String){
        db.collection("Study1").document(RoomId).addSnapshotListener{ documentSnapshot, error in
            guard let document = documentSnapshot else {
                return
            }
            self.currentAttendance = document.data().map{ data -> [String:Int] in
                let current = data["currentAtt"] as? Dictionary<String, Int> ?? [:]
                return current
            }!
        }
    }
    
    func updateData(RoomId: String, UserId: String, studyObject: Study){
        let ref = db.collection("Study1").document(RoomId)
        let now = Date()
        let realtime = now.toStringTime()
        let setTime = studyObject.time
        let setDay = studyObject.day
        let preparedTime:String = "오후 03:00"
        let result = calculateTime(time: preparedTime) - calculateTime(time: realtime)
        
        // ========================
        // 출석 완료
        // ========================
        if result >= 0 {
            ref.updateData([
                "Current.\(UserId)": 5
            ])
        }
        
        // ========================
        // 지각
        // ========================
        else if result < 0 && result >= -20 {
            ref.updateData([
                "Current.\(UserId)": 1
            ])
        }
    }
    
    // 시간 차이 계산
    func calculateTime(time:String) -> Int{
        let ampm = time.components(separatedBy: " ")
        var calAmpm:Int = 0
        let temp = String(ampm[0]) // AM PM
        if(temp == "오후") {
            calAmpm = 12
        }
        let arr = ampm[1].components(separatedBy: ":")
        let hour = 60 *  Int(arr[0])!
        let min = Int(arr[1])!
        return hour + min + (60 * calAmpm)
    }
}
