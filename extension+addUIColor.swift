//
//  BaseViewController+lifeCycle.swift
//  opShot_Demo
//
//  Created by PSL on 12/12/16.
//  Copyright © 2016 PSL. All rights reserved.
//

import Foundation
import UIKit

// we need a key word "class" to indicate that we dont want to create a UIColor instance then reconstruct a UIColor for return
// we want a type method "class func" and return a instance, only one instance is created

// more details : http://stackoverflow.com/questions/29648348/how-to-access-extension-of-uicolor-in-swift
extension UIColor {
    public class func color_new(
        _ red: CGFloat,
        _ green: CGFloat,
        _ blue: CGFloat,
        _ alpha: CGFloat
    ) -> UIColor {
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}

let color = UIColor.color_new(0.1, 0.1, 0.1, 0.1)
