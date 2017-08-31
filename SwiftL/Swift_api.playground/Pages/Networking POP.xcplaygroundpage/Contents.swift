
// Time comsuming async task in playground
// http://stackoverflow.com/questions/28352674/http-request-in-swift-not-working

/// Example

import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true


struct User {
    let name: String
    let message: String
    
    init?(data: Data) {
        guard let obj = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? [String: Any] else {
            return nil
        }
        
        guard let name = obj?["name"] as? String else {
            return nil
        }
        guard let message = obj?["message"] as? String else {
            return nil
        }
        self.name = name
        self.message = message
    }
}

enum HTTPMethod: String {
    case GET
    case POST
}

protocol Request {
    associatedtype Response
    var host: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameter: [String: Any] { get }
    
    func parse(data: Data) -> Response?
}

extension Request {
    func send(handler: @escaping (Response?) -> Void) {
        let url = URL(string: host.appending(path))!
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        let task = URLSession.shared.dataTask(with: request) {
            data, res, error in
            if let data = data, let res = self.parse(data: data) {
                DispatchQueue.main.async {
                    handler(res)
                }
            } else {
                DispatchQueue.main.async {
                    handler(nil)
                }
            }
        }
        task.resume()
    }
}


struct UserRequest: Request {
    typealias Response = User
    let name: String
    let host = "https://api.onevcat.com"
    var path: String {
        return "/users"
    }
    let method: HTTPMethod = .GET
    let parameter: [String: Any] = [:]
    
    func parse(data: Data) -> User? {
        return User(data: data)
    }
}




let request = UserRequest(name: "onevcat")
request.send { (user) in
    if let user = user {
        print("\(user.message) from \(user.name)")
    }
}





