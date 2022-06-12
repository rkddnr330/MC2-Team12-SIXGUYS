//
//  UserInfoModel.swift
//  Gongbu
//
//  Created by kimhyeongmin on 2022/06/12.
//

import Foundation

struct UserInfo: Hashable {
    let id: UUID
    let firstName: String
    let lastName: String
    let eMail: String
}
