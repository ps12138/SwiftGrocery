//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)



/*
 NSDate *date = [NSDate date];
 NSLog(@"%@",NSStringFromClass([date class]));
 // 输出：
 // __NSDate
*/

// for Objective-C class
let date = NSDate()
let name: AnyClass! = object_getClass(date)
print(name)
// 输出：
// __NSDate



// for Swift native class
let string = "Hello"
let name1 = type(of: string)
print(name1)
debugPrint(name1)
// 输出：
// String