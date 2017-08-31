//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


// IteraatorProtocol 
// - typealias Element
// - next() -> Element?
class ReverseIterator<T>: IteratorProtocol {
    typealias Element = T
    
    var array: [Element]
    var currentIndex = 0
    
    init(array: [Element]) {
        self.array = array
        currentIndex = array.count - 1
    }
    
    func next() -> Element? {
        if currentIndex < 0 {
            return nil
        } else {
            let element = array[currentIndex]
            currentIndex -= 1
            return element
        }
    }
}

// Sequence
// - typelias Iterator
// - makeIterator() -> Iterator?

struct ReverseSequence<T>: Sequence {
    var array: [T]
    typealias Iterator = ReverseIterator<T>
    
    init(array: [T]) {
        self.array = array
    }
    
    func makeIterator() -> ReverseIterator<T> {
        return ReverseIterator(array: self.array)
    }
}

let array = [0,1,2,3,4]

for i in ReverseSequence(array: array) {
    print("Index \(i) is \(array[i])")
}

// implementation of for...in
/*
var iterator = array.makeIterator()
while let obj = iterator.next()
*/

// Sequence protocol has extensions
/*
extension Sequence {

 func map<T>(_ transform: (Self.Iterator.Element) throws -> T) rethrows - > [T]
 func filter(_ transform: (Self.Iterator.Element) throws -> Bool) rethrows -> [Self.Iterator.Element]
 
 func reduce<Resule>(
    _ initialResult: Result, 
    _ nextPartialResult: (partialResult: Result, Self.Iterator.Element) throws -> Result) rethrows -> Result
}
*/
















