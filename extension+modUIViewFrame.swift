//
//  BaseViewController+lifeCycle.swift
//  opShot_Demo
//
//  Created by PSL on 12/12/16.
//  Copyright © 2016 PSL. All rights reserved.
//

import Foundation
import UIKit


// UIView.frame is a CGRect, its height/width only has get, so we cannot set it directly.
// in here, we can set it directly

let testView = UIView()
testView.frameHeight = 20
testView.frame.height = 30

extension UIView {
    public var frameHeight: CGFloat {
        get {
            return frame.height
        }
        set {
            frame.size.height = newValue
        }
    }
}
extension CGRect {
     public var height: CGFloat {
        get {
            return size.height
        }
        set {
            size.height = newValue
        }
    }
}


