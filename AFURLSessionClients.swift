//
//  Clients.swift
//  DemoV1
//
//  Created by PSL on 5/5/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Foundation

fileprivate let APIHost = "https://www.api.com"

struct URLSessionClient: APISendable {
    var host: String {
        return APIHost
    }

    func send<T : APIRequestable>(_ request: T, completion: @escaping (T.Response?, APIRequestStatus) -> Void) {

        guard let urlRequest = buildRequest(with: request) else {
            assertionFailure("URLSessionClient: fail to build URLRequest")
            return
        }

        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in

            let code = (response as? HTTPURLResponse)?.statusCode
            if let error = error {
                completion(nil, .failure(error))
            } else {
                completion(T.Response.parse(input: data), .success(code))
            }
        }
        task.resume()
    }
}

/// Tools of AFClient
fileprivate typealias Tools = URLSessionClient
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
