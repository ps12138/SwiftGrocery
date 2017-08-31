//: [Previous](@previous)

import Foundation

//func compress(data: String) -> String {
//    
//    if data.isEmpty || data.characters.count < 2 {
//        return data
//    }
//    
//    let strArray = data.characters.flatMap {
//        String($0)
//    }
//    let len = strArray.count
//    var result = ""
//    var last: String? = nil
//    var count = 0
//    for i in 0..<len {
//        if let validLast = last {
//            if strArray[i] == validLast {
//                count += 1
//            } else {
//                result.append(String(count))
//                result.append(validLast)
//                count = 1
//                last = strArray[i]
//            }
//        } else {
//            last = strArray[i]
//            count = 1
//        }
//        print(result)
//    }
//    if let validLast = last {
//        result.append(String(count))
//        result.append(validLast)
//    }
//    if result.characters.count >= len {
//        return data
//    }
//    return result
//}





func comp(data: String) -> String {
    var res: String = ""
    let charArr = data.characters.flatMap {
        String($0)
    }
    var index = 0
    let total = charArr.count
    while index < total {
        var j = index + 1
        while j < charArr.count && charArr[j] == charArr[index] {
            j += 1
        }
        res.append(charArr[index])
        res += String(j-index)
        if res.characters.count >= total {
            return data
        }
        index = j
    }
    return res
}
let res = comp(data: "aaaaabbbbbdddd")



/*
a 1 1
1ae1
aa 11
eae1
 
abcdefgh 11
8abcdefghe1
 
1a
*/


