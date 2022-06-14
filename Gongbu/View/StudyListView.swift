//
//  StudyListView.swift
//  Gongbu
//
//  Created by kimhyeongmin on 2022/06/13.
//

import SwiftUI

struct StudyListView: View {
    
    @ObservedObject var userViewModel: UserViewModel
    @State var expand = false
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem()], content: {
                ForEach(userViewModel.user.joinedStudy[0].schedule, id:\.self, content: { scheduled in
                    StudyListCellView(schedule: scheduled, userViewModel: userViewModel)
                })
            })
            Spacer()
            VStack(alignment: .leading) {
                Button(action: {
                    // 리스트 추가하는 코드
                }){
                    Label("일정 추가", systemImage: "plus.circle.fill")
                        .padding(6.0)
                }
            }
        }
    }
}

//struct StudyListView_Previews: PreviewProvider {
//    static var previews: some View {
//        StudyListView()
//    }
//}
