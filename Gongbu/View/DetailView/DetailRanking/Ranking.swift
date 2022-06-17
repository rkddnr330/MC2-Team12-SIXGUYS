//
//  Ranking.swift
//  Gongbu
//
//  Created by Park Kangwook on 2022/06/12.
//

import SwiftUI

struct Ranking: View {
    @ObservedObject private var rankingModel = RankingModel()
    var roomId: String
    
    var body: some View {
        VStack {
            VStack {
                ///순위표 요소들
                HStack() {
                    Text("R")
                        .padding(.leading,27)
                        .frame(width: 60.0, alignment: .leading)

                    Image(systemName: "person.circle")
                        .padding(.trailing)
                        .frame(width: 110.0, alignment: .center)

                    Circle()
                        .frame(width: 30, height: 10, alignment: .center)
                        .foregroundColor(.green)

                    Circle()
                        .frame(width: 30, height: 10, alignment: .center)
                        .foregroundColor(.orange)

                    Circle()
                        .frame(width: 30, height: 10, alignment: .center)
                        .foregroundColor(.red)

                    Text("T")
                        .frame(width: 40, height: 10, alignment: .center)
                        .padding(.trailing)
                }
                .font(.subheadline)
                .foregroundColor(.gray)

                List{
                    ForEach(rankingModel.study.attendancePoint!.sorted(by: <), id:\.key) { key, value in
                        HStack{
                            Text("\(Int(key)!+1)") //String을 Int로 바꾸는 법?!
                                .frame(width:20, alignment: .leading)
                            
                            //Text(rankingModel.getFullName(id: rankingModel.study.memberId![Int(key)!]))
                            let uuid = rankingModel.study.memberId![Int(key)!]
                            
                            Text("\(rankingModel.study.userName![uuid]!)")
                            // Text(rankingModel.study.userName?["\(key)"] ?? "empty")
                            //String을 Int로 바꾸는 법?!
                                .frame(width: 95.0, alignment: .leading)
                                .padding(.horizontal)
                            
                            Text("\(rankingModel.study.numberOfAttendance![key]!)")
                                .frame(width: 20)
                            Divider()

                            Text("\(rankingModel.study.numberOfLate![key]!)")
                                .frame(width: 20)
                            Divider()

                            Text("\(rankingModel.study.numberOfAbsent![key]!)")
                                .frame(width: 30)
                            Divider()
                            ///build는 되는데 numberOfAbsent를 추출하니까 nil값이라는데???
                            ///Dictionary형식이 아니었다고 함.

                            Text("\(value)")
                                .frame(width: 20)
                        }.font(.body)
                    }
                }
                .listStyle(.plain)
                .frame(width: 340, height: 400)
                
            }
            ///RankingView에서 타이틀 - 순위표 테이블 간격 조정
            .frame(width: 330, height: 450)
            
        }
        .onAppear(){
            self.rankingModel.fetchData(RoomId: roomId)
        }
        .frame(width: 320)
        .background(Color(red: 0.969, green: 0.969, blue: 0.969))
        .cornerRadius(10)
    }
        
}

//struct Ranking_Previews: PreviewProvider {
//    static var previews: some View {
//        Ranking()
//    }
//}
//
