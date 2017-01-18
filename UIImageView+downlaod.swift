//
//  File.swift
//  ImageCache
//
//  Created by PSL on 1/17/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Foundation
import UIKit

// MARK: - extension stored properties
extension UIImageView {
    
    /// accociatedkeys for extension properties
    internal struct AssociatedKeys {
        static var lastUrlStr: String?
    }
    /// last url for downloading
    public var lastUrlStr: String? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.lastUrlStr) as? String
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedKeys.lastUrlStr,
                    newValue as String?,
                    objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
}

// MARK: - extension methods
extension UIImageView {
    
    /// download
    public func download(imageFrom urlStr: String,
                              placeHolder: String? = nil) {
        
        if let placeHolder = placeHolder {
            self.image = UIImage(named: placeHolder)
        } else {
            self.image = nil
        }
        // use the stored properties in here
        self.lastUrlStr = urlStr
        ImageCacheManager.shared.download(imageFrom: urlStr) {
            (newImage, url) in
            
            if let validLastUrlStr = self.lastUrlStr,
                validLastUrlStr != url {
                print("ImCacheMan: ignore \(validLastUrlStr)")
                return
            }
            DispatchQueue.main.async {
                self.image = newImage
            }
        }
    }
}


