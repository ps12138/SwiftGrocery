//
//  UIColor+transform.swift
//  demo_v1
//
//  Created by PSL on 6/1/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    /**
     parsing hexString of RGB,
     curried func,
     will not process "#", just hex string
     - Parameters:
     - RGBstring: hexstring for RGB, count = 6 only
     - alpha: alpha from 0.0 to 1.0
     - returns:
     UIColor instance
     */
    public static func hex(_ hexString: String, alpha: CGFloat = 1.0) -> UIColor {
        if hexString.characters.count != 6 {
            return UIColor.red
        }
        var hexUInt: UInt32 = 0
        let scan = Scanner(string: hexString)
        scan.scanHexInt32(&hexUInt)
        let hexInt = Int(hexUInt)
        let red = CGFloat((hexInt & 0xff0000) >> 16) / 255.0
        let green = CGFloat((hexInt & 0x00ff00) >> 8) / 255.0
        let blue = CGFloat(hexInt & 0x0000ff) / 255.0
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}
