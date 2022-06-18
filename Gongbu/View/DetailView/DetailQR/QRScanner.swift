//
//  QRScanner.swift
//  Gongbu
//
//  Created by Jinsan Kim on 2022/06/13.
//

import SwiftUI
import CodeScanner
import FirebaseFirestoreSwift
import Firebase

extension Dictionary where Value: Equatable {
    func someKey(forValue val: Value) -> Key? {
        return first(where: { $1 == val })?.key
    }
}


struct QRScannerView: View {
    
    @Binding var isPresentingScanner: Bool
    @State private var scannedCode: String?
    @ObservedObject var studyModel = RankingModel()
    let roomId: String
    
    
    var body: some View{
         let userID:String = Auth.auth().currentUser!.uid // 실행시 꼭 주석 해제하기!!!!
//        let userID:String = "zlFvXcUxhoaBlaESJEhbtaVCrTF2"
        
//        let study = studyModel.study
//        let now = Date()
//        // set db time
//        let setTime = study.time
//        let setDay = study.day
        
        CodeScannerView(codeTypes: [.qr],
                        completion: { response in
            if case let .success(code) = response {
                
                self.scannedCode = code.string
                self.isPresentingScanner = false
                let study = studyModel.study
                let now = Date()
                // set db time
                let setTime = study.time
                let setDay = study.day
                
                if let scannedCode = scannedCode {
                    if setDay!.values.contains("\(now.toStringWeekday())요일") {
                        var db = Firestore.firestore()
                        let ref = db.collection("Study1").document(scannedCode)  // 룸 아이디 받으면 여기다가 넣어야됨ㅇㅅㅇ
                        let setDayKey:String = setDay!.someKey(forValue: "\(now.toStringWeekday())요일") ?? ""
                        let preparedTime = setTime![setDayKey]
                        let result = calculateTime(time: preparedTime!) - calculateTime(time: now.toStringTime())
                        print(result)
                        
                        //--------------
                        // 출석 완료
                        //--------------
                        if result >= 0 {
                            ref.updateData([
                                "currentAtt.\(userID)" : 0
                            ])
                        }
                        
                        //--------------
                        // 지각
                        //--------------
                        else if result < 0 && result >= -10 {
                            ref.updateData([
                                "currentAtt.\(userID)" : 1
                            ])
                        }
                    }
                }
            }
        })
        .onAppear{
            studyModel.fetchData(RoomId: roomId)
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
