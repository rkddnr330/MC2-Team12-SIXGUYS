//
//  MainView.swift
//  Gongbu
//
//  Created by KiWoong Hong on 2022/06/09.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var data: DataViewModel = DataViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                MainHeaderView(userName: data.user?.fullName ?? "Loading")
                MainListView()
                Spacer()
            }
            .environmentObject(data)
            .navigationBarHidden(true)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
