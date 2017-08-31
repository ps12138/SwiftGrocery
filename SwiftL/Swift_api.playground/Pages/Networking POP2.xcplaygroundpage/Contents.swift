
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

extension User: Decodable {
    static func parse(data: Data) -> User? {
        return User(data: data)
    }
}

enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
}

protocol Request {
    // Request info
    var path: String { get }
    var method: HTTPMethod { get }
    var parameter: [String: Any] { get }
    
    // Parse info
    associatedtype Response: Decodable
}

protocol Decodable {
    static func parse(data: Data) -> Self?
}


protocol Client {
    func send<T: Request>(_ r: T, handler: @escaping (T.Response?) -> Void)
    var host: String { get }
}

struct URLSessionClient: Client {
    let host = "https://api.onevcat.com"
    func send<T: Request>(_ r: T, handler: @escaping (T.Response?) -> Void) {
        let url = URL(string: host.appending(r.path))!
        var request = URLRequest(url: url)
        request.httpMethod = r.method.rawValue
        
        let task = URLSession.shared.dataTask(with: request) {
            data, res, error in
            if let data = data, let res = T.Response.parse(data: data) {
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
    var path: String {
        return "/users"
    }
    let method: HTTPMethod = .GET
    let parameter: [String: Any] = [:]
}




let userRequest = UserRequest(name: "onevcat")

URLSessionClient().send(userRequest) { (user) -> Void in
    if let user = user {
        print(user)
    } else {
        print("No response")
    }
}


// TEST based on local file
struct LocalFileClient: Client {
    let host = ""
    
    func send<T : Request>(_ r: T, handler: @escaping (T.Response?) -> Void) {
        
        switch r.path {
        case "/users":
            guard let fileURL = Bundle.main.url(forResource: "users", withExtension: "") else {
                fatalError("Fail to find file")
            }
            guard let data = try? Data(contentsOf: fileURL) else {
                fatalError("Fail to Load file data")
            }
            handler(T.Response.parse(data: data))
        default:
            fatalError("Unknow Path")
        }
    }
}








