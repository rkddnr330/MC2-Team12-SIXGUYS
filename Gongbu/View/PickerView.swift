//
//  TestView.swift
//  Gongbu
//
//  Created by kimhyeongmin on 2022/06/10.
//

import SwiftUI

struct PickerView: View {
    
    @State private var date = Date()
    var weekdays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    @State private var weekday = "Mon"
    @State var index = 0
    
    var body: some View {
        VStack{
            Picker(selection: $weekday, label: Text("")) {
                ForEach(self.weekdays, id: \.self) { weekday in
                    HStack {
                        Text(weekday)
                            .font(.title)
                    }
                }
            }
            .pickerStyle(.segmented)
            .labelsHidden()
            
            DatePicker("", selection: $date, displayedComponents: .hourAndMinute)
                .datePickerStyle(.wheel)
        }
        .labelsHidden()
    }
}


struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView()
    }
}
