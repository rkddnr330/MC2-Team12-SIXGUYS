//
//  StudyListCellView.swift
//  Gongbu
//
//  Created by kimhyeongmin on 2022/06/13.
//

import SwiftUI

struct StudyListCellView: View {
    
    @State var expand = false
    @State var index: Int = 0
    @EnvironmentObject var dataViewModel: DataViewModel

    
    var body: some View {
        VStack {
            Button(action: {
                if expand {
                    self.expand.toggle()
                    // 날짜 데이터 넘기는 코드
                    print("인식 합니다.")
                }
                else {
                    self.expand.toggle()
                }
            }){
                HStack {
                    VStack(alignment: .leading){
                        // ‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️
                        // 지금은 study1을 넣었는데 스터디 id를 받아와서 거기에 맞는 뷰를 보내줘야 함
                        // 옵셔널 바인딩 구현
                        Text("\(DataViewModel.study1.day![index])")
                            .foregroundColor(Color.black)
                        Spacer()
                    }.padding(6)
                    
                    Spacer()
                    
                    VStack(alignment: .trailing){
                        // ‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️
                        // 지금은 study1을 넣었는데 스터디 id를 받아와서 거기에 맞는 뷰를 보내줘야 함
                        // 옵셔널 바인딩 구현
                        Text("\(DataViewModel.study1.time![index])")
                            .foregroundColor(Color.black)
                        Spacer()
                    }.padding(6)
                }
            }
            if expand {
                VStack{
                    Spacer().frame(height: 30)
                    PickerView()
                    Spacer().frame(height: 30)
                }
            }
            
        }
    }
}

//struct StudyListCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        StudyListCellView()
//    }
//}
