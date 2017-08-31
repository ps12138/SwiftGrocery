//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

// Array subscript
// subscript(index: Int) -> T
// subscript(subRange: Range<Int>) -> Slice<T>

extension Array {
    subscript(input: [Int]) -> ArraySlice<Element?> {
        get {
            var result = ArraySlice<Element?>()
            for i in input {
                //assert(i < self.count, "Index out of range")
                if i >= self.count {
                    result.append(nil)
                    continue
                }
                result.append(self[i])
            }
            return result
        }
        
        set {
            for (index, i) in input.enumerated() {
                //assert(i < self.count, "index out of range")
                guard i < self.count else {
                    continue
                }
                guard let newVal = newValue[index] else {
                    continue
                }
                self[i] = newVal
            }
        }
    }
}



var array = [1, 2, 3, 4, 5]
print(array[[0,2,3]])

array[[0,2,3]] = [-1, -3, -4]
print(array)


