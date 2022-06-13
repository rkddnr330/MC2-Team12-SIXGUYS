//
//  MainListItemView.swift
//  Gongbu
//
//  Created by KiWoong Hong on 2022/06/09.
//

import SwiftUI

struct MainListCellView: View {
    
    let joinedStudy: Study
    
    var body: some View {
        let size = UIScreen.main.bounds
        VStack {
            HStack {
                Text(joinedStudy.name)
                    .padding(.leading, 8)
                    .padding(.top)
                    .font(.title)
                Spacer()
            }
            HStack {
                Text("매주  ")
                Spacer()
                Image(systemName: "person.fill")
                Text("\(joinedStudy.memberInfo.count)")
            }
            .foregroundColor(.white)
            .padding(5)
            .background(Color("MainColor"))
        }
        .frame(width: size.width - 20, height: (size.width - 20) / 4)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(content: {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color("MainColor"), lineWidth: 5)
        })
        .padding(5)
    }
}

