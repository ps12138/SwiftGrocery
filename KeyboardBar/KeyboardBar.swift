//
//  KeyboardBar.swift
//  ByTheWay
//
//  Created by PSL on 8/21/17.
//  Copyright © 2017 Bo Li. All rights reserved.
//

import Foundation
import PureLayout
import UIKit


protocol KeyboardBarDelegate: class {
    func didClickDone(anonymity: Bool)
}

class KeyboardBar: UIView {
    
    weak var delegate: KeyboardBarDelegate?
    fileprivate weak var contentView: UIView!
    @IBOutlet fileprivate weak var doneButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let contentView = loadViewFromNib()
        addSubview(contentView)
        contentView.autoPinEdgesToSuperviewEdges()
        self.contentView = contentView
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let contentView = loadViewFromNib()
        addSubview(contentView)
        contentView.autoPinEdgesToSuperviewEdges()
        self.contentView = contentView
        setupUI()
    }
    
    func loadViewFromNib() -> UIView {
        let classType = type(of: self)
        let bundle = Bundle(for: classType)
        let name = String(describing: classType)
        let nib = UINib(nibName: name, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return view
    }
    
    func setupUI() {
        let switcher1 = AnonySwitch(title: "我了个去")
        addSubview(switcher1)
        switcher1.autoAlignAxis(.horizontal, toSameAxisOf: doneButton)
        switcher1.autoPinEdge(.trailing, to: .leading, of: doneButton, withOffset: -10)
        
        let switcher2 = AnonySwitch(title: "匿名哈")
        addSubview(switcher2)
        switcher2.autoAlignAxis(.horizontal, toSameAxisOf: switcher1)
        switcher2.autoPinEdge(.trailing, to: .leading, of: switcher1, withOffset: -10)

        let switcher3 = AnonySwitch()
        addSubview(switcher3)
        switcher3.autoAlignAxis(.horizontal, toSameAxisOf: switcher2)
        switcher3.autoPinEdge(.trailing, to: .leading, of: switcher2, withOffset: -10)
        
        doneButton.backgroundColor = UIColor.white
        doneButton.layer.borderColor = UIColor.groupTableViewBackground.cgColor
        doneButton.layer.borderWidth = 1
        doneButton.layer.cornerRadius = 5
        doneButton.addTarget(self, action: #selector(self.didClickDone(sender:)), for: .touchUpInside)
    }
    
    @objc
    func didClickDone(sender:UIButton) {
        
    }
    
}
