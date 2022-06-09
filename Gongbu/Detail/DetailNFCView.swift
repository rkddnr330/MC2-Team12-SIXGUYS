//
//  DetailNFCView.swift
//  Gongbu
//
//  Created by Park Kangwook on 2022/06/09.
//

import SwiftUI

struct DetailNFCView: View {
    var body: some View {
        VStack(spacing: 100) {
            HStack {
                Text("출결 현황")
                    .font(.title)
                    .bold()
                    .padding()
                Spacer()
            }
            UserGrid()
            NFCButton()
                
        }
    }
}

struct DetailNFCView_Previews: PreviewProvider {
    static var previews: some View {
        DetailNFCView()
    }
}
