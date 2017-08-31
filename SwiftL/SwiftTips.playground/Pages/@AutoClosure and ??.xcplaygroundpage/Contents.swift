//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


// trail closure
func logIfTrue(_ predicate: () -> Bool) {
    if predicate() {
        print("True0")
    }
}

logIfTrue({return 2 > 1 })
logIfTrue({ 2 > 1})
logIfTrue { 2 > 1}

// @autoclosure 做的事情就是把⼀句表达式⾃动地封装成⼀个闭包 (closure)
func logIfTrue(_ predicate: @autoclosure () -> Bool) {
    if predicate() {
        print("True1")
    }
}

logIfTrue(2 > 1)


// func ??<T>(optional: T?, defaultValue: @autoclosure () -> T) -> T
/*
 ?? 为什么这⾥要使⽤ autoclosure ，直接接受 T 作为参数并返回不⾏么，为何要
 ⽤ () -> T 这样的形式包装⼀遍?
 
 如果我们直接使⽤ T ，那么就意味着在 ?? 操作符真正取值之前，
 我们就必须准备好⼀个默认值传⼊到这个⽅法中，⼀般来说这不会有很⼤问题，
 但是如果这个默认值是通过⼀系列复杂计算得到的话，可能会成为浪费 
 因为其实如果 optional 不是 nil 的话，我们实际上是完全没有⽤到这个默认值，
 ⽽会直接返回 optional 解包后的值的。这样的开销是完全可以避免的，
 ⽅法就是将默认值的计算推迟到 optional 判定为 nil 之后。
*/