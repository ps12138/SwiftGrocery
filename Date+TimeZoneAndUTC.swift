import UIKit

var str = "Hello, playground"


extension Date {
    var localDate: Date {
        let local = TimeZone.autoupdatingCurrent
        let seconds = local.secondsFromGMT()
        let timeInterval = TimeInterval(seconds)
        return Date(timeInterval: timeInterval, since: self)
    }
    
    var utcDate: Date {
        let local = TimeZone.autoupdatingCurrent
        let seconds = -local.secondsFromGMT()
        let timeInterval = TimeInterval(seconds)
        return Date(timeInterval: timeInterval, since: self)
    }
    
    func startOfMonth() -> Date {
        let calendar = Calendar.autoupdatingCurrent
        
        let startDate = calendar.startOfDay(for: self)
        let components = calendar.dateComponents([.year, .month], from: startDate)
        guard let date = calendar.date(from: components) else {
            assertionFailure("Invalid startOfMonth")
            return Date()
        }
        return date
    }
    
    func endOfMonth() -> Date {
        let calendar = Calendar.autoupdatingCurrent
        let startOfMonth = self.startOfMonth()
        let addComponents = DateComponents(month: 1, day: 0)
        guard let date = calendar.date(byAdding: addComponents, to: startOfMonth) else {
            assertionFailure("Invalid startOfMonth")
            return Date()
        }
        return date
    }
    
    static func date(year: Int, month: Int) -> Date? {
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = 1
        components.hour = 0
        components.minute = 0
        components.second = 0
        components.calendar = Calendar(identifier: .gregorian)
        //components.timeZone = TimeZone(abbreviation: "UTC")
        components.timeZone = TimeZone.autoupdatingCurrent
        return components.date
    }
}

let initDate = Date()
print("init: date \(initDate)")

let localDate = initDate.localDate
print("local: date \(localDate)")

// localDate cannot user localDate again, that will minus a TimeInterval
let utcDate = localDate.utcDate
print("utc: date \(utcDate)")
print("")

let givenDate = Date.date(year: 2017, month: 10)!
print("given date \(givenDate)")

let startDate = initDate.startOfMonth()
print("start: \(startDate)")

let endDate = initDate.endOfMonth()
print("end: \(endDate)")
