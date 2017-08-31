//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


// selector 其实是 Objective-C runtime 的概念，
// 如果你的 selector 对应的⽅法只在 Swift 中可见的话 
// (也就是说它是⼀个 Swift 中的 private ⽅法)，
// 在调⽤这个 selector 时你会遇到⼀个 unrecognized selector 错误
// 正确的做法是在 private 前⾯加上 @objc 关键字，这样运⾏时就能找到对应的⽅法了。
@objc private func turn(by angle: Int, speed: Float) {
    //...
}
let method = #selector(turn(by:speed:))


// 如果⽅法名字在⽅法所在域内是唯⼀的话，
// 我们可以简单地只是⽤⽅法的名字来作为 #selector 的内容。
func callMe() { }
let someMethod = #selector(callMe)


// 相⽐于前⾯带有冒号的完整的形式来说，这么写起来会⽅便⼀些：
// 但是，如果在同⼀个作⽤域中存在同样名字的两个⽅法，
// 即使它们的函数签名不相同，Swift 编译器也不允许编译通过：
func commonFunc() { }
func commonFunc(input: Int) -> Int {
    return input
}
// let method = #selector(commonFunc)
// 编译错误，`commonFunc` 有歧义
let method1 = #selector(commonFunc as ()->())
let method2 = #selector(commonFunc as (Int)->Int)



