//
//  Extension+UITableView.swift
//  DemoV1
//
//  Created by PSL on 5/2/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Foundation
import UIKit

// MARK: - support resuable cell
/// register(TableViewCell.self)
/// dequeueReuseableCell(forIndexPath: indexPath) as CustomTableViewCell
/// dequeueReuseableCell(forIndexPath: indexPath, cellType: cell.self)
public extension UITableView {

    final func register<T: UITableViewCell>(_ cellType: T.Type) -> Void where T: NibReusable {
        let bundle = Bundle(for: cellType)
        let defaultNib = UINib(nibName: cellType.defaultNibName, bundle: bundle)
        register(defaultNib, forCellReuseIdentifier: cellType.defaultResuableIdentifier)
    }

    final func register<T: UITableViewCell>(_ cellType: T.Type) -> Void where T: Resuable {
        register(cellType, forCellReuseIdentifier: cellType.defaultResuableIdentifier)
    }

    final func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath, cellType: T.Type = T.self) -> T where T: Resuable {

        guard let cell = dequeueReusableCell(withIdentifier: cellType.defaultResuableIdentifier, for: indexPath) as? T else {
            fatalError("Fail to dequeue cell with id: \(cellType.defaultResuableIdentifier)")
        }
        return cell
    }
}

// MARK: - support resuable header or footer view
/// register(UITableViewHeaderFooterView.self)
/// dequeueReuseableReusableHeaderFooterView() as UITableViewHeaderFooterView?ß
/// dequeueReuseableReusableHeaderFooterView(UITableViewHeaderFooterView.self) as UITableViewHeaderFooterView?
public extension UITableView {

    final func register<T: UITableViewHeaderFooterView>(_ viewType: T.Type) -> Void where T: NibReusable {
        let bundle = Bundle(for: viewType)
        let nib = UINib(nibName: viewType.defaultNibName, bundle: bundle)
        register(nib, forCellReuseIdentifier: viewType.defaultResuableIdentifier)
    }

    final func register<T: UITableViewHeaderFooterView>(_ viewType: T.Type) -> Void where T: Resuable {
        register(viewType.self, forCellReuseIdentifier: viewType.defaultResuableIdentifier)
    }

    final func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_ viewType: T.Type = T.self) -> T? where T: Resuable {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: viewType.defaultResuableIdentifier) as? T? else {
            fatalError("Fail to dequeue header/footer view with id \(viewType.defaultResuableIdentifier)")
        }
        return view
    }
}
