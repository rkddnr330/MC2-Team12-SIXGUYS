//
//  DetailRankingView.swift
//  Gongbu
//
//  Created by Park Kangwook on 2022/06/12.
//

import SwiftUI

struct DetailRankingView: View {
    @State private var isShowingPopover = false
    
    var body: some View {
        VStack {
            VStack{
                HStack {
                    Text("스터디 기여도")
                        .font(.largeTitle)
                        .bold()
                        .padding(.vertical)
                    Spacer()
                    Button {
                        isShowingPopover = true
                    } label: {
                        Image(systemName: "questionmark.circle")
                    }
                    .sheet(isPresented: $isShowingPopover) {
                        QuestionMarkText()
                    }
                }
                .padding(.vertical, 10)
                VStack {
                    Ranking()
                        .padding(.bottom)
                }
            }
        }
        ///x
        .frame(width: 330, height: 600)
    }
}

struct DetailRankingView_Previews: PreviewProvider {
    static var previews: some View {
        DetailRankingView()
    }
}
