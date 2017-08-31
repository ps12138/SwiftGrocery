//
//  String+UTCTimeInterval.swift
//  ImageCache
//
//  Created by PSL on 1/19/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Foundation


public extension String {
    /** 
    calculate time interval until now
    - Parameters:
        - UTCstr: follows format "yyyy-MM-dd'T'HH:mm:ssZ"
    - returns: 1min ~ ?year, large unit first
    */
    static func timeUntilNow(UTCstr string: String?) -> String {
        guard let oldTime = string else {
            return "1min"
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =  "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        
        guard let oldDate = dateFormatter.date(from: oldTime) else {
            return "1min"
        }
        let curDate = Date()
        
        let componentSet: Set<Calendar.Component> = [
            Calendar.Component.year,
            Calendar.Component.month,
            Calendar.Component.day,
            Calendar.Component.hour,
            Calendar.Component.minute
        ]
        
        var dateDiff = Calendar.current.dateComponents(
            componentSet,
            from: oldDate,
            to: curDate
        )
        
        if let yearDiff = dateDiff.year, yearDiff > 0 {
            return "\(yearDiff)year"
        }
        if let monthDiff = dateDiff.month, monthDiff > 0 {
            return "\(monthDiff)month"
        }
        if let dayDiff = dateDiff.day, dayDiff > 0 {
            return "\(dayDiff)day"
        }
        
        if let hourDiff = dateDiff.hour, hourDiff > 0 {
            return "\(hourDiff)hour"
        }
        if let minDiff = dateDiff.minute, minDiff > 0{
            return "\(minDiff)min"
        } else {
            return "1min"
        }
    }
}
