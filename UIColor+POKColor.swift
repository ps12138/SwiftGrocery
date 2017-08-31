//
//  UIColor+POKColor.swift
//  demo_v1
//
//  Created by PSL on 7/18/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Foundation
import UIKit

public class POKColor<Base> {

}

public protocol POKColorCompatible {
    associatedtype CompatibleType
    static var pok: CompatibleType { get }
}

public extension POKColorCompatible {
    static var pok: POKColor<Self> {
        return POKColor<Self>()
    }
}

extension UIColor: POKColorCompatible { }

public extension POKColor where Base: UIColor {
    var tagTextColor: UIColor {
        return UIColor.hex("F6A623")
    }

    var darkTextColor: UIColor {
        return UIColor.hex("2B2B2B")
    }

    var lightTextColor: UIColor {
        return UIColor.hex("4B4B4B")
    }
    
    var borderColor: UIColor {
        return UIColor.hex("DFDFDF")
    }
}
