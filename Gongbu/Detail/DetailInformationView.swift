//
//  DetailInformationView.swift
//  Gongbu
//
//  Created by Park Kangwook on 2022/06/09.
//

import SwiftUI

struct DetailInformationView: View {
    var body: some View {
        VStack{
        VStack(spacing: 100) {
            HStack {
                Text("스터디 정보")
                    .font(.title)
                    .bold()
                    .padding()
                Spacer()
            }
            RoomCode()
            StudySchedule()
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
        .frame(width: 350, height: 700)
    }
}

struct DetailInformationView_Previews: PreviewProvider {
    static var previews: some View {
        DetailInformationView()
    }
}
