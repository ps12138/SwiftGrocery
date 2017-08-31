//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


class BaseClass {
    var title: String = ""
    var val: Int
    required init() {
        val = 1
    }
    convenience init(title: String) {
        self.init()
        self.title = title
    }
}

class ChildClass: BaseClass {
    var hehe: Int
    required init() {
        self.hehe = 12
        super.init()
        
    }
    init(hehe: Int) {
        self.hehe = hehe
        super.init()
    }
}

let cc = ChildClass(title: "21212")
print("cc: \(cc.title)")
//let cc1 = ChildClass(hehe: 21)
//cc1.title




class PriClass {
    private func myPrivate() {
        print("PriClass myPrivate")
    }
    fileprivate func myFilePrivate() {
        print("PriClass myFilePrivate")
    }
    internal func MyInternal() {
        print("PriClass MyInternal")
    }
}

class SubPriClass: PriClass {
    
}
let subPriClass = SubPriClass()
subPriClass.myFilePrivate()
subPriClass.MyInternal()
