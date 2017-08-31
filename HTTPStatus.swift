//
//  HTTPStatus.swift
//  demo_v1
//
//  Created by PSL on 5/22/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Foundation

/// HTTP status codes 
/// http://en.wikipedia.org/wiki/List_of_HTTP_status_codes
/// https://tools.ietf.org/html/rfc2616#section-10

public enum HTTPStatusCode: Int {
    // 100 Informational
    case `continue` = 100
    case switchingProtocols
    case processing

    // 200 Success
    case isOk = 200
    case created
    case accepted
    case nonAuthoritativeInformation
    case noContent
    case resetContent
    case partialContent
    case multiStatus
    case alreadyReported

    // 300 Redirection
    case multipleChoices = 300
    case movedPermanently
    case found
    case seeOther
    case notModified
    case useProxy
    case switchProxy
    case temporaryRedirect
    case permanentRedirect

    // 400 Client Error
    case badRequest = 400
    case unauthorized
    case paymentRequired
    case forbidden
    case notFound
    case methodNotAllowed
    case notAcceptable
    case proxyAuthenticationRequired
    case requestTimeout
    case conflict
    case gone
    case lengthRequired
    case preconditionFailed
    case payloadTooLarge
    case uriTooLong
    case unsupportedMediaType
    case rangeNotSatisfiable
    case expectationFailed
    case misdirectedRequest = 421
    case unprocessableEntity
    case locked
    case failedDependency
    case upgradeRequired = 426
    case preconditionRequired = 428
    case tooManyRequests
    case requestHeaderFieldsTooLarge = 431
    case unavailableForLegalReasons = 451

    // 500 Server Error
    case internalServerError = 500
    case notImplemented
    case badGateway
    case serviceUnavailable
    case gatewayTimeout
    case httpVersionNotSupported
    case variantAlsoNegotiates
    case insufficientStorage
    case loopDetected
    case notExtended = 510
    case networkAuthenticationRequired
}

public extension HTTPStatusCode {
    /// Informational - Request received, continuing process.
    public var isInformational: Bool {
        return isIn(range: 100...199)
    }
    /// Success - The action was successfully received, understood, and accepted.
    public var isSuccess: Bool {
        return isIn(range: 200...299)
    }
    /// Redirection - Further action must be taken in order to complete the request.
    public var isRedirection: Bool {
        return isIn(range: 300...399)
    }
    /// Client Error - The request contains bad syntax or cannot be fulfilled.
    public var isClientError: Bool {
        return isIn(range: 400...499)
    }
    /// Server Error - The server failed to fulfill an apparently valid request.
    public var isServerError: Bool {
        return isIn(range: 500...599)
    }

    /// - returns: `true` if the status code is in the provided range, false otherwise.
    private func isIn(range: ClosedRange<HTTPStatusCode.RawValue>) -> Bool {
        return range.contains(rawValue)
    }
}

extension HTTPStatusCode {
    public var localizationDesc: String {
        return HTTPURLResponse.localizedString(forStatusCode: rawValue)
    }
}

extension HTTPStatusCode: CustomStringConvertible {
    public var description: String {
        return "Code:\(rawValue) - \(localizationDesc)"
    }
}

public extension HTTPStatusCode {
    init?(response: HTTPURLResponse?) {
        guard let statusCode = response?.statusCode else {
            return nil
        }
        self.init(statusCode)
    }

    init?(_ value: Int) {
        guard let value = HTTPStatusCode(rawValue: value) else {
            return nil
        }
        self = value
    }
}
