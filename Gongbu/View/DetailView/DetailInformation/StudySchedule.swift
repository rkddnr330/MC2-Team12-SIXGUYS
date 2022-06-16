//
//  StudySchedule.swift
//  Gongbu
//
//  Created by Park Kangwook on 2022/06/12.
//

import SwiftUI

struct StudySchedule: View {
    @State private var isShowingEdit = false
    @State private var study2Day = DataViewModel.study2.day!
    @State private var study2Time = DataViewModel.study2.time!
    
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
                ForEach((0..<study2Day.count), id: \.self) { i in
                    HStack{
                        Text(study2Day[i]).bold()
                        Spacer()
                        Text(study2Time[i]).bold()
                    }
                    .frame(width: 260)
                    .font(.body)
                    
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
