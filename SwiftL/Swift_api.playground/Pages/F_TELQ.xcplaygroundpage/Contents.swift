


// Q1
// Can you introduce the memory management of iOS?

// ARC, swift
// how to work, @autoreleasepool and runloop


// Q2
// can you talk some about difference in struct and class?

// pass value or reference
// conform protocol, @objc or protocol Name: class { }
// inheritance
// deinit

// Q3
// How to determine using struct or class?

// for thread-safe, pass model data using struct (avoiding state inconsistence)
// for frequently modify, using class (avoiding write-on-copy)




// Code1
// ["A", "B", "A", "D"] -> ["A", "B", "D"]
// ask for opt forn two pass to one pass

func uniqueArray(strs: [String]) -> [String] {
    var strSet = Set<String>()
    var res = Array<String>()
    
    for str in strs {
        if strSet.contains(str) == false {
            res.append(str)
            strSet.insert(str)
        }
    }
    return res
}


func uniqueArray2(strs: [String]) -> [String] {
    var strSet = Set<String>(strs)
    var res = Array<String>()
    
//    for str in strs {
//        strSet.insert(str)
//    }
    
    for str in strs {
        if strSet.contains(str) == true {
            strSet.remove(str)
            res.append(str)
        }
    }
    return res
}

extension Array where Element: Hashable {
    func unique() -> [Element] {
        if self.isEmpty {
            return [Element]()
        }
        
        var set = Set<Element>()
        let results = self.filter { (element) -> Bool in
            if set.contains(element) == false {
                set.insert(element)
                return true
            }
            return false
        }
        
        return results
    }
}

let array = [1,2,3,4,3,5,1,2]
let unique = array.unique()



// Code2
// [1, 2, 3, 5, 6, 7, 8, 9, 10]
// 1 good                   10 bad -> find first bad

func isBad(_ num: UInt) -> Bool {
    if num >= 6 {
        return true
    }
    return false
}


func findFristBad(first: UInt, last: UInt) -> UInt {
    if first >= last || isBad(first) == true || isBad(last) == false {
        return 0
    }
    
    var left = first
    var right = last
    
    while left + 1 < right {
        let mid = left + (right - left) / 2
        if isBad(mid) == true {
            right = mid
        } else {
            left = mid
        }
    }
    
    if isBad(left) == true {
        return left
    }
    return right
}


let nums: Array<UInt> = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let res = findFristBad(first: 1, last: 10)



// Code3 

func uniqueArray2<T: Hashable>(strs: [T]) -> [T] {
    var strSet = Set<T>()
    var res = Array<T>()
    
    for str in strs {
        if strSet.contains(str) == false {
            res.append(str)
            strSet.insert(str)
        }
    }
    return res
}

class MyClass: Hashable {
    var id: Int = 10
    var hashValue: Int {
        get {
            return id
        }
    }
    
    static func ==(_ left: MyClass, _ right: MyClass) -> Bool {
        return left === right
    }
}

struct MyStruct: Hashable {
    var id: Int = 100
    var hashValue: Int {
        return id
    }
    static func==(_ lhs: MyStruct, _ rhs: MyStruct) -> Bool {
        return lhs.id == rhs.id
    }
}






