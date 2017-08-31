//: [Previous](@previous)



// Time comsuming async task in playground
// http://stackoverflow.com/questions/28352674/http-request-in-swift-not-working

/// Example

import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = false
URLCache.shared = URLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)


guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos/?albumId=1")
    else {
        fatalError("Error: cannot create URL")
}

var request = URLRequest(url: url)
request.httpMethod = "GET"
let session = URLSession.shared
let task = session.dataTask(with: request) {
    (data, response, error) -> Void in
    print("\ndataTask: ")
    //print(response ?? "No response")
    print(data ?? "No Data")
    print(error ?? "No error")
}
task.resume()


/// How to use

// default session
let session0 = URLSession.shared
let config = URLSessionConfiguration.default
let session1 = URLSession(configuration: config)


// custom session

/// default session without persistent storage for caches, cookies, or credentials.
let config2 = URLSessionConfiguration.ephemeral
let session2 = URLSession(configuration: config2)

/// session configuration object that allows HTTP and HTTPS uploads or downloads to be performed in the background.
/// A session is controlled of the transfers over to the system, which handles the transfers in a separate process. In iOS, this configuration makes it possible for transfers to continue even when the app itself is suspended or terminated.
let config3 = URLSessionConfiguration.background(withIdentifier: "myId")
let session3 = URLSession(configuration: config3)

/// session with the specified session configuration, delegate, and serial operation queue.
let operationQueue = OperationQueue()
operationQueue.maxConcurrentOperationCount = 1
operationQueue.name = "session4queue"
let session4 = URLSession(configuration: config, delegate: nil, delegateQueue: operationQueue)



// data task
let dataTask1 = session0.dataTask(with: url,
    completionHandler: {
        (data, response, error) -> Void in
        // do something
    }
)
dataTask1.resume()


let dataTask2 = session0.dataTask(with: request,
    completionHandler: {
        (data, response, error) -> Void in
        // do something
    }
)
dataTask2.resume()

// download task
let downloadTask1 = session0.downloadTask(with: url, completionHandler: {
        (location, response, error) -> Void in
        print("downloaded location: \(error?.localizedDescription)")
    }
)
downloadTask1.resume()

let downloadTask2 = session0.downloadTask(with: request,
    completionHandler: {
        (location, response, error) -> Void in
        print("downloaded location: \(error?.localizedDescription)")
    }
)
downloadTask2.resume()

// Cancel task
downloadTask1.cancel()

// Cancel task with data
var resumeData: Data?
downloadTask2.cancel(byProducingResumeData: {
    (data) -> Void in
    print(data ?? "No resume data")
    resumeData = data
})

// resume canceled or failed download
if let validResumeData = resumeData {
    let resumeTask2 = session0.downloadTask(
        withResumeData: validResumeData,
        completionHandler: {
            (data, response, error) -> Void in
        }
    )
    resumeTask2.resume()
}


// upload task
/// upload Data
let uploadTask1 = session0.uploadTask(with: request, from: Data(), completionHandler: {
        (data, response, error) -> Void in
        //print("upload - \(response)")
    }
)
uploadTask1.resume()

/// upload file
if let filePath = Bundle.main.url(forResource: "subway-lister", withExtension: "json") {
    print("upload filePath: \(filePath)")
    let uploadTask2 = session0.uploadTask(with: request, fromFile: filePath, completionHandler: {
        (data, repsonse, error) -> Void in
        // do some thing
        }
    )
    // uploadTask2.resume()
}







// default request
let request1 = URLRequest(url: url)
// custom request
var request2 = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 60)

request2.httpBody = Data()
request2.httpMethod = "POST"

request2.allowsCellularAccess = true

// setting header
request2.setValue("value?", forHTTPHeaderField: "key")
request2.addValue("value", forHTTPHeaderField: "key")
let res = request2.value(forHTTPHeaderField: "key")
let header = request2.allHTTPHeaderFields




