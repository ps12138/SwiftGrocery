//: [Previous](@previous)

import Foundation
import UIKit

var str = "Hello, playground"

//: [Next](@next)


/// contraint "MyClassDelegate" conformed by class
/// only class can have protocol variables
protocol MyClassDelegate: class {
    func classDelegate()
}

@objc protocol MyClassDelegate2 {
    func classDelegate()
    @objc optional func calssDelegateOptional()
}

class MyClass: MyClassDelegate {
    weak var delegate: MyClassDelegate2?
    func classDelegate() {
        
    }
}

class MyClass2: NSObject, MyClassDelegate2, MyClassDelegate {
    func classDelegate() {
        print("I'm MyClassDelegate2")
    }
}



/// for class, struct, enum
protocol MyInterface {
    mutating func interface()
}


/// associated type




/// Extension with group
// MARK: - add nested relationship
public final class ImageCache<Base> {
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
    
    public func test() {
        print("Test1 in ImageCache<\(base.self)>")
    }
    
    deinit {
        print("deinit of image cache")
    }
}

// MARK: - setting protocol
public protocol ImageCacheCompatible {
    associatedtype CompatibleType
    var ic: CompatibleType { get }
}

// MARK: - setting getter
// giving ImageCache<Self> as the CompatiableType
// ic is a computing properties
public extension ImageCacheCompatible {
    public var ic: ImageCache<Self> {
        //return ImageCache(self)
        return ImageCache.init(self)
    }
}

// MARK: - add nested class to UIImageView
extension UIImageView: ImageCacheCompatible { }


// MARK: - add methods in UIImageView.ic.
extension ImageCache where Base: UIImageView {
    public func test2() {
        print("Test2 in ImageCache where Base: UIImageView")
        print("self: \(self)")
        print("base: \(base)")
    }
}



//let imageCache = ImageCache(UIImageView.self)
//let base = imageCache.base
//imageCache.test()

let imageView = UIImageView()
//imageView.ic.test()

//imageView.ic.test2()

//print("imageView: \(imageView)")
print("ic \(imageView.ic)")
print("ic.base.ic: \(imageView.ic) \(imageView.ic.base.ic)")


//print("ic \(imageView.ic)")
//print("ic \(imageView.ic)")







