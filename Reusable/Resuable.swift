//
//  Extension+UITableViewCell.swift
//  DemoV1
//
//  Created by PSL on 5/1/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Foundation
import UIKit

// MARK: - conform Resuable
public protocol Resuable: class {

    static var defaultResuableIdentifier: String { get }
}

extension Resuable where Self: UIView {

    static var defaultResuableIdentifier: String {
        return String(describing: self)
    }
}
