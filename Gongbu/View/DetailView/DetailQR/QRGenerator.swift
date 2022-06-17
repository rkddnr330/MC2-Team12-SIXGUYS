//
//  QRGenerator.swift
//  Gongbu
//
//  Created by Jinsan Kim on 2022/06/13.
//

import SwiftUI
import FirebaseFirestoreSwift
import Firebase

struct QRGenerateView: View {
    
    let roomID: String
    @ObservedObject var studyModel = RankingModel()
    
    var body: some View {
        let userID:String = Auth.auth().currentUser!.uid
        VStack {
            Image(uiImage: UIImage(data: returnData(str: self.roomID))!)
                .resizable()
                .frame(width: 150, height: 150)
            
        }
        .padding()
        .onAppear{
            let study = studyModel.study
            let now = Date()
            // set db time
            let setTime = study.time
            let setDay = study.day
            if setDay!.values.contains("\(now.toStringWeekday())요일") {
                var db = Firestore.firestore()
                let ref = db.collection("Study1").document(self.roomID)  // 룸 아이디 받으면 여기다가 넣어야됨ㅇㅅㅇ
                let setDayKey:String = setDay!.someKey(forValue: "\(now.toStringWeekday())요일") ?? ""
                let preparedTime = setTime![setDayKey]
                let result = calculateTime(time: preparedTime!) - calculateTime(time: now.toStringTime())
                print(result)
                
                //--------------
                // 출석 완료
                //--------------
                if result >= 0 {
                    ref.updateData([
                        "currentAtt.\(userID)" : 5
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
    
    func returnData(str: String) -> Data {
        let filter = CIFilter(name: "CIQRCodeGenerator")
        let data = str.data(using: .ascii, allowLossyConversion: false)
        filter?.setValue(data, forKey: "inputMessage")
        let image = filter?.outputImage
        let uiimage = UIImage(ciImage: image!)
        return uiimage.pngData()!
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
