//
//  StudySchedule.swift
//  Gongbu
//
//  Created by Park Kangwook on 2022/06/12.
//

import SwiftUI

struct StudySchedule: View {
    let schedules: [Schedule] = [
        .init(day: .sun, time: Date()),
        .init(day: .tue, time: Date() + 120),
        .init(day: .wed, time: Date() + 120),
        .init(day: .mon, time: Date() + 120),
        .init(day: .thu, time: Date() + 120),
        .init(day: .sat, time: Date() + 120),
        .init(day: .mon, time: Date() + 600)
              ]
    @State private var isShowingEdit = false
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Text("일정")
                    .font(.title)
                    .foregroundColor(.black)
                    .bold()
                Spacer()
                Button {
                    isShowingEdit = true
                    print("일정 추가")
                } label: {
                    Text("EDIT")
                        .padding(4)
                        .font(.subheadline)
                        .foregroundColor(.black)
                        .border(.black, width: 2)
                }
                .sheet(isPresented: $isShowingEdit) {
                    Text("일정 편집 (일정 추가, 삭제)")
                    Button {
                        isShowingEdit = false
                    } label: {
                        Text("DONE")
                    }
                    .padding()
                }
            }
            .padding(.vertical)
            
            List {
                ForEach(schedules, id: \.self) { schedule in
                    HStack {
                        Text(schedule.day.rawValue)
                    }
                }
            }.listStyle(.plain)
        }
        .padding()
        .frame(width: 320)
        .background(Color(red: 0.969, green: 0.969, blue: 0.969))
        .cornerRadius(10)
    }
}

struct StudySchedule_Previews: PreviewProvider {
    static var previews: some View {
        StudySchedule()
    }
}
