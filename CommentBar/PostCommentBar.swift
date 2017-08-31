//
//  PostCommentBar.swift
//  Slow
//
//  Created by PSL on 8/6/17.
//  Copyright © 2017 Li, Bo. All rights reserved.
//

import UIKit

protocol PostCommentBarDelegate: class {
    func didTapReply(model: PostCommentBarViewModel)
}

fileprivate let CommentTextViewMaxHeight: CGFloat = 100
fileprivate let DefaultTextViewHeight: CGFloat = 30

class PostCommentBar: UIView {
    // MARK: - Models
    var viewModel: PostCommentBarViewModel! {
        get {
            instanceViewMdoel.commentBody = commentTextView.text
            return instanceViewMdoel
        }
        set {
            instanceViewMdoel = newValue ?? PostCommentBarViewModel()
            updateUI()
        }
    }
    
    fileprivate var instanceViewMdoel = PostCommentBarViewModel()
    
    // MARK: - Views
    fileprivate weak var contentView: UIView!
    @IBOutlet weak var placeHolderLabel: UILabel!
    @IBOutlet weak var commentTextView: UITextView!
    @IBOutlet weak var replyButton: UIButton!
    @IBOutlet weak var commentTextViewHeight: NSLayoutConstraint!
    
    // MARK: - properties
    weak var delegate: PostCommentBarDelegate?
    // var isEditing: Bool = false
    
    // MARK: - life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        let contentView = loadViewFromNib()
        addSubview(contentView)
        contentView.autoPinEdgesToSuperviewEdges()
        self.contentView = contentView
        prepareUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let contentView = loadViewFromNib()
        addSubview(contentView)
        contentView.autoPinEdgesToSuperviewEdges()
        self.contentView = contentView
        prepareUI()
    }
    
    func loadViewFromNib() -> UIView {
        let classType = type(of: self)
        let bundle = Bundle(for: classType)
        let name = String(describing: classType)
        let nib = UINib(nibName: name, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return view
    }
    
    override func endEditing(_ force: Bool) -> Bool {
        let status = super.endEditing(force)
        commentTextView.resignFirstResponder()
        return status
    }
    func beginEditing() {
        commentTextView.becomeFirstResponder()
    }
    
    func reply(to comment: CommentModel? = nil) {
        guard let repliedAuthorModel = comment?.authorModel else {
            beginEditing()
            return
        }
        viewModel.repliedAuthor = repliedAuthorModel.rawObject
        viewModel.placeHolder = "@ \(repliedAuthorModel.nickName):"
        beginEditing()
    }
    
    
    
    func reset() {
        viewModel = nil
    }
    
}

// MARK: - UITextViewDelegate
extension PostCommentBar: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.becomeFirstResponder()
        
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.resignFirstResponder()
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if commentTextView.text.isBlank {
            replyButton.isEnabled = false
        } else {
            replyButton.isEnabled = true
        }
        updateCommentTextViewLayout()
    }
}

fileprivate typealias Utilities = PostCommentBar
fileprivate extension Utilities {
    func updateUI() {
        if instanceViewMdoel.commentBody?.isBlank == false {
            commentTextView.text = instanceViewMdoel.commentBody
            replyButton.isEnabled = true
            placeHolderLabel.isHidden = true
        } else {
            commentTextView.text = ""
            placeHolderLabel.text = instanceViewMdoel.placeHolder
            placeHolderLabel.isHidden = false
            replyButton.isEnabled = false
        }
        updateCommentTextViewLayout()
    }
    
    func updateCommentTextViewLayout() {
        placeHolderLabel.isHidden = !commentTextView.text.isBlank
        let refSize = CGSize(width: commentTextView.frame.width, height: CommentTextViewMaxHeight)
        let sizeShouldFit = commentTextView.sizeThatFits(refSize)
        if sizeShouldFit.height < CommentTextViewMaxHeight {
            commentTextView.isScrollEnabled = false
            commentTextViewHeight.constant = sizeShouldFit.height
        } else {
            commentTextView.isScrollEnabled = true
            commentTextViewHeight.constant = CommentTextViewMaxHeight
        }
        // inhere: must use setNeedsLayout, instead of layoutIfNeeded
        setNeedsLayout()
    }

    func prepareUI() {
        placeHolderLabel.textColor = UIColor.lightGray
        placeHolderLabel.textAlignment = .natural
        placeHolderLabel.numberOfLines = 1
        placeHolderLabel.backgroundColor = UIColor.clear
        placeHolderLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.backgroundColor = UIColor.white
        commentTextView.delegate = self
        commentTextView.textColor = .black
        commentTextView.isScrollEnabled = false
        commentTextView.keyboardType = .twitter
        commentTextView.returnKeyType = .next
        commentTextView.tintColor = mainColor
        
        replyButton.setTitle("Send", for: .normal)
        replyButton.setTitleColor(.black, for: .normal)
        replyButton.backgroundColor = mainColor
        replyButton.layer.cornerRadius = 4
        replyButton.layer.masksToBounds = true
        replyButton.addTarget(self, action: #selector(self.didTapReply(_:)), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: Notification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: Notification.Name.UIKeyboardWillHide, object: nil)
        updateUI()
    }
    
    @objc
    func didTapReply(_ sender: UIButton) {
        if commentTextView.text.isBlank == false {
            delegate?.didTapReply(model: viewModel)
            commentTextView.resignFirstResponder()
            return
        }
        assertionFailure("PostCommentBar: should not be touched")
    }
    
    @objc
    func keyboardWillShow(_ notification: Notification) {
        guard let userInfo = notification.userInfo else {
            return
        }
        guard let keyboardEndRect = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect else {
            return
        }
        guard let duration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as? Double else {
            return
        }
        guard let curve = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? Int else {
            return
        }
        let deltaY = keyboardEndRect.size.height
        let animations: (()->()) = {
            self.transform = CGAffineTransform(translationX: 0, y: -deltaY)
            self.layoutIfNeeded()
        }
        guard let anmiationCurve = UIViewAnimationCurve(rawValue: curve),
            duration > 0  else {
            animations()
            return
        }
        UIView.animate(withDuration: duration) { 
            UIView.setAnimationBeginsFromCurrentState(true)
            UIView.setAnimationCurve(anmiationCurve)
            animations()
        }
    }
    
    @objc
    func keyboardWillHide(_ notification: Notification) {
        guard let userInfo = notification.userInfo else {
            return
        }
        guard let duration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as? Double else {
            return
        }
        guard let curve = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? Int else {
            return
        }
        let animations: (()->()) = {
            self.transform = CGAffineTransform.identity
            self.layoutIfNeeded()
        }
        guard let anmiationCurve = UIViewAnimationCurve(rawValue: curve),
            duration > 0  else {
                animations()
                return
        }
        UIView.animate(withDuration: duration) {
            UIView.setAnimationBeginsFromCurrentState(true)
            UIView.setAnimationCurve(anmiationCurve)
            animations()
        }
    }
}
