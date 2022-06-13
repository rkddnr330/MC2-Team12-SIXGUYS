//
//  NFCButton.swift
//  Gongbu
//
//  Created by Park Kangwook on 2022/06/12.
//

import SwiftUI

struct QRButton: View {
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
                    .background(Color(red: 0.187, green: 0.417, blue: 0.533))
                    
            }
            .frame(width: 130, height: 76, alignment: .center)
            .background(Color(red: 0.187, green: 0.417, blue: 0.533))
            .cornerRadius(10)
            
            Button {
                print("Tag 발동")
            } label: {
                Text("Tag")
                    .bold()
                    .font(.title)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color(red: 0.467, green: 0.696, blue: 0.821))
            }
            .frame(width: 130, height: 76, alignment: .center)
            .background(Color(red: 0.467, green: 0.696, blue: 0.821))
            .cornerRadius(10)
        }
        .padding(.horizontal)
    }
}

struct QRButton_Previews: PreviewProvider {
    static var previews: some View {
        QRButton()
    }
}
