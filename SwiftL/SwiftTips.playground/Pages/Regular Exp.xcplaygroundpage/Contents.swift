//: [Previous](@previous)

import Foundation
import UIKit

var str = "Hello, playground"

//: [Next](@next)


// Regular Exp
// https://deerchao.net/tutorials/regex/regex.htm
// https://code.tutsplus.com/tutorials/8-regular-expressions-you-should-know--net-6149

// NSRegularExpression


struct RegexHelper {
    let regex: NSRegularExpression
    init(_ pattern: String) throws {
        try regex = NSRegularExpression(
                pattern: pattern,
                options: .caseInsensitive)
    }
    func match(_ input: String) -> Bool {
        let matches = regex.matches(
            in: input,
            options: [],
            range: NSRange(location: 0, length: input.utf16.count))
        return matches.count > 0
    }
}

let mailPattern = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
let matcher: RegexHelper
do {
    matcher = try RegexHelper(mailPattern)
}
let maybeMailAddress = "onev@onevcat.com"
if matcher.match(maybeMailAddress) {
    print("valid email addr")
}
