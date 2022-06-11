//
//  StudySchedule.swift
//  Gongbu
//
//  Created by Park Kangwook on 2022/06/09.
//

import SwiftUI

struct StudySchedule: View {
    @State private var shedule = ["월요일 PM 5:00", "수요일 PM 5:00", "금요일 AM 10:00"]
    @State private var isShowing = false
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Text("일정")
                    .font(.title)
                    .foregroundColor(.black)
                    .bold()
                Spacer()
                Button {
                    isShowing = true
                    print("일정 추가")
                } label: {
                    Text("EDIT")
                        .padding(4)
                        .font(.subheadline)
                        .foregroundColor(.black)
                        .border(.black, width: 2)
                }
                .sheet(isPresented: $isShowing) {
                    Text("일정 편집 (일정 추가, 삭제)")
                    Button {
                        isShowing = false
                    } label: {
                        Text("DONE")
                    }
                    .padding()
                }
            }
            .padding(.vertical)
            
            VStack(alignment: .leading){
                ForEach(shedule, id: \.self) { index in
                    Text(index)
                }
            }
            .font(.title2)
            .padding(.vertical)
            .foregroundColor(.black)
        }
        .padding()
        .frame(width: 320, height: 200)
        .background(Color(red: 0.969, green: 0.969, blue: 0.969))
        .cornerRadius(10)
    }
}

struct StudySchedule_Previews: PreviewProvider {
    static var previews: some View {
        StudySchedule()
    }
}
