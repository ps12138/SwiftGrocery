//
//  AFClient.swift
//  demo_v1
//
//  Created by PSL on 5/21/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Alamofire
import Foundation

fileprivate let APIHost = "https://www.api.com"

/// AFClient singleton
class AFClient {
    let sessionManager: Alamofire.SessionManager! = AFSession.shared.session
}

// MARK: - APISendable
extension AFClient: APISendable {

    var host: String {
        return APIHost
    }

    func send<T: APIRequestable>(_ request: T, completion: @escaping (T.Response?, APIRequestStatus) -> Void) {

        guard let urlRequest = buildRequest(with: request) else {
            assertionFailure("AFClient: fail to build URLRequest")
            return
        }
        sessionManager.request(urlRequest).responseJSON(completionHandler: { (response) in
            let code = response.response?.statusCode
            if response.result.isSuccess {
                completion(T.Response.parse(input: response.result.value), .success(code))
            } else {
                completion(nil, .failure(response.result.error))
            }
        })
    }
}

/// Tools of AFClient
fileprivate typealias Tools = AFClient
fileprivate extension Tools {
    func buildRequest(with request: APIBaseRequestable) -> URLRequest? {

        let urlStr = host.appending(request.path).appending(request.queryStr ?? "")
        guard let url = URL(string: urlStr) else {
            return nil
        }
        var urlRequest = URLRequest(url: url)

        urlRequest.httpMethod = request.method.rawValue
        if let cachePolicy = request.cachePolicy {
            urlRequest.cachePolicy = cachePolicy
        }

        if let header = request.header {
            for (key, value) in header {
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }

        if let body = request.body {
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }
        return urlRequest
    }
}
