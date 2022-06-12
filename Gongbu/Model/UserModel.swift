//
//  UserModel.swift
//  Gongbu
//
//  Created by kimhyeongmin on 2022/06/12.
//

import Foundation

struct User {
    let id: UUID
    var userInfo: UserInfo
    var joinedStudy: [Study]
}
