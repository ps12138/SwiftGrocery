//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

// Self in protocol: 在协议中使⽤的类型就是实现这个协议本⾝的类型的话，
// 就需要使⽤ Self进⾏指代。

// Self 不仅指代的是实现该协议的类型本⾝，也包括了这个类型的⼦类。
// 从概念上来说， Self ⼗分简单，但是实际实现⼀个这样的⽅法却稍微要转个弯。