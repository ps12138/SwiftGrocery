//
//  UICollectionView+Resuable.swift
//  DemoV1
//
//  Created by PSL on 5/19/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Foundation
import UIKit

// MARK: - for UICollectionViewCell register/deque
public extension UICollectionView {

    /// Register a UICollectionViewCell subclass who conform Reusable and NibLoadable
    ///
    /// - Parameter cellType: conform to NibLoadable and Reusable
    func register<T: UICollectionViewCell>(cellType: T.Type) where T: NibReusable {
        let bundle = Bundle(for: cellType)
        let defaultNib = UINib(nibName: cellType.defaultNibName, bundle: bundle)
        self.register(defaultNib, forCellWithReuseIdentifier: cellType.defaultResuableIdentifier)
    }

    /// Register a UICollecitonViewCell subclass who conform Reusable
    ///
    /// - Parameter cellType: conform to Resuable
    func register<T: UICollectionViewCell>(cellType: T.Type) where T: Resuable {
        self.register(cellType, forCellWithReuseIdentifier: cellType.defaultResuableIdentifier)
    }

    /// dequeue a UICollectionViewCell subclass who conform Resuable
    /// dequeueReuseableCell(forIndexPath: indexPath) as CustomCollectionViewCell
    ///
    /// - Parameters:
    ///   - indexPath: indexPath from UICollectionView
    ///   - cellType: UICollectionViewCell or its subclass type
    /// - Returns: UICollectionViewCell or its subclass, will be inferred by "as"
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath, cellType: T.Type = T.self) -> T where T: Resuable {

        let rawCell = self.dequeueReusableCell(withReuseIdentifier: cellType.defaultResuableIdentifier, for: indexPath)
        guard let cell = rawCell as? T else {
            fatalError("Fail to dequeue cell with id: \(cellType.defaultResuableIdentifier)")
        }
        return cell
    }
}

// MARK: - for dequeReusableSupplementaryView register/deque
public extension UICollectionView {

    /// register supplementaryView
    ///
    /// - Parameters:
    ///   - supplementaryViewType: supplementaryViewType
    ///   - elementKind: header/footer
    func register<T: UICollectionReusableView>(supplementaryViewType: T.Type, ofKind elementKind: String) where T: Resuable {
        self.register(
            supplementaryViewType.self,
            forSupplementaryViewOfKind: elementKind,
            withReuseIdentifier: supplementaryViewType.defaultResuableIdentifier
        )
    }

    /// dequeue a SupplementaryView subclass who conform Resuable
    /// dequeueReuseableSupplementaryView(ifKind: header/footer,forIndexPath: indexPath) as CustomView
    ///
    /// - Parameters:
    ///   - elementKind: header/footer
    ///   - indexPath: indexPath from UICollecitonView
    ///   - viewType: supplementaryViewType
    /// - Returns: UIView or its subclass, will be inferred by "as"
    func dequeReusableSupplementaryView<T: UICollectionReusableView>(ofKind elementKind: String, for indexPath: IndexPath, viewType: T.Type = T.self) -> T where T: Resuable {
        let rawView = self.dequeueReusableSupplementaryView(
            ofKind: elementKind,
            withReuseIdentifier: viewType.defaultResuableIdentifier,
            for: indexPath
        )
        guard let view = rawView as? T else {
            fatalError("Fail to dequeue cell with id: \(viewType.defaultResuableIdentifier)")
        }
        return view
    }
}
