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
                                 joinedStudy: [study1, study2, study3, study4, study5, study6, study7])
}

extension UserViewModel {
    static var study1: Study = Study(code: "3ABCDE",
                              name: "모각코",
<<<<<<< HEAD
                              day: "월화수",
                              time: "10:11",
=======
                              schedule: [
                                Schedule(day: .mon, time: Date()),
                                Schedule(day: .tue, time: Date()),
                                Schedule(day: .wed, time: Date())
                              ],
>>>>>>> main
                              memberInfo: [userInfo1, userInfo2, userInfo3, userInfo4, userInfo5, userInfo6],
                                     memberAttendenceInfo: [userInfo1: attendenceInfo1, userInfo2: attendenceInfo1, userInfo3: attendenceInfo1, userInfo4: attendenceInfo1, userInfo5: attendenceInfo1, userInfo6: attendenceInfo1])
    
    static let study2: Study = Study(code: "34BCDE",
                              name: "디자인 딱대",
<<<<<<< HEAD
                              day: "수목",
                              time: "10:11",
=======
                              schedule: [
                                Schedule(day: .mon, time: Date()),
                                Schedule(day: .sat, time: Date()),
                                Schedule(day: .sun, time: Date())
                              ],
>>>>>>> main
                              memberInfo: [userInfo1],
                              memberAttendenceInfo: [userInfo1: attendenceInfo1])
    
    static let study3: Study = Study(code: "3ABC3E",
                              name: "알고리즘 딱대",
<<<<<<< HEAD
                              day: "일",
                              time: "11:11",
=======
                              schedule: [
                                Schedule(day: .wed, time: Date()),
                                Schedule(day: .fri, time: Date()),
                              ],
>>>>>>> main
                              memberInfo: [userInfo1],
                              memberAttendenceInfo: [userInfo1: attendenceInfo1])
    
    static let study4: Study = Study(code: "3AB21E",
                              name: "영어회화",
<<<<<<< HEAD
                              day: "화수목",
                              time: "12:11",
                              memberInfo: [userInfo1, userInfo4],
                                     memberAttendenceInfo: [userInfo1: attendenceInfo1, userInfo4: attendenceInfo1])
    
    static let study5: Study = Study(code: "3AC21E",
                              name: "영어회화",
                              day: "월목",
                              time: "12:21",
                              memberInfo: [userInfo1, userInfo4],
                                     memberAttendenceInfo: [userInfo1: attendenceInfo1, userInfo4: attendenceInfo1])
    
    static let study6: Study = Study(code: "3FB21E",
                              name: "영어회화",
                              day: "수토",
                              time: "12:31",
                              memberInfo: [userInfo1, userInfo4],
                                     memberAttendenceInfo: [userInfo1: attendenceInfo1, userInfo4: attendenceInfo1])
    
    static let study7: Study = Study(code: "3ABU1E",
                              name: "영어회화",
                              day: "화금",
                              time: "12:11",
=======
                              schedule: [
                                Schedule(day: .tue, time: Date()),
                                Schedule(day: .thu, time: Date()),
                              ],
>>>>>>> main
                              memberInfo: [userInfo1, userInfo4],
                                     memberAttendenceInfo: [userInfo1: attendenceInfo1, userInfo4: attendenceInfo1])
}

extension UserViewModel {
    
    static let userInfo1: UserInfo = .init(id: UUID(), fullName: "Kkoma")
    static let userInfo2: UserInfo = .init(id: UUID(), fullName: "Gongdol")
    static let userInfo3: UserInfo = .init(id: UUID(), fullName: "K")
    static let userInfo4: UserInfo = .init(id: UUID(), fullName: "Gary")
    static let userInfo5: UserInfo = .init(id: UUID(), fullName: "Terry")
    static let userInfo6: UserInfo = .init(id: UUID(), fullName: "Hongki")
    
    static let attendenceInfo1: AttendenceInfo = AttendenceInfo(numberOfAttendance: 0, numberOfAbsent: 0, numberOfLate: 0)
}

