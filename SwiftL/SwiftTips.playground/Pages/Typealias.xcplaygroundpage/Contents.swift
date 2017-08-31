//: [Previous](@previous)

import Foundation
import UIKit

var str = "Hello, playground"

//: [Next](@next)


// typealias 是⽤来为已经存在的类型重新定义名字的，
// 通过命名，可以使代码变得更加清晰。

// 使⽤ typealias 关键字像使⽤普通的赋值语句⼀样，
// 可以将某个已经存在的类型赋值为新的名字。
// ⽐如在计算⼆维平⾯上的距离和位置的时候，
// 我们⼀般使⽤ Double 来表⽰距离，⽤ CGPoint 来表⽰位置
typealias Location = CGPoint
typealias Distance = Double


// typealias with generic 泛型
// - typealias 是单⼀的，
// - 你必须指定将某个特定的类型通过 typealias 赋值为新名字，
//   ⽽不能将整个泛型类型进⾏重命名
class Person<T> { }
typealias WorkerId = String
typealias Worker<T> = Person<WorkerId>


// typealias with Protocol
// 某个类型同时实现多个协议的组合时。
// 我们可以使⽤ & 符号连接⼏个协议，
// 然后给它们⼀个新的更符合上下⽂的名字，来增强代码可读性
protocol Apple { }
protocol Pear { }
typealias ApplePear = Apple & Pear




