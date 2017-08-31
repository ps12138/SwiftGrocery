//
//  NibOwnerLoadable.swift
//  demo_v1
//
//  Created by PSL on 8/23/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Foundation
import UIKit

public protocol NibOwnerLoadable: class {
    /// The nib file to use to load a new instance of the View designed in a XIB
    static var nib: UINib { get }
}

// MARK: Default implementation
public extension NibOwnerLoadable {
    /// By default, use the nib which have the same name as the name of the class,
    /// and located in the bundle of that class
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
}

// MARK: Support for instantiation from NIB
public extension NibOwnerLoadable where Self: UIView {
    func loadNibContent() {
        let layoutAttributes: [NSLayoutAttribute] = [.top, .leading, .bottom, .trailing]
        for view in Self.nib.instantiate(withOwner: self, options: nil) {
            if let view = view as? UIView {
                view.translatesAutoresizingMaskIntoConstraints = false
                self.addSubview(view)
                layoutAttributes.forEach { attribute in
                    let layout = NSLayoutConstraint(
                        item: view,
                        attribute: attribute,
                        relatedBy: .equal,
                        toItem: self,
                        attribute: attribute,
                        multiplier: 1,
                        constant: 0.0)
                    self.addConstraint(layout)
                }
            }
        }
    }
}
