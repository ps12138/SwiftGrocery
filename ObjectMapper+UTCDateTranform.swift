//
//  UTCDataTranformation.swift
//  DemoV1
//
//  Created by PSL on 5/16/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Foundation
import ObjectMapper

open class UTCDateTranform: TransformType {
    public typealias Object = Date
    public typealias JSON = String

    private lazy var dateFormatter: DateFormatter! = {
        let formatter = DateFormatter()
        formatter.dateFormat =  "yyyy-MM-dd'T'HH:mm:ssZ"
        formatter.timeZone = TimeZone(identifier: "UTC")
        return formatter
    }()

    public init() {}

    open func transformFromJSON(_ value: Any?) -> Date? {
        if let timeInt = value as? Double {
            return Date(timeIntervalSince1970: TimeInterval(timeInt))
        }

        if let timeStr = value as? String {
            return dateFormatter.date(from: timeStr)
        }
        return nil
    }

    open func transformToJSON(_ value: Date?) -> String? {
        if let validDate = value {
            return dateFormatter.string(from: validDate)
        }
        return nil
    }
}
