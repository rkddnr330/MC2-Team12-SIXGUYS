//
//  QRGenerator.swift
//  Gongbu
//
//  Created by Jinsan Kim on 2022/06/13.
//

import SwiftUI
import FirebaseFirestoreSwift
import Firebase

struct QRGenerateView: View {
    
    let roomId: String
    @ObservedObject var studyModel = RankingModel()
    
    var body: some View {
        let userID:String = Auth.auth().currentUser!.uid
        VStack {
            Image(uiImage: UIImage(data: returnData(str: self.roomId))!)
                .resizable()
                .frame(width: 150, height: 150)
            
        }
        .padding()
        .onAppear{
            
        }
    }
    
    func returnData(str: String) -> Data {
        let filter = CIFilter(name: "CIQRCodeGenerator")
        let data = str.data(using: .ascii, allowLossyConversion: false)
        filter?.setValue(data, forKey: "inputMessage")
        let image = filter?.outputImage
        let uiimage = UIImage(ciImage: image!)
        return uiimage.pngData()!
    }
    
    // 시간 차이 계산
    func calculateTime(time:String) -> Int{
        let ampm = time.components(separatedBy: " ")
        var calAmpm:Int = 0
        let temp = String(ampm[0]) // AM PM
        if(temp == "오후") {
            calAmpm = 12
        }
        let arr = ampm[1].components(separatedBy: ":")
        let hour = 60 *  Int(arr[0])!
        let min = Int(arr[1])!
        return hour + min + (60 * calAmpm)
    }
}
