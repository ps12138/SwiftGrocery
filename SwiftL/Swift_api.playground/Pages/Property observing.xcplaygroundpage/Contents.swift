
import Foundation

class MyClass {
    var hehe: String = "12" {
        willSet {
            print("willSet hehe")
        }
        didSet {
            print("didSet hehe")
        }
    }
    var haha: String {
        get {
            print("get haha")
            return "haha"
        }
        set {
            print("set haha")
        }
    }
}

class MyClass2: MyClass {
    override var hehe: String {
        get {
            print("get hehe")
            return "1111"
        }
        set {
            print("set hehe")
        }
    }
    override var haha: String {
        willSet {
            print("willSet haha")
        }
        didSet {
            print("didSet haha")
        }
    }
}


let aclass = MyClass2()
print("\nI will set hehe")
aclass.hehe = "111"
print("\nI will get haha")
var haha = aclass.haha
print("\nI will set haha")
aclass.haha = "111"


class MyClass3 {
    var hehe: String = "12" {
        // willSet and didSet may not have get/set
        willSet {
            print("willSet")
        }
        didSet {
            print("didSet")
        }
    }
}




