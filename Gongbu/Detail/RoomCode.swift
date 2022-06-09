//
//  RoomCode.swift
//  Gongbu
//
//  Created by Park Kangwook on 2022/06/09.
//

import SwiftUI

struct RoomCode: View {
    var body: some View {
        HStack {
            Text("방 코드")
                .font(.title)
                .bold()
                .foregroundColor(.black)
            Spacer()
            Text("A82VE2")
                .font(.title)
                .foregroundColor(.black)
        }
        
        .padding()
        .frame(width: 350, height: 80)
        .background(Color(red: 0.969, green: 0.969, blue: 0.969))
        .cornerRadius(10)
        
    }
}

struct RoomCode_Previews: PreviewProvider {
    static var previews: some View {
        RoomCode()
    }
}
