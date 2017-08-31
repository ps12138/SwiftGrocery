//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


// final - class, func, var
// - 表⽰不允许对该内容进⾏继承或者重写操作

// Purpose
// - 权限控制, avoiding code moddify
// - 类或者⽅法的功能确实已经完备了, such as encryption code
// - ⼦类继承和修改是⼀件危险的事情
//   在某个公司管理的系统中我们对员⼯按照⼀定规则进⾏编号，
//   这样通过编号我们能迅速找到任⼀员⼯。
//   ⽽假如我们在⼦类中重写了这个编号⽅法，
//   很可能就导致基类中的依赖员⼯编号的⽅法失效。
//   在这类情况下，将编号⽅法标记为 final 以确保稳定，
//   可能是⼀种更好的做法。
// - 为了⽗类中某些代码⼀定会被执⾏
//   有时候⽗类中有⼀些关键代码是在被继承重写后必须执⾏的 (⽐如状态配置，认证等等)，
//   否则将导致运⾏时候的错误。
//   ⽽在⼀般的⽅法中，如果⼦类重写了⽗类⽅法，
//   是没有办法强制⼦类⽅法⼀定去调⽤相同的⽗类⽅法的。
//   在 Objective-C 的时候我们可以通过__attribute__((objc_requires_super))
//   这样的属性来让编译器在⼦类没有调⽤⽗类⽅法时抛出警告。
//   在 Swift 中对原来的很多 attribute 的⽀持现在还缺失中，
//   为了达到类似的⽬的，我们可以使⽤⼀个 final 的⽅法，
//   在其中进⾏⼀些必要的配置，然后再调⽤某个需要⼦类实现的⽅法，
//   以确保正常运⾏：

class Parent {
    final func method() {
        print("begin config")
        // ..some code
        methodImpl()
        // ..some code
        print("end config")
    }
    func methodImpl() {
        fatalError("subclass must imp")
        // or giving default imp
    }
}
class Child: Parent {
    override func methodImpl() {
        //..subclass logic
    }
}


// - 性能考虑
//   使⽤ final 的另⼀个重要理由是可能带来的性能改善。
//   因为编译器能够从 final 中获取额外的信息，
//   因此可以对类或者⽅法调⽤进⾏额外的优化处理。
//   但是这个优势在实际表现中可能带来的好处其实就算
//   与 Objective-C 的动态派发相⽐也⼗分有限




