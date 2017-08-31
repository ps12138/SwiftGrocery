//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


class MyClass1 {
    //weak var myClass2: MyClass2?
    var block: (() -> Void)?
    var myBlock: ((String)->())?
    var str: String?
    
    func test(completion: @escaping ((String)->())) {
        //self.myBlock = completion
        DispatchQueue.global().async {
            completion("in completion")
        }
    }
    deinit {
        print("deinit MyClass1")
    }
}

func myTest() {
    let obj = MyClass1()
    obj.str = "yyy"
    obj.test { (res) in
        print(res)
        //print(obj.str ?? "obj.str")
    }
    return
}
myTest()
// class1 -> test -> complation -> class1



// Retain cycle
class MyClass3 {
    var block: (() -> Void)?
    var str: String?
    
    // retain cycle,  self -> block -> myClass
    func test0() {
        self.block = {
            () -> Void in
            self.str = "Test 0"
        }
        self.block?()
    }
    
    // weak strong dancing
    // self -> block -> weak self -> strongSelf(weak self) inside block
    func test1() {
        self.block = { [weak weakSelf = self] () -> Void in
            weakSelf?.str = "Test 1"
        }
        self.block?()
    }
    
    // self -> block -> self -> block, then block finish, block !-> self
    func test2() {
        self.block = { () -> Void in
            self.str = "Test 2"
        }

        func hehe(with code: inout (() -> Void)?) {
            code?()
            code = nil

        }
        hehe(with: &self.block)
    }
    
    deinit {
        print("deinit MyClass3")
    }
}



func test30() {
    let class3 = MyClass3()
    class3.str
    class3.test0()
    class3.str
    //class3.block = nil
}

func test31() {
    let class3 = MyClass3()
    class3.str
    class3.test1()
    class3.str
    //class3.block = nil
}

func test32() {
    let class3 = MyClass3()
    class3.str
    class3.test2()
    class3.str
    //class3.block = nil
}


///// 
print("\nTest for combine value type and reference type")
class Person {
    var name: String
    var friends: [Person] = []
    var friendsUnowned: [Unowned<Person>] = []
    var friendsWeak = Array<Weak<Person>>()
    init(_ name: String) {
        self.name = name
        print("New person instance: \(name)")
    }
    
    deinit {
        print("Person instance \(name) is being deallocated")
    }
}

//do {
//    let ernie = Person(name: "Ernie")
//    let bert = Person(name: "Bert")
//    
//    ernie.friends.append(bert) // Not deallocated
//    bert.friends.append(ernie) // Not deallocated
//}

class Unowned<T: AnyObject> {
    unowned var value: T
    init(_ value: T) {
        self.value = value
        print("create unowned \(value)")
    }
}

class Weak<T: AnyObject> {
    weak var value: T?
    init(_ value: T) {
        self.value = value
        print("create weak \(value)")
    }
}



do {
    let ernie = Person("Ernie")
    let bert = Person("Bert")
    
    ernie.friendsUnowned.append(Unowned(bert)) // Not deallocated
    bert.friendsUnowned.append(Unowned(ernie)) // Not deallocated
    
    ernie.friendsWeak.append(Weak(bert))
    bert.friendsWeak.append(Weak(ernie))
}


class TestBlockClass {
    var str: String = "Call TestBlockClass"
    var block: (() -> String)?
    
    deinit {
        print("releasing TestBlockClass")
    }
}

func testBlockClass() {
    print("mehtod begin")
    let test = TestBlockClass()
    test.block = { [weak test = test]() -> String in
        test?.str = "Call test.Block"
        return ""
    }
    print(test.block?())
    
    print("method end")
}

testBlockClass()

