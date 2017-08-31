//
//  UIImage+ColorRendering.swift
//  demo_v1
//
//  Created by PSL on 5/30/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    static func imageWith(frame: CGRect, color: UIColor) -> UIImage {
        let frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        UIGraphicsBeginImageContext(frame.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(frame)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
