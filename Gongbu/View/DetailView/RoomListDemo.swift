//
//  RoomListDemo.swift
//  Gongbu
//
//  Created by Park Kangwook on 2022/06/12.
//

import SwiftUI

struct RoomListDemo: View {
    @State private var isNew = false
    @State private var isAdd = false
    @State private var roomCount = 5

    var body: some View {
        NavigationView{
            VStack {
                List(0 ..< roomCount, id:\.self) { num in
                    NavigationLink( destination: DetailView()){
                        Text("스터디\(num)")
                            .padding()
                    }
                }
                Spacer()
            }
            .navigationTitle("스터디 목록")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Button( action: new ) {
                            Label("새로운 방 개설", systemImage: "pencil")
                        }
                        Button( action: add ) {
                            Label("기존 방에 입장", systemImage: "pencil")
                        }
                    } label: {
                        Image(systemName: "ellipsis.circle")
                    }
                    .sheet(isPresented: $isNew) {
                        Button("새로운 방 개설") {
                            addNewRoom()
                            isNew.toggle()
                        }
                    }
                    .sheet(isPresented: $isAdd) {
                        Text("Add!")
                    }
                }
            }
        }
    }
    func new() { isNew.toggle() }
    func add() { isAdd.toggle() }
    func addNewRoom() {
        roomCount += 1
    }
}

struct RoomListDemo_Previews: PreviewProvider {
    static var previews: some View {
        RoomListDemo()
    }
}
