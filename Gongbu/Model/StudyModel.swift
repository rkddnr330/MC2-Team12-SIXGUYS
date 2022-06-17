//
//  StudyModel.swift
//  Gongbu
//
//  Created by kimhyeongmin on 2022/06/12.
//

//import Foundation
//
//public struct Study: Codable, Hashable {
//    var id: String?
//    var title: String?
//    var day: [String]?
//    var time: [String]?
//    var numberOfAttendance: [String]?
//    var numberOfAbsent: [String]?
//    var numberOfLate: [String]?
//    var attendancePoint: [String]?
//    var memberId: [String]?
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case title
//        case day
//        case time
//        case numberOfAttendance
//        case numberOfAbsent
//        case numberOfLate
//        case attendancePoint
//        case memberId
//    }
//}


import Foundation

public struct Study: Identifiable, Codable, Hashable {
    public var id: String
    var title: String
    var day: [String:String]?
    var time: [String:String]?
    var numberOfAttendance: [String:Int]? // Dic
    var numberOfAbsent: [String:Int]? // Dic
    var numberOfLate: [String:Int]? // Dic
    var attendancePoint: [String:Int]? // Dic
    var memberId: [String]?
    var userName: [String: String]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case day
        case time
        case numberOfAttendance
        case numberOfAbsent
        case numberOfLate
        case attendancePoint
        case memberId
        case userName
    }
}
