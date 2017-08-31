//: [Previous](@previous)

import Foundation
import UIKit

var str = "Hello, playground"

//: [Next](@next)

protocol Vehicle {
    var numberOfWheels: Int { get }
    var color: UIColor { get set }
    mutating func changeColor()
}

struct MyCar: Vehicle {
    let numberOfWheels = 4
    var color = UIColor.blue
    
    mutating func changeColor(){
        color = .red
    }
}
