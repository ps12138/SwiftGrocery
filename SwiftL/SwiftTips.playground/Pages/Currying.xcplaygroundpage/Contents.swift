//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)



// Currying adding
func add(to adder: Int) -> (Int) -> Int {
    return { num in
        return num + adder
    }
}
let addTwo = add(to: 2)
let result = addTwo(6)


// Currying compare
func greater(than comparer: Int) -> (Int) -> Bool {
    return { $0 > comparer }
}
let greaterThan10 = greater(than: 10)
print("greaterThan10(13): \(greaterThan10(13))")
print("greaterThan10(10): \(greaterThan10(10))")
print("greaterThan10(9): \(greaterThan10(9))")


/// Target-Action Safety using
protocol TargetAction {
    func performAction()
}

struct TargetActionWrapper<T: AnyObject>: TargetAction {
    
    weak var target: T?
    let action: (T) -> () -> ()
    
    func performAction() {
        if let t = target {
            action(t)()
        }
    }
}

enum ControlEvent {
    case TouchUpInside
    case ValueChanged
}

class Control {
    var actions = [ControlEvent: TargetAction]()
    
    func setup<T: AnyObject>(
        target: T,
        action: @escaping (T) -> () -> (),
        controlEvent: ControlEvent) {
        
        actions[controlEvent] = TargetActionWrapper(target: target, action: action)
    }
    
    func removeTarget(for controlEvent: ControlEvent) {
        actions[controlEvent] = nil
    }
    
    func performAction(for controlEvent: ControlEvent) {
        actions[controlEvent]?.performAction()
    }
}









