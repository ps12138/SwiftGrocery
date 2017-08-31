//: [Previous](@previous)

import Foundation
import UIKit

var str = "Hello, playground"

//: [Next](@next)



/// AnyClass general interface
class MusicViewController: UIViewController { }
class AlbumViewController: UIViewController { }

let usingVCTypes: [AnyClass] = [
    MusicViewController.self,
    AlbumViewController.self
]

func setupViewControllers(_ vcTypes: [AnyClass]) {
    for vcType in vcTypes {
        if let validVcType = vcType as? UIViewController.Type {
            let vc = validVcType.init()
            print(vc)
        }
    }
}

setupViewControllers(usingVCTypes)

func setupViewControllers2(_ vcTypes: [AnyClass]) {
    for vcType in vcTypes {
        if vcType is UIViewController.Type {
            let vc = (vcType as! UIViewController.Type).init()
            print(vc)
        }
    }
}

setupViewControllers2(usingVCTypes)

/// .Type, get its meta type, from clas struct enum
/// .Protocol, get its meta type, from .Protocol

protocol MyProtocol {
    func test()
}

class MyClass { }
struct MyStruct { }
enum MyEnum { }


let protocolType: MyProtocol.Protocol = MyProtocol.self
let classType: MyClass.Type = MyClass.self
let structType: MyStruct.Type = MyStruct.self
let enumType: MyEnum.Type = MyEnum.self



let anyclassType: AnyClass = MyClass.self
let anystruct: AnyObject = MyStruct() as AnyObject
//let anystructType: AnyClass = MyStruct.self
//let anyenumType: AnyClass = MyEnum.self
//let anyenum: AnyObject = MyEnum() as AnyObject


