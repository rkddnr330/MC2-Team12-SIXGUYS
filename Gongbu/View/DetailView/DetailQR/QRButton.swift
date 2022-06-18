//
//  NFCButton.swift
//  Gongbu
//
//  Created by Park Kangwook on 2022/06/12.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct QRButton: View {
    
    @State private var showQRCode = false
    @State private var isPresentingScanner: Bool = false
    @ObservedObject var studyModel = RankingModel()
    let roomId: String
    
    var body: some View {
        
        let userID:String = Auth.auth().currentUser!.uid
        
        HStack(spacing:50){
            Button {
                print("Read 발동")
                self.isPresentingScanner = true
            } label: {
                Text("Scan")
                    .bold()
                    .font(.title)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color(red: 0.187, green: 0.417, blue: 0.533))
                    
            }
            .frame(width: 130, height: 76, alignment: .center)
            .background(Color(red: 0.187, green: 0.417, blue: 0.533))
            .cornerRadius(10)
            .sheet(isPresented: $isPresentingScanner) {
                QRScannerView(isPresentingScanner: $isPresentingScanner, roomId: roomId)
            }
            
            Button {
                
                print("Tag 발동")
                self.showQRCode = true
                
//                studyModel.fetchData(RoomId: self.roomId)
                let study = studyModel.study
                let now = Date()
        
                // set db time
                let setTime = study.time
                let setDay = study.day
                if setDay!.values.contains("\(now.toStringWeekday())요일") {
                    var db = Firestore.firestore()
                    let ref = db.collection("Study1").document(self.roomId)  // 룸 아이디 받으면 여기다가 넣어야됨ㅇㅅㅇ
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
                    else if result < 0 && result >= -1400 {
                        ref.updateData([
                            "currentAtt.\(userID)" : 1
                        ])
                    }
                }
                
            } label: {
                Text("Tag")
                    .bold()
                    .font(.title)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color(red: 0.467, green: 0.696, blue: 0.821))
            }
            .frame(width: 130, height: 76, alignment: .center)
            .background(Color(red: 0.467, green: 0.696, blue: 0.821))
            .cornerRadius(10)
            .sheet(isPresented: $showQRCode) {
                QRGenerateView(roomId: roomId)
            }
        }
        .padding(.horizontal)
        .onAppear {
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

//struct QRButton_Previews: PreviewProvider {
//    static var previews: some View {
//        QRButton()
//    }
//}
