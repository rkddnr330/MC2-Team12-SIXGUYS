//
//  QuestionMarkText.swift
//  Gongbu
//
//  Created by Park Kangwook on 2022/06/13.
//

import SwiftUI

struct QuestionMarkText: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("스터디 기여도란?")
                    .font(.largeTitle)
                    .bold()
                    .padding(.vertical)
                Spacer()
            }
            Text("스터디원들이 우리 스터디에 얼마나 기여했는지 알 수 있는 지표입니다. 출석은 3점, 지각은 1점, 지각은 0점으로 계산하였고, 각자의 승점을 순위표로 나타내 보았습니다! 누가 얼마나 스터디에 자주 참여했는지, 누가 제일 열심히 하는지 한 눈에 파악하기 쉽겠죠? 지금도 누군가는 내 순위를 호시탐탐 노리고 있다구요!")
                .font(.headline)
                .lineSpacing(6)
                .frame(width: 300)
                .padding(.vertical)
            
            VStack(alignment: .leading) {
                Text("R").bold() + Text(" : Ranking, 순위")
                //                .padding(.vertical, 1)
                
                Text("T").bold() + Text(" : Total score, 승점")
                //                .padding(.vertical, 1)
                HStack {
                    Image(systemName: "person.circle")
                        .frame(width: 10.0)
                    Text(" 스터디원")
                }
                HStack {
                    Circle()
                        .frame(width: 10, height: 20)
                        .foregroundColor(.green)
                    Text(" 출석")
                        .padding(.trailing)
                    
                    Circle()
                        .frame(width: 10, height: 20)
                        .foregroundColor(.yellow)
                    Text(" 지각")
                        .padding(.trailing)
                    
                    Circle()
                        .frame(width: 10, height: 20)
                        .foregroundColor(.red)
                    Text(" 결석")
                }
            }
            .padding(17)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(lineWidth: 0.5)
            )
//            .padding(.vertical)
            .frame(width:290)
        }
        .frame(width: 300, height: 600)
        .padding(.bottom, 200)
    }
}

struct QuestionMarkText_Previews: PreviewProvider {
    static var previews: some View {
        QuestionMarkText()
    }
}
