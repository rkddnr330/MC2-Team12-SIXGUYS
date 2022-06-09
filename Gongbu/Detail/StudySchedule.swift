//
//  StudySchedule.swift
//  Gongbu
//
//  Created by Park Kangwook on 2022/06/09.
//

import SwiftUI

struct StudySchedule: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Text("일정")
                    .font(.title)
                    .foregroundColor(.black)
                    .bold()
                Spacer()
                Button {
                    print("일정 추가")
                } label: {
                    Image(systemName: "plus.square")
                        .font(.title)
                        .foregroundColor(.black)
                }
            }
            .padding(.vertical)
            VStack(alignment: .leading){
                Text("월요일 PM 5:00")
                Text("수요일 PM 5:00")
                Text("금요일 AM 10:00")
            }
            .font(.title2)
            .padding(.vertical)
            .foregroundColor(.black)
        }
        .padding()
        .frame(width: 350, height: 200)
        .background(Color(red: 0.969, green: 0.969, blue: 0.969))
        .cornerRadius(10)
    }
}

struct StudySchedule_Previews: PreviewProvider {
    static var previews: some View {
        StudySchedule()
    }
}
