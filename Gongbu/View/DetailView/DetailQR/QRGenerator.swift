//
//  QRGenerator.swift
//  Gongbu
//
//  Created by Jinsan Kim on 2022/06/13.
//

import SwiftUI

struct QRGenerateView: View {
    
    @State var user = UserViewModel.userInfo1.eMail
    
    var body: some View {
        VStack {
            Image(uiImage: UIImage(data: returnData(str: self.user))!)
                .resizable()
                .frame(width: 150, height: 150)
            
        }
        .padding()
    }
    func returnData(str: String) -> Data {
        let filter = CIFilter(name: "CIQRCodeGenerator")
        let data = str.data(using: .ascii, allowLossyConversion: false)
        filter?.setValue(data, forKey: "inputMessage")
        let image = filter?.outputImage
        let uiimage = UIImage(ciImage: image!)
        return uiimage.pngData()!
    }
}
