//
//  Ranking.swift
//  Gongbu
//
//  Created by Park Kangwook on 2022/06/12.
//

import SwiftUI

///임의로 짠 모델! 이름 끝에 Demo가 붙어있습니다
struct StudyDemo {
    var codeDemo: String  // 나중에 let으로 수정
    var nameDemo: String
    var dayDemo: String  // 나중에 타입 수정 예정
    var timeDemo: String  // 나중에 타입 수정 예정
    var memberInfoDemo: [UserInfo]
    var memberAttendenceInfoDemo: [UserInfo: AttendenceInfo]
}

struct StudyTable {
    var teamNames = ["Kkoma", "Gongdol", "Terry", "Hongki"]
    var teamMP = ["2", "2", "2", "2"]
    var teamWins = ["2", "1", "0", "1"]
    var teamDraws = ["0", "1", "1", "1"]
    var teamLosses = ["0", "0", "1", "0"]
}

struct Ranking: View {
    @State private var table = StudyTable()
    
    var body: some View {
        VStack {
            VStack {
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
                
                List(table.teamNames.indices, id:\.self) { i in
                    HStack() {
                        Text("\(i+1)").bold()
                            .frame(width:20, alignment: .leading)
                        
                        Text("\(table.teamNames[i])")
                            .frame(width: 95.0, alignment: .leading)
                            .padding(.horizontal)

                        Text("\(table.teamMP[i])")
                            .frame(width: 20)
                        Divider()
                        
                        Text("\(table.teamWins[i])")
                            .frame(width: 20)
                        Divider()
                        
                        Text("\(table.teamDraws[i])")
                            .frame(width: 30)
                        Divider()
                        
                        Text("\(table.teamLosses[i])")
                            .frame(width: 20)
                    }
                }
                .listStyle(.plain)
                ///순위표 어느 크기로 보여줄 것인지
                .frame(width: 340, height: 400)
                
            }
            ///RankingView에서 타이틀 - 순위표 테이블 간격 조정
            .frame(width: 330, height: 450)
        }
    }
}

struct Ranking_Previews: PreviewProvider {
    static var previews: some View {
        Ranking()
    }
}

