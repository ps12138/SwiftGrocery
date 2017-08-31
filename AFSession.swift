//
//  AlamofireSessionManager.swift
//  DemoV1
//
//  Created by PSL on 5/6/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Alamofire
import Foundation

class AFSession {
    private init() { }
    static let shared = AFSession()

    lazy var session: Alamofire.SessionManager! = {
        let sessionManager = Alamofire.SessionManager(configuration: .default)
        return sessionManager
    }()
}
