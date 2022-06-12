//
//  StudyModel.swift
//  Gongbu
//
//  Created by kimhyeongmin on 2022/06/12.
//

import Foundation

struct Study {
    var code: String
    var name: String
    var day: String
    var time: String
    var memberInfo: [UserInfo]
    var memberAttendenceInfo: [UserInfo: AttendenceInfo]
}
