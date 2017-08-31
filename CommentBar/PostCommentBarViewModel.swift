//
//  PostCommentBarViewModel.swift
//  Slow
//
//  Created by PSL on 8/6/17.
//  Copyright © 2017 Li, Bo. All rights reserved.
//

import Foundation
import AVOSCloud


fileprivate let CommentPlaceHolder = "Reply:"

struct PostCommentBarViewModel {
    var placeHolder: String
    var commentBody: String?
    var repliedAuthor: AVUser?
    
    init(replyTo: String? = nil, commentBody: String? = nil) {
        self.placeHolder = PostCommentBarViewModel.formatPlaceHolder(replyTo: replyTo)
        self.commentBody = commentBody
    }
}

// MARK: - formatter
extension PostCommentBarViewModel {
    static func formatPlaceHolder(replyTo str: String?) -> String {
        if let str = str {
            return "Reply \(str): "
        }
        return CommentPlaceHolder
    }
}
