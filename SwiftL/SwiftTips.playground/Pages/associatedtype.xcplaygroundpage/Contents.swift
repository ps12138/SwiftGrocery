//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

// associatedtype - 
// 使⽤ associatedtype 我们就可以在 protocol 协议中添加⼀个限定，
// 让 class who conform protocol 来指定associatedtype的具体类型

// Once we add "associatedtype", protocol 协议就不能被当作独⽴的类型使⽤了
// we cannot use this protocol to declare a variable

// 在⼀个协议加⼊了像是 associatedtype 或者 Self 的约束后，
// 它将只能被⽤为泛型约束，⽽不能作为独⽴类型的占位使⽤，也失去了动态派发的特性.