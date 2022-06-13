//
//  StudyListCellView.swift
//  Gongbu
//
//  Created by kimhyeongmin on 2022/06/13.
//

import SwiftUI

struct StudyListCellView: View {
    
    let joinedStudy: Study
    @State var expand = false
    
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
                        Text("\(joinedStudy.day)")
                            .foregroundColor(Color.black)
                        Spacer()
                    }.padding(6)
                    
                    Spacer()
                    
                    VStack(alignment: .trailing){
                        Text("\(joinedStudy.time)")
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
