//
//  Ranking.swift
//  Gongbu
//
//  Created by Park Kangwook on 2022/06/10.
//

import SwiftUI

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
                    Text("랭킹")
                        .padding(.leading)
                        .frame(width: 50.0, alignment: .leading)
                    
                    Text("멤버")
                        .padding(.horizontal)
                        .frame(width: 60.0, alignment: .center)
                    Spacer()
                    
                    Text("출석")
                    Divider()
                        .frame(height: 20.0)
                    
                    Text("지각")
                    Divider()
                        .frame(height: 20.0)
                    
                    Text("결석")
                    Divider()
                        .frame(height: 20.0)
                    
                    Text("승점")
                        .padding(.trailing, 10)
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
                .frame(width: 340, height: 500)
                
            }
            .frame(width: 330, height: 600)
        }
    }
}

struct Ranking_Previews: PreviewProvider {
    static var previews: some View {
        Ranking()
    }
}
