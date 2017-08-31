//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)



// Example
var string: String? = "string"
var anotherString: String?? = string
print(anotherString)


// Multiple Optional, optional binding
var aNil: String? = nil
var anotherNil: String?? = aNil // outer is nil, inner is nil
var literalNil: String?? = nil // outer is nil

if let a = anotherNil {
    print("anotherNil: \(a)")
}
if let b = literalNil {
    print("literalNil: \(b)")
}



// debug
/*
 (lldb) fr v -R anotherNil
 (Swift.Optional<Swift.Optional<Swift.String>>)
 anotherNil = Some {
 ... 中略
 }
 (lldb) fr v -R literalNil
 (Swift.Optional<Swift.Optional<Swift.String>>)
 literalNil = None {
 ... 中略
 }
*/



