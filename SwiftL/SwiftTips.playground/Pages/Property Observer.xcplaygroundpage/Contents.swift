//: [Previous](@previous)

import Foundation
import UIKit

var str = "Hello, playground"

//: [Next](@next)


// Property Observers
// 利⽤属性观察我们可以在当前类型内监视对于属性的设定，并作出⼀些响应。
// Swift 中为我们提供了两个属性观察的⽅法，
// 它们分别是 willSet 和 didSet

// 初始化⽅法对属性的设定，
// 以及在 willSet 和 didSet 中对属性的再次设定都不会再次触发属性观察的调⽤，
// ⼀般来说这会是你所需要的⾏为，可以放⼼使⽤能够。


// 在 Swift 中所声明的属性包括存储属性和计算属性两种。
// 其中存储属性将会在内存中实际分配地址对属性进⾏存储，
// ⽽计算属性则不包括背后的存储，只是提供 set 和 get 两种⽅法。
// 在同⼀个类型中，属性观察和计算属性是不能同时共存的。

// 也就是说，想在⼀个属性定义中同时出现 set 和 willSet 或 didSet 
// 是⼀件办不到的事情。
// 计算属性中我们可以通过改写 set中的内容来达到
// 和 willSet 及 didSet 同样的属性观察的⽬的。
class A {
    var number :Int {
        get {
            print("get")
            return 1
        }
        set {print("set")}
    }
}
class B: A {
    override var number: Int {
        willSet {print("willSet")}
        didSet {print("didSet")}
    }
}

// for reference type
class C {
    var view: UIView {
        didSet {
            print("didSet view")
        }
    }
    init() {
        self.view = UIView(frame: CGRect())
    }
}


let c = C()
// will not trigger setView
c.view.backgroundColor = UIColor.red

// will trigger setView
c.view = UIView(frame: CGRect())





