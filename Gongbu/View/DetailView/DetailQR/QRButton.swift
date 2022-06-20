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
        
        HStack(spacing:20){
            Button {
                print("Read 발동")
                self.isPresentingScanner = true
            } label: {
                Text("QR 읽기")
                    .bold()
                    .font(.body)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color(red: 0.467, green: 0.696, blue: 0.821))
                    
            }
            .frame(width: 100, height: 76, alignment: .center)
            .background(Color(red: 0.467, green: 0.696, blue: 0.821))
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
                    else if result < 0 && result >= -10 {
                        ref.updateData([
                            "currentAtt.\(userID)" : 1
                        ])
                    }
                }
                
            } label: {
                Text("QR 생성")
                    .bold()
                    .font(.body)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color(red: 0.467, green: 0.696, blue: 0.821))
            }
            .frame(width: 100, height: 76, alignment: .center)
            .background(Color(red: 0.467, green: 0.696, blue: 0.821))
            .cornerRadius(10)
            .sheet(isPresented: $showQRCode) {
                QRGenerateView(roomId: roomId)
            }
            ///K 수정
            Button(action: {
                updateScore()
                clearData()
            }, label: {
                Text("출결 마감")
                    .bold()
                    .font(.body)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color(red: 0.187, green: 0.417, blue: 0.533))
            })
            .frame(width: 100, height: 76, alignment: .center)
            .background(Color(red: 0.187, green: 0.417, blue: 0.533))
            .cornerRadius(10)
            ///
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
    
    ///K수정
    func clearData() {
        let myUid = Auth.auth().currentUser!.uid
        let db = Firestore.firestore()
        let ref = db.collection("Study1").document(roomId)
        
        // ========================
        // 실시간 변화 확인
        // ========================
        ref.getDocument(){ result, error in
            guard let data = result!.data()!["currentAtt"] else {
                print("Document data was empty")
                return
            }
            let asdf = data as! Dictionary<String, Int>
            for key in asdf.keys{
                ref.updateData([
                    "currentAtt.\(key)": 0
                ])
            }
            print("Current data: \(asdf)")
            print(type(of: asdf))
            
        }
    }

    func updateScore() {
        // let myUid = Auth.auth().currentUser!.uid
        let db = Firestore.firestore()
        // document는 룸 아이디를 받아와야한다.
        let ref = db.collection("Study1").document(roomId)
        
        
        // ========================
        // 실시간 변화 확인
        // ========================
        ref.getDocument(){ result, error in
            guard let data = result!.data()!["currentAtt"] else {
                print("Document data was empty")
                return
            }
            guard let findId = result!.data()!["memberId"] else {
                print("Document data was empty")
                return
            }
            
            
            let asdf = data as! Dictionary<String, Int>
            for (key, value) in asdf {
                let arr = findId as! [String]
                print(arr)
                // 유저 아이디를 가지고 있는 memberID의 인덱스
                let idx:Int = arr.firstIndex(of: "\(key)")!
                print("\(key) \(idx)")
                
                // 받아온 인덱스에 스코어 만큼 더해주면 됨
                
                if value == 5 {
                    ref.updateData([
                        "numberOfAttendance.\(idx)": FieldValue.increment(Int64(1))
                    ])
                }

                else if value == 1 {
                    ref.updateData([
                        "numberOfLate.\(idx)": FieldValue.increment(Int64(1))
                    ])
                }

                else if value == 0 {
                    ref.updateData([
                        "numberOfAbsent.\(idx)": FieldValue.increment(Int64(1))
                    ])
                }
                
                ref.updateData([
                    "attendancePoint.\(idx)": FieldValue.increment(Int64(value))
                ])
            }
            print("Current data: \(asdf)")
            print(type(of: asdf))
            
        }
    }
    ///
}

//struct QRButton_Previews: PreviewProvider {
//    static var previews: some View {
//        QRButton(roomId: roomId)
//    }
//}
