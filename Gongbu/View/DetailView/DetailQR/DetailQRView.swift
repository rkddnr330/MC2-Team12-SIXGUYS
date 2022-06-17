//
//  DetailNFCView.swift
//  Gongbu
//
//  Created by Park Kangwook on 2022/06/12.
//

import SwiftUI

struct DetailQRView: View {
    
    let roomId:String
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
                UserGrid(roomId: roomId)
                    .padding(.vertical)
                Spacer()
                QRButton(roomId: roomId)
                    .padding(.bottom, 70)
            }
        }
        .frame(width: 330, height: 700)
    }
}

//struct DetailQRView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailQRView()
//    }
//}
