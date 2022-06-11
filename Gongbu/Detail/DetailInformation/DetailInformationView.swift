//
//  DetailInformationView.swift
//  Gongbu
//
//  Created by Park Kangwook on 2022/06/09.
//

import SwiftUI

struct DetailInformationView: View {
//    @Binding var isShowingToast: Bool
    
    var body: some View {
        VStack{
            VStack {
                HStack {
                    Text("스터디 정보")
                        .font(.largeTitle)
                        .bold()
                        .padding(.vertical)
                    Spacer()
                }
                VStack{
                    RoomCode()
                        .padding(.vertical)
                    StudySchedule()
                        .padding(.bottom)
                }
            }
            Spacer()
            Button {
                print("방 나가기")
            } label: {
                Text("방 나가기")
                    .foregroundColor(.red)
                    .bold()
            }
            .padding(.bottom, 70)
            
        }
        .frame(width: 330, height: 700)
    }
}

struct DetailInformationView_Previews: PreviewProvider {
    static var previews: some View {
        DetailInformationView()
    }
}
