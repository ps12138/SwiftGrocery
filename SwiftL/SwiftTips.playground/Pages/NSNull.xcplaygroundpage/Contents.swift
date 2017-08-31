//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


// Objective-C 中，因为 NSDictionay 和 NSArray 只能存储对象，
// 对于像 JSON 中可能存在的null 值， 
// NSDictionay 和 NSArray 中就只能⽤ NSNull 对象来表⽰。

// Objective-C 中, 我们向 nil 发送任何消息时都将返回默认值，
// 因此很多时候我们过于依赖这个特性，⽽不再去进⾏检查就直接使⽤对象。
// ⼤部分时候这么做没有问题，但是在处理 JSON时， 
// NSNull 却⽆法使⽤像 nil 那样的对所有⽅法都响应的特性。
// ⽽⼜因为 Objective-C 是没有强制的类型检查的，
// 我们可以任意向⼀个对象发送任何消息，这就导致如果 JSON 对象中存在
// null 时 (不论这是有意为之还是服务器⽅⾯出现了某种问题) 的话，
// 对其映射为的 NSNull 直接发送消息时，app 将发⽣崩溃。

// NSInteger voteCount = [jsonDic objectForKey:@"voteCount"] integerValue];
// 如果在 JSON 中 voteCount 对应的是 null 的话
// [NSNull intValue]: unrecognized selector sent to instance 崩溃


//  Objective-C 中，
// 我们⼀般通过严密的判断来解决这个问题：
// - 即在每次发送消息的时候都进⾏类型检查，
//   以确保将要接收消息的对象不是 NSNull 的对象。
// - 另⼀种⽅法是添加 NSNull 的category，
//   让它响应各种常见的⽅法 (⽐如 integerValue 等)，
//   并返回默认值。
// 两种⽅式都不是⾮常完美，前⼀种过于⿇烦，后⼀种难免有疏漏


// 假设 jsonValue 是从⼀个 JSON 中取出的 NSNull
let jsonValue: AnyObject = NSNull()
if let string = jsonValue as? String {
    print(string.hasPrefix("a"))
} else {
    print("cannot parse")
}
// 输出：
// 不能解析

