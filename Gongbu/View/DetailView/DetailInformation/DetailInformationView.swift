//
//  DetailInformationView.swift
//  Gongbu
//
//  Created by Park Kangwook on 2022/06/12.
//

import SwiftUI

struct DetailInformationView: View {
    @State private var isShowingActionSheet = false
    var roomId: String
    
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
                    RoomCode(roomId: roomId)
                        .padding(.vertical)
                    StudySchedule(roomId: roomId)
                        .padding(.bottom)
                }
            }
            Spacer()
            Button {
                print("방 나가기 버튼 터치")
                isShowingActionSheet = true
            } label: {
                Text("방 나가기")
                    .foregroundColor(.red)
                    .bold()
            }
            .padding(.bottom, 70)
            .actionSheet(isPresented: $isShowingActionSheet) {
                ActionSheet(
                    title: Text("정말 나가시겠습니까?"),
                    buttons: [
                        .destructive(Text("방 나가기")){
                            ///방 나가는 코드
                            print("방 나가기 로직 활성")
                            
                        },
                        .cancel()
                    ]
                )
            }
        }
        .frame(width: 330, height: 700)
    }
}


//struct DetailInformationView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailInformationView()
//    }
//}
