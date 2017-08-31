//: [Previous](@previous)

import Foundation
import UIKit
var str = "Hello, playground"

//: [Next](@next)


enum ImageName: String {
    case myImage = "my_image"
}
enum SegueName: String {
    case mySegue = "my_segue"
}
extension UIImage {
    convenience init!(imageName: ImageName) {
        self.init(named: imageName.rawValue)
    }
}
extension UIViewController {
    func performSegue(withName segueName: SegueName, sender: Any?) {
        performSegue(withIdentifier: segueName.rawValue, sender: sender)
    }
}
// 在使⽤时，就可以直接⽤ extension 中的类型安全的版本了：
let image = UIImage(imageName: .myImage)
//UIViewController().performSegue(withName: .mySegue, sender: nil)