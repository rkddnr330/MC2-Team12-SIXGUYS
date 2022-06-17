//
//  UserGrid.swift
//  Gongbu
//
//  Created by Park Kangwook on 2022/06/12.
//

import SwiftUI
import Firebase
import FirebaseFirestore

//https://swiftobc.com/repo/Q-Mobile-QGrid-swift-table-view
//Qgrid 라는 게 있는데, 자동으로 grid 만들어주는 라이브러리? 같은 거. 설치해서 사용하는 거
struct UserGrid: View {
    
    @ObservedObject var currentViewModel = QRViewModel()
    @ObservedObject var studyModel = RankingModel()
    let roomId: String
    
    //LazyVGrid에서 3*3 형태의 Grid 쓰려면 3개의 GridItem을 columns에 추가
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        VStack{
            
            let study = studyModel.study
            let now = Date()
            // set db time
            let setDay = study.day
            
            let current = currentViewModel.currentAttendance
            
            LazyVGrid(columns: columns) {
                ForEach(current.sorted(by: <), id: \.key) { key, value in
                    VStack (alignment: .center) {
                        if setDay!.values.contains("\(now.toStringWeekday())요일") {
                            
                            if value == 5 {
                                Image("attend")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 70, height: 70)
                            } else if value == 1 {
                                Image("late")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 70, height: 70)
                                
                            } else if value == 0 {
                                Image("absent")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 70, height: 70)
                            }
                        } else {
                            Image("basic")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 70, height: 70)
                        }
                        let realName:String = studyModel.study.userName?["\(key)"] ?? "empty"
                        Text(realName)
                            .bold()
                    }
                }
            }
        }
        .onAppear{
            currentViewModel.fetchData(RoomId: roomId)
            studyModel.fetchData(RoomId: roomId)
        }
    }
}

//struct UserGrid_Previews: PreviewProvider {
//    static var previews: some View {
//        UserGrid()
//    }
//}
