//
//  EnterRoomModalView.swift
//  Gongbu
//
//  Created by kimhyeongmin on 2022/06/10.
//

import SwiftUI

struct EnterRoomModalView: View {
    
    @State var studyCode: String
    @EnvironmentObject var dataViewModel: DataViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView {
            VStack{
                List {
                    Section(header: Text("방 참가")
                        .font(.title)
                        .fontWeight(.heavy)) {
                            TextField("방 코드 입력", text: $studyCode)
                        }
                        .headerProminence(.increased)
                }
                .listStyle(InsetGroupedListStyle())
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        // 방 참가 할 수 있게 하는 액션
                    }) {
                        Text("참가")
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

//struct EnterRoomModalView_Previews: PreviewProvider {
//    static var previews: some View {
//        EnterRoomModalView(studyCode: <#T##String#>)
//    }
//}
