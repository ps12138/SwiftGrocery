//
//  Extension+ViewController.swift
//  DemoV1
//
//  Created by PSL on 5/1/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Foundation
import UIKit

/// NibLoadable
public protocol NibLoadable: class {

    static var defaultNibName: String { get }
}

// MARK: - UIViewController
public extension NibLoadable where Self: UIViewController {

    static var defaultNibName: String {
        return String(describing: self)
    }

    static func initWithNib(_ nibName: String = Self.defaultNibName) -> Self {
        return Self(nibName: nibName, bundle: Bundle(for: self))
    }
}

// MARK: - UIView
public extension NibLoadable where Self: UIView {

    static var defaultNibName: String {
        return String(describing: self)
    }

    static func loadFromNib() -> Self {
        let nib = UINib(nibName: Self.defaultNibName, bundle: Bundle(for: self))
        guard let view = nib.instantiate(withOwner: nil, options: nil).first as? Self else {
            fatalError("THe nib \(nib) expected its root view to be of type \(self)")
        }
        return view
    }
}
