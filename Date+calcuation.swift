//
//  Date+calcuation.swift
//  demo_v1
//
//  Created by PSL on 7/19/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Foundation

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
        if let minDiff = dateDiff.minute, minDiff > 0 {
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
        if let minDiff = dateDiff.minute, minDiff > 0 {
            return "\(minDiff)分钟前"
        } else {
            return "刚刚"
        }
    }
}
