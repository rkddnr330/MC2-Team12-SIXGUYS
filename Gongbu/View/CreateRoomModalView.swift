//
//  CreateRoomModalView.swift
//  Gongbu
//
//  Created by kimhyeongmin on 2022/06/10.
//

import SwiftUI

struct CreateRoomModalView: View {
    
    @Binding var studyName: String
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var userViewModel: UserViewModel = UserViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                List {
                    Section(header: Text("방 제목")
                        .font(.title)
                        .fontWeight(.heavy)) {
                            TextField("방 이름 입력", text: $studyName)
                        }
                        .headerProminence(.increased)
                    Section(header: Text("스터디 시각")
                        .font(.title)
                        .fontWeight(.heavy)) {
                            StudyListView(userViewModel: userViewModel)
                        }
                        .headerProminence(.increased)
                }
                .listStyle(InsetGroupedListStyle())
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        // 방 생성 할 수 있는 액션
                    }) {
                        Text("생성")
                            .font(.title2)
                            .fontWeight(.semibold)
                    }
                }
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("취소")
                            .font(.title2)
                            .fontWeight(.semibold)
                    }
                }
            }
        }
    }
}

struct CreateRoomModalView_Previews: PreviewProvider {
    static var previews: some View {
        CreateRoomModalView(studyName: .constant(""))
    }
}
