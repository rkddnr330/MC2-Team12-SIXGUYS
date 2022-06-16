//
//  MainView.swift
//  Gongbu
//
//  Created by KiWoong Hong on 2022/06/09.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var data: DataViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                MainHeaderView(userName: data.user?.fullName ?? "noname")
                MainListView()
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
