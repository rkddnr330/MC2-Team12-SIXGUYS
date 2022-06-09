//
//  DetailNFCView.swift
//  Gongbu
//
//  Created by Park Kangwook on 2022/06/09.
//

import SwiftUI

struct DetailNFCView: View {
    var body: some View {
        VStack{
            VStack {
                HStack {
                    Text("출결 현황")
                        .font(.largeTitle)
                        .bold()
                        .padding(.vertical)
                    Spacer()
                }
                UserGrid()
                    .padding(.vertical)
                NFCButton()
                    .padding(.bottom, 70)
                
            }
        }
        .frame(width: 340, height: 700)
    }
}

struct DetailNFCView_Previews: PreviewProvider {
    static var previews: some View {
        DetailNFCView()
    }
}
