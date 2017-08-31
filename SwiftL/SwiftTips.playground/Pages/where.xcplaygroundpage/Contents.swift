//: [Previous](@previous)

import Foundation
import UIKit

var str = "Hello, playground"

//: [Next](@next)

// 在 Swift 2.0 中，引⼊了 protocol extension。
// 在有些时候，我们会希望⼀个协议扩展的默认实现只在某些特定的条件下适⽤，
// 这时我们就可以⽤ where 关键字来进⾏限定。

protocol NibLoadable {
    static var defaultNib: UINib { get }
}

extension NibLoadable where Self: UIViewController {
    static var defaultNib: UINib {
        let bundle = Bundle(for: self)
        return UINib(nibName: String(describing: self), bundle: bundle)
    }
}

