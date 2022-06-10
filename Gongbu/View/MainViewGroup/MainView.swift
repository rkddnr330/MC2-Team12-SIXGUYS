//
//  MainView.swift
//  Gongbu
//
//  Created by KiWoong Hong on 2022/06/09.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var userViewModel: UserViewModel = UserViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                MainHeaderView(userViewModel: userViewModel)
                MainListView(userViewModel: userViewModel)
                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
