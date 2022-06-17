//
//  MainHeaderView.swift
//  Gongbu
//
//  Created by KiWoong Hong on 2022/06/09.
//

import SwiftUI
import Firebase

struct MainHeaderView: View {
    
    @AppStorage("log_status") var log_Status = false
    @State private var showCreateRoomModal = false
    @State private var showEnterRoomModal = false
    
    let userName: String
    
    var body: some View {
        
        let size = UIScreen.main.bounds
        
        HStack {
            Menu(content: {
                Button(action: {
                    DispatchQueue.global(qos: .background).async {
                        try? Auth.auth().signOut()
                    }
                    withAnimation(.easeInOut){
                        log_Status = false
                    }
                }, label: {
                    Text("로그아웃")
                })
            }, label: {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .scaledToFit()
            }).accentColor(.black)

            Text("\(userName)")
                .font(.title)
            Spacer()
            Menu{
                Button(action: { self.showEnterRoomModal = true }){
                    Label("방 참가", systemImage: "arrowshape.turn.up.left")
                }
                Button(action: { self.showCreateRoomModal = true }){
                    Label("방 생성", systemImage: "plus.circle")
                }
            } label: {
                Label("", image: "plusButton")
            }
            .sheet(isPresented: self.$showEnterRoomModal) {
               // Text("EnterRoomModalView")
              EnterRoomModalView()
            }
            .sheet(isPresented: self.$showCreateRoomModal) {
                // Text("CreateRoomModalView")
              CreateRoomModalView()
            }
        }
        .padding()
        .frame(width: size.width, height: size.height / 10)
    }
}
