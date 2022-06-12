//
//  DetailRankingView.swift
//  Gongbu
//
//  Created by Park Kangwook on 2022/06/12.
//

import SwiftUI

struct DetailRankingView: View {
    
    var body: some View {
        VStack {
            VStack{
                HStack {
                    Text("스터디 기여도")
                        .font(.largeTitle)
                        .bold()
                        .padding(.vertical)
                    Spacer()
                }
                VStack {
                    Ranking()
                        .padding(.bottom)
                }
            }
        }
        .frame(width: 330, height: 700)
    }
}

struct DetailRankingView_Previews: PreviewProvider {
    static var previews: some View {
        DetailRankingView()
    }
}
