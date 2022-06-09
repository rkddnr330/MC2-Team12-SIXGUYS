//
//  UserGrid.swift
//  Gongbu
//
//  Created by Park Kangwook on 2022/06/09.
//

import SwiftUI

struct UserGrid: View {
    var body: some View {
        VStack{
        HStack {
            Text("출석 현황")
                .font(.title)
                .bold()
                .padding()
            Spacer()
        }
        
        HStack(alignment: .center) {
            VStack(alignment: .center) {
                Circle()
                    .stroke(Color.pink.opacity(0.5), lineWidth: 3)
                    .frame(width: 70, height: 70)
                Text("이름")
                    .bold()
            }
            Spacer()
            VStack {
                Circle()
                    .stroke(Color.pink.opacity(0.5), lineWidth: 3)
                    .frame(width: 70, height: 70)
                Text("이름")
                    .bold()
            }
            Spacer()
            VStack {
                Circle()
                    .stroke(Color.pink.opacity(0.5), lineWidth: 3)
                    .frame(width: 70, height: 70)
                Text("이름")
                    .bold()
            }
        }
        .padding(.horizontal)
        
        HStack(alignment: .center) {
            VStack(alignment: .center) {
                Circle()
                    .stroke(Color.pink.opacity(0.5), lineWidth: 3)
                    .frame(width: 70, height: 70)
                Text("이름")
                    .bold()
            }
            Spacer()
            VStack {
                Circle()
                    .stroke(Color.pink.opacity(0.5), lineWidth: 3)
                    .frame(width: 70, height: 70)
                Text("이름")
                    .bold()
            }
            Spacer()
            VStack {
                Circle()
                    .stroke(Color.pink.opacity(0.5), lineWidth: 3)
                    .frame(width: 70, height: 70)
                Text("이름")
                    .bold()
            }
        }
        .padding(.horizontal)
        
        HStack(alignment: .center) {
            VStack(alignment: .center) {
                Circle()
                    .stroke(Color.pink.opacity(0.5), lineWidth: 3)
                    .frame(width: 70, height: 70)
                Text("이름")
                    .bold()
            }
            Spacer()
            VStack {
                Circle()
                    .stroke(Color.pink.opacity(0.5), lineWidth: 3)
                    .frame(width: 70, height: 70)
                Text("이름")
                    .bold()
            }
            Spacer()
            VStack {
                Circle()
                    .stroke(Color.pink.opacity(0.5), lineWidth: 3)
                    .frame(width: 70, height: 70)
                Text("이름")
                    .bold()
            }
        }
        .padding(.horizontal)
        
    }
        .padding()
}
}

struct UserGrid_Previews: PreviewProvider {
    static var previews: some View {
        UserGrid()
    }
}
