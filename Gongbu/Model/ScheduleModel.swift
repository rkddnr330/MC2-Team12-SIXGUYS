//
//  ScheduleModel.swift
//  Gongbu
//
//  Created by KiWoong Hong on 2022/06/13.
//
import Foundation


extension Date {
    func toStringTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "a hh:mm"
        dateFormatter.locale = Locale(identifier:"ko_KR")
        
        return dateFormatter.string(from: self)
    }
    
    func toStringWeekday() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E"
        dateFormatter.locale = Locale(identifier:"ko_KR")
        
        return dateFormatter.string(from: self)
    }
}

extension String {
    func toDate() -> Date? { //"yyyy-MM-dd HH:mm:ss"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.locale = Locale(identifier:"ko_KR")
        
        if let date = dateFormatter.date(from: self) {
            return date
        } else {
            return nil
        }
    }
}
