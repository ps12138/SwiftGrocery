//
//  AnonySwitch.swift
//  ByTheWay
//
//  Created by PSL on 8/21/17.
//  Copyright © 2017 Bo Li. All rights reserved.
//

import Foundation
import UIKit
import PureLayout

@IBDesignable
class AnonySwitch: UIView {
    
    // MARK: - Properties
    @IBInspectable var defaultTextFont: UIFont = UIFont.helveticaNeueLight(12)
    @IBInspectable var selectedTextFont: UIFont = UIFont.helveticaNeueLight(12)
    @IBInspectable var defaultTextColor: UIColor = UIColor.lightGray
    @IBInspectable var selectedTextColor: UIColor = UIColor.darkGray
    @IBInspectable var useGradient: Bool = true
    @IBInspectable var containerBackgroundColor: UIColor = UIColor.lightGray
    @IBInspectable var indicatorDeselectBackgroundColor: UIColor = UIColor.white
    @IBInspectable var indicatorSelectBackgroundColor: UIColor = mainColor
    @IBInspectable var slidingGap: CGFloat = 20
    @IBInspectable var stringHeightMargin: CGFloat = 1
    @IBInspectable var stringWidthMargin: CGFloat = 5
    @IBInspectable var cornerRadiusRatio: CGFloat = 0.2
    @IBInspectable var selectState: Bool {
        get {
            return isSelected
        }
        set {
            updateSelection(from: isSelected, to: newValue, animated: false)
        }
    }
    fileprivate var isSelected: Bool = false
    fileprivate var itemTitle: String = "匿名"
    fileprivate var isConfigurated: Bool = false
    fileprivate var attributedDefaultTitle: NSAttributedString!
    fileprivate var attributedSelectedTitle: NSAttributedString!
    fileprivate var intrinsicSize: CGSize = CGSize.zero
    fileprivate var contentHeight: CGFloat = 0
    fileprivate var contentWidth: CGFloat = 0
    fileprivate var edgeInsets: UIEdgeInsets = UIEdgeInsetsMake(2, 1, 2, 1)
    
    // MARK: - Subviews
    fileprivate weak var indicatorView: UIView!
    fileprivate weak var indicatorLabel: UILabel!
    fileprivate weak var indicatorViewLeading: NSLayoutConstraint!
    
    // MARK: - life cycle
    override var intrinsicContentSize: CGSize {
        return intrinsicSize
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupIntrinsicContentSize()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupIntrinsicContentSize()
    }
    
    convenience init(title: String? = nil) {
        self.init(frame: CGRect.zero)
        self.itemTitle = title ?? self.itemTitle
        setupIntrinsicContentSize()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if isConfigurated {
            return
        }
        isConfigurated = true
        configureView()
        configureIndicatorView()
        configureTitleLabel()
        UpdateIndicatorViewStyle(isSelected: self.isSelected)
    }
    
    @objc
    func didTap(_ gesture: UIGestureRecognizer) {
        if isSelected {
            updateSelection(from: isSelected, to: false, animated: true)
        } else {
            updateSelection(from: isSelected, to: true, animated: true)
        }
        
    }
    
    @objc
    func didSwipe(_ gesture: UIGestureRecognizer) {
        guard let swipe = gesture as? UISwipeGestureRecognizer else {
            return
        }
        if swipe.direction == .left {
            updateSelection(from: isSelected, to: false, animated: true)
            
        } else if swipe.direction == .right{
            updateSelection(from: isSelected, to: true, animated: true)
        }
    }
}

// MARK: - Utilities
extension AnonySwitch {
    
    fileprivate func updateSelection(from state: Bool, to newState: Bool, animated: Bool) {
        if state == newState {
            return
        }
        isSelected = newState
        if newState == true {
            indicatorViewLeading.constant = intrinsicContentSize.width - contentWidth - edgeInsets.right
        } else {
            indicatorViewLeading.constant = edgeInsets.left
        }
        
        if animated {
            UIView.animate(withDuration: 0.3, animations: {
                self.layoutIfNeeded()
                self.UpdateIndicatorViewStyle(isSelected: newState)
            }, completion: nil)
        } else {
            self.setNeedsLayout()
        }
    }
    
    fileprivate func UpdateIndicatorViewStyle(isSelected: Bool) {
        if isSelected {
            indicatorLabel.attributedText = attributedSelectedTitle
            indicatorView.backgroundColor = indicatorSelectBackgroundColor
        }
        else {
            indicatorLabel.attributedText = attributedDefaultTitle
            indicatorView.backgroundColor = indicatorDeselectBackgroundColor
        }
    }
    
    fileprivate func setupIntrinsicContentSize() {
        attributedDefaultTitle = attributedStringForText(itemTitle, isSelected: false)
        attributedSelectedTitle = attributedStringForText(itemTitle, isSelected: true)
        
        let stringHeight = max(attributedDefaultTitle.stringSize().height, attributedSelectedTitle.stringSize().height)
        let stringWidth = max(attributedDefaultTitle.stringSize().width, attributedSelectedTitle.stringSize().width)
        contentWidth = stringWidth + 2 * stringWidthMargin
        contentHeight = stringHeight + 2 * stringHeightMargin
        
        let instrinsicWidth = contentWidth + edgeInsets.left + edgeInsets.right + slidingGap
        let instrinsicHeight = contentHeight + edgeInsets.top + edgeInsets.bottom
        
        intrinsicSize = CGSize(width: instrinsicWidth, height: instrinsicHeight)
    }
    
    fileprivate func configureView() {
        backgroundColor = containerBackgroundColor
        layer.cornerRadius = cornerRadiusRatio * intrinsicContentSize.height
        
        isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.didTap(_:)))
        addGestureRecognizer(tapGesture)
        
        let leftSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(self.didSwipe(_:)))
        leftSwipeGesture.direction = .left
        let rightSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(self.didSwipe(_:)))
        rightSwipeGesture.direction = .right
        addGestureRecognizer(leftSwipeGesture)
        addGestureRecognizer(rightSwipeGesture)
    }
    
    fileprivate func configureIndicatorView() {
        let indicatorView = UIView()
        self.addSubview(indicatorView)
        indicatorView.layer.cornerRadius = cornerRadiusRatio * contentHeight
        
        indicatorView.autoAlignAxis(toSuperviewAxis: .horizontal)
        indicatorView.autoSetDimensions(to: CGSize(width: contentWidth, height: contentHeight))
        indicatorViewLeading = indicatorView.autoPinEdge(toSuperviewEdge: .leading, withInset: edgeInsets.left)
        self.indicatorView = indicatorView
    }
    
    fileprivate func configureTitleLabel() {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 1
        self.indicatorView.addSubview(label)
        label.autoPinEdgesToSuperviewEdges()
        self.indicatorLabel = label
    }
    
    fileprivate func attributedStringForText(_ text: String, isSelected: Bool) -> NSAttributedString {
        let textColor = isSelected ? selectedTextColor : defaultTextColor
        let textFont = isSelected ? selectedTextFont : defaultTextFont
        
        let attributes = [NSForegroundColorAttributeName : textColor,
                          NSFontAttributeName : textFont]
        let attributedString = NSMutableAttributedString(string: text, attributes: attributes)
        return attributedString
    }
}

fileprivate extension UIFont {
    class func helveticaNeueLight(_ size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-Light", size: size)!
    }
}

fileprivate extension NSAttributedString {
    func stringSize() -> CGSize {
        return self.boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude), options: .usesLineFragmentOrigin, context: nil).size
    }
}
