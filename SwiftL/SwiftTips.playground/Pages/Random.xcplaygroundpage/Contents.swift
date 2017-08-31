//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


// 在 iPhone 5 或者以下的设备中，
// 有时候 程序会崩溃...请注意这个“有时候”..
// 最让程序员郁闷的事情莫过于程序有时候会崩溃⽽有时候⼜能良好运⾏。
// 还好这⾥的情况⽐较简单，聪明的我们马上就能指出原因。
// 其实 Swift 的 Int 是和 CPU 架构有关的：在 32 位的 CPU上 
// (也就是 iPhone 5 和前任们），实际上它是 Int32 ，
// ⽽在 64 位 CPU (iPhone 5s 及以后的机型) 上是 Int64 。 
// arc4random 所返回的值不论在什么平台上都是⼀个 UInt32 ，
// 于是在 32 位的平台上就有⼀半⼏率在进⾏ Int 转换时越界，
// 时不时的崩溃也就不⾜为奇了。

// 这种情况下，⼀种相对安全的做法是使⽤⼀个 arc4random 的改良版本：
// func arc4random_uniform(_: UInt32) -> UInt32

func random(in range: Range<Int>) -> Int {
    let count = UInt32(range.upperBound - range.lowerBound)
    return Int(arc4random_uniform(count)) + range.lowerBound
}
for _ in 0...5 {
    let range = Range<Int>(1...6)
    print(random(in: range))
}