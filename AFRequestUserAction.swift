//
//  RequestPinLike.swift
//  demo_v1
//
//  Created by PSL on 5/23/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Foundation

/// RequestUserAction
/// - PUT /pins/pin_id/like
/// - DELETE /pins/pin_id/like
/// - PUT /pins/pin_id/fav
/// - DELETE /pins/pin_id/fav
/// - PUT /pins/pin_id/comments/comment_id/like
/// - DELETE /pins/pin_id/comments/comment_id/like
/// - PUT /users/user_id/follow
/// - DELETE /users/user_id/follow
/// - DELETE /user/fav_locations/lcation_id
struct RequestUserAction: APIRequestable {
    // Request info
    var path: String
    var method: APIHttpMethod
    var queryStr: String?
    var cachePolicy: URLRequest.CachePolicy?
    var body: [String: Any]?
    var header: [String: String]?

    // Parser info
    typealias Response = StatusResponseModel

    init() {
        self.path = ""
        self.method = .PUT
    }
}

// MARK: - Build specific request
extension RequestUserAction {
    // Unify type to RequestUserAction
    typealias RequstType = RequestUserAction

    static func like(pin pinId: Int) -> RequstType {
        var request = RequstType()
        request.path = APIPath.pinslike(pinId).path
        request.method = .PUT
        return request
    }

    static func unlike(pin pinId: Int) -> RequstType {
        var request = RequstType()
        request.path = APIPath.pinslike(pinId).path
        request.method = .DELETE
        return request
    }

    static func favourite(pin pinId: Int) -> RequstType {
        var request = RequstType()
        request.path = APIPath.pinsFavourite(pinId).path
        request.method = .PUT
        return request
    }

    static func nofavourite(pin pinId: Int) -> RequstType {
        var request = RequstType()
        request.path = APIPath.pinsFavourite(pinId).path
        request.method = .DELETE
        return request
    }

    static func like(comment commentId: Int, pinId: Int) -> RequstType {
        var request = RequstType()
        request.path = APIPath.pinsCommentLike(pinId, commentId).path
        request.method = .PUT
        return request
    }

    static func unlike(comment commentId: Int, pinId: Int) -> RequstType {
        var request = RequstType()
        request.path = APIPath.pinsCommentLike(pinId, commentId).path
        request.method = .DELETE
        return request
    }

    static func follow(user userId: Int) -> RequstType {
        var request = RequstType()
        request.path = APIPath.usersFollow(userId).path
        request.method = .PUT
        return request
    }

    static func unfollow(user userId: Int) -> RequstType {
        var request = RequstType()
        request.path = APIPath.usersFollow(userId).path
        request.method = .DELETE
        return request
    }

    static func remove(favouriteLocation locationId: Int) -> RequstType {
        var request = RequstType()
        request.path = APIPath.userFavouriteLocation(locationId).path
        request.method = .DELETE
        return request
    }
}
