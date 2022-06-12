//
//  TestView.swift
//  Gongbu
//
//  Created by kimhyeongmin on 2022/06/10.
//

import SwiftUI

struct TestView: View {
    @State private var wakeUp = Date()
    var body: some View {
        VStack{
            DatePicker("", selection: $wakeUp, displayedComponents: .hourAndMinute)
                .datePickerStyle(WheelDatePickerStyle())
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
