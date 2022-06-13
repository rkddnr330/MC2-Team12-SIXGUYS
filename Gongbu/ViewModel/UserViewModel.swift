//
//  UserViewModel.swift
//  Gongbu
//
//  Created by kimhyeongmin on 2022/06/13.
//

import Foundation
import SwiftUI

class UserViewModel: ObservableObject {
    @Published var user: User = User(id: UUID(),
                                     userInfo: userInfo1,
                                     joinedStudy: [study1, study2, study3, study4])
}

// ----------------------------------------------------  더미 데이터 파일 -----------------------------------------------------------

extension UserViewModel {
    static var attendenceInfo1:AttendenceInfo =
        AttendenceInfo(numberOfAttendence: 1, numberOfAbsent: 2, numberOfLate: 3, attendencePoints: 4)
    
    static var attendenceInfo2:AttendenceInfo =
        AttendenceInfo(numberOfAttendence: 2, numberOfAbsent: 3, numberOfLate: 4, attendencePoints: 5)
    
    static var attendenceInfo3:AttendenceInfo =
        AttendenceInfo(numberOfAttendence: 3, numberOfAbsent: 4, numberOfLate: 5, attendencePoints: 6)
    
    static var attendenceInfo4:AttendenceInfo =
        AttendenceInfo(numberOfAttendence: 4, numberOfAbsent: 5, numberOfLate: 6, attendencePoints: 7)
}

extension UserViewModel {
    static var study1: Study = Study(code: "3ABCDE",
                              name: "모각코",
                              schedule: [
                                Schedule(day: .mon, time: Date()),
                                Schedule(day: .tue, time: Date()),
                                Schedule(day: .wed, time: Date())
                              ],
                              memberInfo: [userInfo1, userInfo2, userInfo3, userInfo4],
                                     memberAttendenceInfo: [userInfo1: attendenceInfo1, userInfo2: attendenceInfo1, userInfo3: attendenceInfo1, userInfo4: attendenceInfo1])
    
    static var study2: Study = Study(code: "34BCDE",
                              name: "디자인 딱대",
                              schedule: [
                                Schedule(day: .mon, time: Date()),
                                Schedule(day: .sat, time: Date()),
                                Schedule(day: .sun, time: Date())
                              ],
                              memberInfo: [userInfo1],
                              memberAttendenceInfo: [userInfo1: attendenceInfo1])
    
    static var study3: Study = Study(code: "3ABC3E",
                              name: "알고리즘 딱대",
                              schedule: [
                                Schedule(day: .wed, time: Date()),
                                Schedule(day: .fri, time: Date()),
                              ],
                              memberInfo: [userInfo1],
                              memberAttendenceInfo: [userInfo1: attendenceInfo1])
    
    static var study4: Study = Study(code: "3AB21E",
                              name: "영어회화",
                              schedule: [
                                Schedule(day: .tue, time: Date()),
                                Schedule(day: .thu, time: Date()),
                              ],
                              memberInfo: [userInfo1, userInfo4],
                                     memberAttendenceInfo: [userInfo1: attendenceInfo1, userInfo4: attendenceInfo1])
}

extension UserViewModel {
    static let userInfo1: UserInfo = UserInfo(id: UUID(), fullName: "Kkoma")
    static let userInfo2: UserInfo = UserInfo(id: UUID(), fullName: "Gongdol")
    static let userInfo3: UserInfo = UserInfo(id: UUID(), fullName: "K")
    static let userInfo4: UserInfo = UserInfo(id: UUID(), fullName: "Gary")
}

// ---------------------------------------------------  더미 데이터 파일 ----------------------------------------------------------
