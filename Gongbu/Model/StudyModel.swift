//
//  StudyModel.swift
//  Gongbu
//
//  Created by kimhyeongmin on 2022/06/12.
//

import Foundation

struct Study {
    let code: String  // 나중에 let으로 수정
    var name: String
    var schedule: [Schedule]
    var memberInfo: [UserInfo]
    var memberAttendenceInfo: [UserInfo: AttendenceInfo]
}
