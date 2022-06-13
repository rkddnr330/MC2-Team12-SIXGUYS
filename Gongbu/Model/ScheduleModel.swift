//
//  ScheduleModel.swift
//  Gongbu
//
//  Created by KiWoong Hong on 2022/06/13.
//
import Foundation

struct Schedule: Hashable {
    var day: Day
    var time: Date
}

enum Day: String, CaseIterable {
    case sun = "Sun"
    case mon = "Mon"
    case tue = "Tue"
    case wed = "Wed"
    case thu = "Thu"
    case fri = "Fri"
    case sat = "Sat"
}
