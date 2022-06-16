//
//  CreateRoomModalView.swift
//  Gongbu
//
//  Created by kimhyeongmin on 2022/06/10.
//

import SwiftUI

struct CreateRoomModalView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var studyName: String = ""
    @State var newDay: [String : String] = ["0" : "\(Date().toStringWeekday())요일"]
    @State var newTime: [String : String] = ["0" : "\(Date().toStringTime())"]
    
    @State private var date = Date()
    @State private var selectedTime = Date()
    @EnvironmentObject var data: DataViewModel
    @State private var expand: [Bool] = [false]
    var weekdays = ["일", "월", "화", "수", "목", "금", "토"]
    @State var stringIndex: String = "0"
    
    @State private var selectedWeekday = Calendar.current.component(.weekday, from: Date()) - 1
    @State private var nowWeekday = Calendar.current.component(.weekday, from: Date()) - 1
    
    var body: some View {
        NavigationView {
            VStack{
                List {
                    Section(header: Text("방 제목")
                        .font(.title)
                        .fontWeight(.heavy)) {
                            TextField("방 이름 입력", text: $studyName)
                        }
                        .headerProminence(.increased)
                    Section(header: Text("스터디 시각")
                        .font(.title)
                        .fontWeight(.heavy)) {
                            ScrollView {
                                LazyVGrid(columns: [GridItem()], content: {
                                    ForEach(expand.indices, id: \.self, content: { index in
                                        Button(action: {
                                            if expand[index] { // 타임 피커 닫혔을 때
                                                self.expand[index].toggle()
                                                stringIndex = "\(index)"
                                                newDay["\(index)"] = "\(weekdays[selectedWeekday])요일"
                                                newTime["\(index)"] = "\(selectedTime.toStringTime())"
                                            }
                                            else {  // 타임 피커 열렸을 때
                                                self.expand[index].toggle()
                                            }
                                        }){
                                            HStack {
                                                VStack(alignment: .leading){
                                                    Text(expand[index] ? "\(weekdays[selectedWeekday])요일" : (newDay["\(index)"])!)
                                                        .foregroundColor(Color.black)
                                                    Spacer()
                                                }.padding(6)
                                                
                                                Spacer()
                                                
                                                VStack(alignment: .trailing){
                                                    Text(expand[index] ? "\(selectedTime.toStringTime())" : (newTime["\(index)"])!)
                                                        .foregroundColor(Color.black)
                                                    Spacer()
                                                }.padding(6)
                                            }
                                        }
                                        if expand[index] {
                                            VStack{
                                                Spacer().frame(height: 30)
                                                VStack{  // 피커 뷰
                                                    Picker("", selection: $selectedWeekday) {
                                                        ForEach(0 ..< weekdays.count) {
                                                            Text(self.weekdays[$0])
                                                        }
                                                    }
                                                    .pickerStyle(.segmented)
                                                    .labelsHidden()
                                                    
                                                    DatePicker("", selection: $selectedTime, displayedComponents: .hourAndMinute)
                                                        .datePickerStyle(.wheel)
                                                }
                                                .labelsHidden()
                                                Spacer().frame(height: 30)
                                            }
                                        }
                                    })
                                })
                                Spacer()
                                VStack(alignment: .leading) {
                                    Button(action: {
                                        expand.append(false)
                                        stringIndex = "\(Int(stringIndex)!+1)"
                                        newDay.updateValue("\(weekdays[nowWeekday])요일", forKey: stringIndex)
                                        newTime.updateValue("\(date.toStringTime())", forKey: stringIndex)
                                    }){
                                        Label("일정 추가", systemImage: "plus.circle.fill")
                                            .padding(6.0)
                                    }
                                }
                            }
                        }
                        .headerProminence(.increased)
                }
                .listStyle(InsetGroupedListStyle())
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        newDay[stringIndex] = "\(weekdays[selectedWeekday])요일"
                        newTime[stringIndex] = "\(selectedTime.toStringTime())"
                        
                        // --------------- 나중에 지워주세요 --------------------
                        // 이거 3개 데이터 전송 하면 됩니다.
                        print(studyName)  // Type : String
                        print(newDay)  //  Type : [String]
                        print(newTime)  //  Type : [String]
                        // 방 생성 함수 여기에 구현하시면 됩니다.
                        //data.createRoom(title: studyName)
                        // --------------- 나중에 지워주세요 --------------------
                        
                        data.createRoom(title: studyName, days: newDay, times: newTime)
                        self.presentationMode.wrappedValue.dismiss()
                        
                    }) {
                        Text("생성")
                            .font(.title2)
                            .fontWeight(.semibold)
                    }
                }
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("취소")
                            .font(.title2)
                            .fontWeight(.semibold)
                    }
                }
            }
        }
    }
}


struct CreateRoomModalView_Previews: PreviewProvider {
    static var previews: some View {
        CreateRoomModalView()
    }
}
