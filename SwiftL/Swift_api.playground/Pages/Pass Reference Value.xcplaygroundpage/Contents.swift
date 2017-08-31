//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)



func test() {
    
    var num = 1
    func passRef(_ input: inout Int) {
        print("input: \(input)")
        print("num: \(num)")
        
        input = 2
        print("input: \(input)")
        print("num: \(num)")
    }
    print("before num: \(num)")
    passRef(&num)
    print("after num: \(num)")
}

test()


print("\ntestArray")
func testArray() {
    
    var num = [1, 2, 3]
    func passRef(_ input: inout [Int]) {
        print("input: \(input)")
        print("num: \(num)")
        
        input = [1,2]
        print("input: \(input)")
        print("num: \(num)")
    }
    print("before num: \(num)")
    passRef(&num)
    print("after num: \(num)")
}

testArray()



print("\ntestArray2")


class TestArray {
    var num = [1, 2, 3]
    func testArray() {
        print("before num: \(num)")
        passRef(&num)
        print("after num: \(num)")
    }
    
    func passRef(_ input: inout [Int]) {
        print("input: \(input)")
        print("num: \(self.num)")
        
        input = [1,2]
        print("input: \(input)")
        print("num: \(self.num)")
    }
}

let testArrayClass = TestArray()
testArrayClass.testArray()



// passing Ref for Struct
print("passing Ref for Struct")
struct RefStruct {
    var hehe = 1
}

var refStruct1 = RefStruct()
print("refStruct1.hehe: \(refStruct1.hehe)")

func testRefStruct(myStruct: inout RefStruct) {
    print("refStruct1.hehe: \(refStruct1.hehe)")
    myStruct.hehe = 2
    print("refStruct1.hehe: \(refStruct1.hehe)")
    print("myStruct.hehe: \(myStruct.hehe)")
}

testRefStruct(myStruct: &refStruct1)





