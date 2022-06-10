//
//  MainHeaderView.swift
//  Gongbu
//
//  Created by KiWoong Hong on 2022/06/09.
//

import SwiftUI

struct MainHeaderView: View {
    
    @ObservedObject var userViewModel: UserViewModel
    
    var body: some View {
        
        let size = UIScreen.main.bounds
        
        HStack {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .scaledToFit()
            Text("\(userViewModel.user.userInfo.lastName)\(userViewModel.user.userInfo.firstName)")
                .font(.title)
            Spacer()
            Button(action: {
            }, label: {
                Image(systemName: "plus")
                    .resizable()
                    .scaledToFit()
                    .accentColor(.black)
                    .padding(5)
            })
        }
        .padding()
        .frame(width: size.width, height: size.height / 10)
    }
}
