//
//  TestView.swift
//  Gongbu
//
//  Created by kimhyeongmin on 2022/06/10.
//

import SwiftUI

struct PickerView: View {
    
    @ObservedObject var userViewModel: UserViewModel
    @State private var date = Date()
    var weekdays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    @State private var weekday = "Mon"
    @State var index = 0
    
    
    var body: some View {
        VStack{
            Picker(selection: $weekday, label: Text("")) {
                ForEach(userViewModel.user.joinedStudy[0].schedule, id: \.self) { weekday in
                    HStack {
                        Text("\(userViewModel.user.joinedStudy[0].schedule[0].time)")
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


//struct PickerView_Previews: PreviewProvider {
//    static var previews: some View {
//        PickerView()
//    }
//}
