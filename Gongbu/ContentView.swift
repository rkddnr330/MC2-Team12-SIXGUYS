//
//  ContentView.swift
//  Gongbu
//
//  Created by Terry Koo on 2022/05/27.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("log_status") var log_Status = false
    var body: some View {
        ZStack{
            if log_Status {
                HomeView()
            }
            else{
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
