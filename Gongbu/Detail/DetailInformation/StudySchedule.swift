//
//  StudySchedule.swift
//  Gongbu
//
//  Created by Park Kangwook on 2022/06/09.
//

import SwiftUI

struct StudySchedule: View {
    @State private var shedule = ["월요일 PM 5:00", "수요일 PM 5:00", "금요일 AM 10:00"]
    
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
                List {
                    ForEach(shedule, id: \.self) { index in
                        Text(index)
                    }
//                    .onDelete(perform: delete)
                    .onDelete { indexSet in
                        withAnimation {
                            shedule.remove(atOffsets: indexSet)
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .font(.title2)
            .padding(.vertical)
            .foregroundColor(.black)
        }
        .padding()
        .frame(width: 320, height: 400)
        .background(Color(red: 0.969, green: 0.969, blue: 0.969))
        .cornerRadius(10)
    }
}

struct StudySchedule_Previews: PreviewProvider {
    static var previews: some View {
        StudySchedule()
    }
}
