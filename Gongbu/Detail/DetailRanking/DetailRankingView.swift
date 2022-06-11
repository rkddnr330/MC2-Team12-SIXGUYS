//
//  DetailStandingView.swift
//  Gongbu
//
//  Created by Park Kangwook on 2022/06/09.
//

import SwiftUI

struct DetailRankingView: View {
    
    var body: some View {
        VStack{
            HStack {
                Text("스터디 기여도")
                    .font(.largeTitle)
                    .bold()
                    .padding(.vertical)
                Spacer()
            }
            Ranking()
        }
    }
    
}

struct DetailRankingView_Previews: PreviewProvider {
    static var previews: some View {
        DetailRankingView()
    }
}
