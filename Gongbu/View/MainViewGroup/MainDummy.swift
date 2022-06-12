//
//  MainDummy.swift
//  Gongbu
//
//  Created by KiWoong Hong on 2022/06/09.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var user: User = User(id: UUID(),
                                 userInfo: userInfo1,
                                 joinedStudy: [study1, study2, study3, study4])
}

extension UserViewModel {
    static var study1: Study = Study(code: "3ABCDE",
                              name: "모각코",
                              day: "월화수",
                              time: "1011",
                              memberInfo: [userInfo1, userInfo2, userInfo3, userInfo4, userInfo5, userInfo6],
                                     memberAttendenceInfo: [userInfo1: attendenceInfo1, userInfo2: attendenceInfo1, userInfo3: attendenceInfo1, userInfo4: attendenceInfo1, userInfo5: attendenceInfo1, userInfo6: attendenceInfo1])
    
    static let study2: Study = Study(code: "34BCDE",
                              name: "디자인 딱대",
                              day: "수목",
                              time: "1011",
                              memberInfo: [userInfo1],
                              memberAttendenceInfo: [userInfo1: attendenceInfo1])
    
    static let study3: Study = Study(code: "3ABC3E",
                              name: "알고리즘 딱대",
                              day: "일",
                              time: "1111",
                              memberInfo: [userInfo1],
                              memberAttendenceInfo: [userInfo1: attendenceInfo1])
    
    static let study4: Study = Study(code: "3AB21E",
                              name: "영어회화",
                              day: "화목",
                              time: "1211",
                              memberInfo: [userInfo1, userInfo4],
                                     memberAttendenceInfo: [userInfo1: attendenceInfo1, userInfo4: attendenceInfo1])
}

extension UserViewModel {
    
    static let userInfo1: UserInfo = .init(id: UUID(), firstName: "bab", lastName: "kim", eMail: "cheeze@kimbab")
    static let userInfo2: UserInfo = UserInfo(id: UUID(), firstName: "tang", lastName: "mara", eMail: "good@maratang")
    static let userInfo3: UserInfo = UserInfo(id: UUID(), firstName: "jun", lastName: "pa", eMail: "haemul@pajun")
    static let userInfo4: UserInfo = UserInfo(id: UUID(), firstName: "beer", lastName: "can", eMail: "drinking@canbeer")
    static let userInfo5: UserInfo = UserInfo(id: UUID(), firstName: "chicken", lastName: "fried", eMail: "eating@friedchicken")
    static let userInfo6: UserInfo = UserInfo(id: UUID(), firstName: "tang", lastName: "gamza", eMail: "eating@gamzatang")
    
    static let attendenceInfo1: AttendenceInfo = AttendenceInfo(numberOfAttendance: 0, numberOfAbsent: 0, numberOfLate: 0)
}

struct User {
    let id: UUID
    var userInfo: UserInfo
    var joinedStudy: [Study]
}

struct UserInfo: Hashable {
    let id: UUID
    let firstName: String
    let lastName: String
    let eMail: String
}

struct Study {
    var code: String
    var name: String
    var day: String
    var time: String
    var memberInfo: [UserInfo]
    var memberAttendenceInfo: [UserInfo: AttendenceInfo]
}

struct AttendenceInfo {
    var numberOfAttendance: Int
    var numberOfAbsent: Int
    var numberOfLate: Int
}
