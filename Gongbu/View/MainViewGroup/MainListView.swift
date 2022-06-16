//
//  MainListView.swift
//  Gongbu
//
//  Created by KiWoong Hong on 2022/06/09.
//

import SwiftUI

struct MainListView: View {
    @EnvironmentObject var data: DataViewModel
   

    var body: some View {
//        Text(data.study!.title!)
        ScrollView {
            LazyVGrid(columns: [GridItem()], content: {
                ForEach(data.study ?? [] , id:\.self.id, content: { room in
                    NavigationLink {
                        DetailView(roomId: room.id)
                    } label: {
                        MainListCellView(joinedStudy: room)
                            .accentColor(.black)
                    }
                })
            })
        }
    }
}
