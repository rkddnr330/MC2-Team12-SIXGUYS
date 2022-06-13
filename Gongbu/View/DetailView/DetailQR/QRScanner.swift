//
//  QRScanner.swift
//  Gongbu
//
//  Created by Jinsan Kim on 2022/06/13.
//

import SwiftUI
import CodeScanner

struct QRScannerView: View {
    
    @Binding var isPresentingScanner: Bool
    @State private var scannedCode: String?
    
    var body: some View{
        CodeScannerView(codeTypes: [.qr],
                        completion: { response in
            if case let .success(code) = response {
                self.scannedCode = code.string
                self.isPresentingScanner = false
                if let scannedCode = scannedCode {
                    print(scannedCode)
                }
            }
        })
    }
}
