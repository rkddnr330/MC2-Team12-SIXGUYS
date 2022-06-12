//
//  MainView.swift
//  Gongbu
//
//  Created by kimhyeongmin on 2022/06/10.
//

import SwiftUI

struct mainView2: View {
    @State private var showCreateRoomModal = false
    @State private var showEnterRoomModal = false
    @State var study = UserViewModel.study1
    
    var body: some View {
        
        NavigationView {
            VStack{
                Text("대충 스터디 리스트 보일 예정")
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Menu{
                        Button(action: {
                            self.showEnterRoomModal = true
                        }){
                            Label("방 참가", systemImage: "arrowshape.turn.up.left")
                        }
                        Button(action: {
                            self.showCreateRoomModal = true
                        }){
                            Label("방 생성", systemImage: "plus.circle")
                        }
                    } label: {
                        Label("", image: "plusButton")
                    }
                    .sheet(isPresented: self.$showEnterRoomModal) {
                        EnterRoomModalView(studyCode: $study.code)
                    }
                    .sheet(isPresented: self.$showCreateRoomModal) {
                        CreateRoomModalView(studyName: $study.name)
                    }
                }
            }
        }
    }
}

struct mainView2_Previews: PreviewProvider {
    static var previews: some View {
        mainView2()
    }
}
