//
//  HomeView.swift
//  Gongbu
//
//  Created by Kyubo Shim on 2022/06/05.
//

import SwiftUI
import Firebase

struct HomeView: View {
    @AppStorage("log_status") var log_Status = false
    
    var body: some View {
        NavigationView {
            VStack{
                Text("로그인 성공! 환영합니다!")
                
                Button(action: {
                    DispatchQueue.global(qos: .background).async {
                        try? Auth.auth().signOut()
                    }
                    
                    // setting back view to login
                    withAnimation(.easeInOut){
                        log_Status = false
                    }
                }, label: {
                    Text("로그아웃")
                        .fontWeight(.bold)
                        .padding(.vertical, 20)
                })
            }
            .navigationTitle("메인화면")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
