//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)




func random(in range: Range<Int>) -> Int {
    let count = UInt32(range.upperBound - range.lowerBound)
    return Int(arc4random_uniform(count)) + range.lowerBound
    
}

for _ in 0...4 {
    let range = Range<Int>(1...6)
    print(random(in: range))
}
