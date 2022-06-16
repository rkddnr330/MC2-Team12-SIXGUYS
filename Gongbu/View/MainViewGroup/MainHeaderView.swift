//
//  MainHeaderView.swift
//  Gongbu
//
//  Created by KiWoong Hong on 2022/06/09.
//

import SwiftUI

struct MainHeaderView: View {
    
    @State private var showCreateRoomModal = false
    @State private var showEnterRoomModal = false
    
    let userName: String
    
    var body: some View {
        
        let size = UIScreen.main.bounds
        
        HStack {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .scaledToFit()
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
                EnterRoomModalView()
            }
            .sheet(isPresented: self.$showCreateRoomModal) {
                CreateRoomModalView()
            }
        }
        .padding()
        .frame(width: size.width, height: size.height / 10)
    }
}
