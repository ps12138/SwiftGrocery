//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

// Objective-C 中，我们并不会特别地区分类变量/类⽅法和静态变量/静态函数

// 在⾮ class 的类型上下⽂中，我们统⼀使⽤ static 来描述类型作⽤域。
// 这包括在 enum 和struct 中表述类型⽅法和类型属性时。
// 在这两个值类型中，我们可以在类型范围内声明并使⽤存储属性，计算属性和⽅法。 
// static 适⽤的场景有这些：

struct Point {
    let x: Double
    let y: Double
    
    // storage property
    static let zero = Point(x: 0, y: 0)
    
    // calculate property
    static var ones: [Point] {
        return [Point(x: 1, y: 1),
            Point(x: -1, y: 1),
            Point(x: 1, y: -1),
            Point(x: -1, y: -1)]
    }
    
    // class method
    static func add(p1: Point, p2: Point) -> Point {
        return Point(x: p1.x + p1.y, y: p2.x + p2.y)
    }
}