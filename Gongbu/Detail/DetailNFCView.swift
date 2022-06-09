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
