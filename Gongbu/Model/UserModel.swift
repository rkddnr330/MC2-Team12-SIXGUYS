//
//  UserModel.swift
//  Gongbu
//
//  Created by kimhyeongmin on 2022/06/12.
//

import Foundation

public struct User: Codable {
    var id: String?
    var fullName: String?
    var joinedStudy: [String]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case fullName
        case joinedStudy
    }
}
