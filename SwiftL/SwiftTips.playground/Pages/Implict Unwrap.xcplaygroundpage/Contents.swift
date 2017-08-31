//: [Previous](@previous)

import Foundation
import UIKit

var str = "Hello, playground"

//: [Next](@next)



class ClassA {
    let num: Int
    init?(num: Int?) {
        guard let num = num else {
            return nil
        }
        self.num = num
    }
}

var maybeObject: ClassA! = ClassA(num: 10)
print(maybeObject!.num)
print(maybeObject.num)


// 现在⽐较常见的隐式解包的 Optional 
// 就只有使⽤ Interface Builder 时建⽴的 IBOutlet 了：
//@IBOutlet weak var button: UIButton!

// 如果没有连接 IB 的话，对 button 的直接访问会导致应⽤崩溃，
// 这种情况和错误在调试应⽤时是很容易被发现的问题。
// 在我们的代码的其他部分，还是少⽤这样的隐式解包的 Optional 为好，
// 很多时候多写⼀个 Optional Binding 就可以规避掉不少应⽤崩溃的风险。