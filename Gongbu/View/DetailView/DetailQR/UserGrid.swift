//
//  UserGrid.swift
//  Gongbu
//
//  Created by Park Kangwook on 2022/06/12.
//

import SwiftUI

//https://swiftobc.com/repo/Q-Mobile-QGrid-swift-table-view
//Qgrid 라는 게 있는데, 자동으로 grid 만들어주는 라이브러리? 같은 거. 설치해서 사용하는 거
//임의의 스터디 정보
struct Studyy: Identifiable {
    let id = UUID()
    var user: [String] = ["a","b","c","d","e"]
}

struct UserGrid: View {
    //LazyVGrid에서 3*3 형태의 Grid 쓰려면 3개의 GridItem을 columns에 추가
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    @State private var study = Studyy()
    
    var body: some View {
        VStack{
            LazyVGrid(columns: columns) {
                ForEach(0 ..< Int(study.user.count)) { value in
                    VStack (alignment: .center) {
                        Circle()
                            .stroke(Color.pink.opacity(0.5), lineWidth: 3)
                            .frame(width: 70, height: 70)
                        Text(study.user[value])
                            .bold()
                    }
                }
            }
        }
    }
}

struct UserGrid_Previews: PreviewProvider {
    static var previews: some View {
        UserGrid()
    }
}
