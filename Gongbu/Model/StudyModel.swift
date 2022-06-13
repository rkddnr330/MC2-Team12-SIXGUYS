//
//  StudyModel.swift
//  Gongbu
//
//  Created by kimhyeongmin on 2022/06/12.
//

import Foundation

struct Study {
    var code: String  // 나중에 let으로 수정
    var name: String
    var day: String  // 나중에 타입 수정 예정
    var time: String  // 나중에 타입 수정 예정
    var memberInfo: [UserInfo]
    var memberAttendenceInfo: [UserInfo: AttendenceInfo]
}
