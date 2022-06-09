//
//  NFCButton.swift
//  Gongbu
//
//  Created by Park Kangwook on 2022/06/09.
//

import SwiftUI

struct NFCButton: View {
    var body: some View {
        HStack(spacing:50){
            Button {
               print("Read 발동")
            } label: {
                Text("Read")
                    .bold()
                    .font(.title)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.ReadColor)
                    
            }
            .frame(width: 130, height: 76, alignment: .center)
            .background(Color.ReadColor)
            .cornerRadius(10)
            
            Button {
                print("Tag 발동")
            } label: {
                Text("Tag")
                    .bold()
                    .font(.title)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.TagColor)
            }
            .frame(width: 130, height: 76, alignment: .center)
            .background(Color.TagColor)
            .cornerRadius(10)
        }
        .padding(.horizontal)
    }
}

extension Color {
    static let ReadColor = Color(hex: "#3F6985")
    static let TagColor = Color(hex: "84B0CE")
}

extension Color {
  init(hex: String) {
    let scanner = Scanner(string: hex)
    _ = scanner.scanString("#")
    
    var rgb: UInt64 = 0
    scanner.scanHexInt64(&rgb)
    
    let r = Double((rgb >> 16) & 0xFF) / 255.0
    let g = Double((rgb >>  8) & 0xFF) / 255.0
    let b = Double((rgb >>  0) & 0xFF) / 255.0
    self.init(red: r, green: g, blue: b)
  }
}

struct NFCButton_Previews: PreviewProvider {
    static var previews: some View {
        NFCButton()
    }
}
