//
//  MainListView.swift
//  Gongbu
//
//  Created by KiWoong Hong on 2022/06/09.
//

import SwiftUI

struct MainListView: View {
    
    @ObservedObject var userViewModel: UserViewModel
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem()], content: {
                ForEach(userViewModel.user.joinedStudy, id:\.name, content: { joined in
                    NavigationLink {
                        Text("\(joined.name)")
                    } label: {
                        MainListCellView(joinedStudy: joined)
                            .accentColor(.black)
                    }
                })
            })
        }
    }
}
