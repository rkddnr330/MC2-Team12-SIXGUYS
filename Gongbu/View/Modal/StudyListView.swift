//
//  StudyListView.swift
//  Gongbu
//
//  Created by kimhyeongmin on 2022/06/13.
//

import SwiftUI

struct StudyListView: View {
    @EnvironmentObject var data: DataViewModel
    @State var expand = false
    @State var index = 0
    @Binding var newDay: [String]
    @Binding var newTime: [String]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem()], content: {
                // ‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️
                // 지금은 study1을 넣었는데 스터디 id를 받아와서 거기에 맞는 뷰를 보내줘야 함
                // 옵셔널 바인딩 구현
                ForEach(data.study!.day.indices, id: \.self, content: { index in
                    StudyListCellView(index: index)
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
