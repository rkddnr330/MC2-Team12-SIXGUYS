//
//  DetailStandingView.swift
//  Gongbu
//
//  Created by Park Kangwook on 2022/06/09.
//

import SwiftUI

struct StudyTable {
    var teamNames = ["Sporting", "Real", "Colorado", "Minnesota"]
    var teamMP = ["2", "2", "2", "2"]
    var teamWins = ["2", "1", "0", "1"]
    var teamDraws = ["0", "1", "1", "1"]
    var teamLosses = ["0", "0", "1", "0"]
}

struct DetailStandingView: View {
    @State private var table = StudyTable()
    
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Text("랭킹")
                    .padding(.leading)
                    .frame(width: 50.0, alignment: .leading)
                Text("스터디원")
                    .padding(.leading)
                    .frame(width: 100.0, alignment: .leading)
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
                    .padding(.trailing)
            }
            .font(.subheadline)
            .foregroundColor(.gray)
            
            List(table.teamNames.indices, id:\.self) { i in
                HStack(spacing: 10) {
                    Text("\(i+1)").bold()
                    
                    Text("\(table.teamNames[i])")
                        .frame(width: 100.0, alignment: .leading)
                    Spacer()
                    Text("\(table.teamMP[i])")
                        .frame(width: 12) // replace 12 with any value for the exact result you're expecting
                    Divider()
                    Text("\(table.teamWins[i])")
                        .frame(width: 12) // doesn't have to match the above Text's width either could be any value and would still work
                    Divider()
                    Text("\(table.teamDraws[i])")
                        .frame(width: 12)
                    Divider()
                    Text("\(table.teamLosses[i])")
                        .frame(width: 12)
                }
            }
            .listStyle(.plain)
        }
    }
    
    
}

struct DetailStandingView_Previews: PreviewProvider {
    static var previews: some View {
        DetailStandingView()
    }
}
