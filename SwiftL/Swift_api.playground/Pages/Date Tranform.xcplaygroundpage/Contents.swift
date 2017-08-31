//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)
import UIKit

extension Date {
    
    /// get the time difference description of local timezone date
    ///
    /// - Parameter date: local timezone date of event date
    /// - Returns: xxx 之前
    static func timeDifference(fromlocal date: Date?) -> String {
        guard let eventData = date else {
            return "1m"
        }
        let curDateUTC = Date()
        let zone = TimeZone.current
        let timeDiff = zone.secondsFromGMT(for: curDateUTC)
        let curDate = curDateUTC.addingTimeInterval(TimeInterval(timeDiff))
        let componentSet: Set<Calendar.Component> = [
            Calendar.Component.month,
            Calendar.Component.day,
            Calendar.Component.hour,
            Calendar.Component.minute
        ]
        var dateDiff = Calendar.current.dateComponents(
            componentSet,
            from: eventData,
            to: curDate)
        if let monthDiff = dateDiff.month, monthDiff > 0 {
            if monthDiff > 11 {
                return "1年前"
            }
            if monthDiff > 5 {
                return "6个月前"
            }
            return "\(monthDiff)个月前"
        }
        if let dayDiff = dateDiff.day, dayDiff > 0 {
            return "\(dayDiff)天前"
        }
        
        if let hourDiff = dateDiff.hour, hourDiff > 0 {
            return "\(hourDiff)小时前"
        }
        if let minDiff = dateDiff.minute, minDiff > 0{
            return "\(minDiff)分钟前"
        } else {
            return "刚刚"
        }
    }
    
    /// get the time difference description of UTC date
    ///
    /// - Parameter date: UTC date of event date
    /// - Returns: xxx 之前
    static func timeDifference(fromUTC date: Date?) -> String {
        guard let eventData = date else {
            return "1m"
        }
        let curDateUTC = Date()
        let componentSet: Set<Calendar.Component> = [
            Calendar.Component.month,
            Calendar.Component.day,
            Calendar.Component.hour,
            Calendar.Component.minute
        ]
        var dateDiff = Calendar.current.dateComponents(
            componentSet,
            from: eventData,
            to: curDateUTC)
        if let monthDiff = dateDiff.month, monthDiff > 0 {
            if monthDiff > 11 {
                return "1年前"
            }
            if monthDiff > 5 {
                return "6个月前"
            }
            return "\(monthDiff)个月前"
        }
        if let dayDiff = dateDiff.day, dayDiff > 0 {
            return "\(dayDiff)天前"
        }
        
        if let hourDiff = dateDiff.hour, hourDiff > 0 {
            return "\(hourDiff)小时前"
        }
        if let minDiff = dateDiff.minute, minDiff > 0{
            return "\(minDiff)分钟前"
        } else {
            return "刚刚"
        }
    }
}



let eventDate = Date(timeIntervalSinceReferenceDate: 100)
let zone = TimeZone.current
let timeDiff = zone.secondsFromGMT(for: eventDate)
let localEventDate = eventDate.addingTimeInterval(TimeInterval(timeDiff))


let res = Date.timeDifference(fromlocal: localEventDate)
print(res)




let text = "    Simple text   with    spaces    "
let pattern = "^\\s+|\\s+$|\\s+(?=\\s)"
//let trimmed = text.stringByReplacingOccurrencesOfString(pattern, withString: "", options: .RegularExpressionSearch)
//println(">\(trimmed)<") // >Simple text with spaces<
let trimmed = text.replacingOccurrences(of: pattern, with: "", options: .regularExpression, range: nil)
print(">\(trimmed)<")


