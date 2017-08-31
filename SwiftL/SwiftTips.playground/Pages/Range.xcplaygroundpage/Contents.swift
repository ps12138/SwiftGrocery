//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)



// 0 1 2 3
for i in 0...3 {
    print(i, terminator: " ")
}
print("")

// 0 1 2 
for i in 0..<3 {
    print(i, terminator: " ")
}
print("")

let test = "helLo"
let interval = "a"..."z"
for c in test.characters {
    if !interval.contains(String(c)) {
        print("\(c) is not small letter")
    }
}

// 我们可能会需要确定某个字符是不是有效的 ASCII 字符，和上⾯的例⼦很相似，
// 我们可以使⽤ \0...~ 这样的 ClosedInterval 来进⾏ 
// ( \0 和 ~ 分别是 ASCII 的第⼀个和最后⼀个字符)。