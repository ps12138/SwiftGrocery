//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

/*
在判等上 Swift 的⾏为和 Objective-C 有着巨⼤的差别。在 Objective-C 中 == 这个符号的意思是
判断两个对象是否指向同⼀块内存地址。其实很多时候这并不是我们经常所期望的判等，我们更
关⼼的往往还是对象的内容相同，⽽这种意义的相等即使两个对象引⽤的不是同⼀块内存地址
时，也是可以做到的。Objective-C 中我们通常通过对 -isEqual: 进⾏重写，或者更进⼀步去实现
类似 -isEqualToString: 这样的 -isEqualToClass: 的带有类型信息的⽅法来进⾏内容判等。如果我
们没有在任意⼦类重写 -isEqual: 的话，在调⽤这个⽅法时会直接使⽤ NSObject 中的版本，去直
接进⾏ Objective-C 的 == 判断。
 
*/

// 对于原来 Objective-C 中使⽤ == 进⾏的对象指针的判定，
// 在 Swift 中提供的是另⼀个操作符=== 。在 Swift 中 === 只有⼀种重载：
// 它⽤来判断两个 AnyObject 是否是同⼀个引⽤。
// func ===(lhs: AnyObject?, rhs: AnyObject?) -> Bool