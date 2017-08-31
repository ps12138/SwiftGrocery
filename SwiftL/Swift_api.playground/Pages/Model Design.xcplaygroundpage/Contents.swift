//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)



/// Model for PaymentEvent
struct PaymentEvent {
    
    // MARK: - Properties
    let id: Int
    let title: String
    let detail: Dictionary<User, Double>
    let totalCost: Double
    let paidBy: User?
    
    // MARK: - Init
    init?(dict: Dictionary<String, Any>?) {
        guard let dict = dict,
            let id = dict[PaymentEventKey.id] as? Int,
            let title = dict[PaymentEventKey.title] as? String,
            let detail = dict[PaymentEventKey.detail] as? Dictionary<User, Double>,
            let totalCost = dict[PaymentEventKey.totalCost] as? Double
            else {
                return nil
        }
        self.id = id
        self.title = title
        self.detail = detail
        
        self.totalCost = totalCost
        
        self.paidBy = User(dict: dict[PaymentEventKey.paidBy] as? Dictionary<String, Any>)
    }
}
    

// MARK: - PaymentEvent's Hashable
extension PaymentEvent: Hashable {
    var hashValue: Int {
        return self.id
    }
    static func==(lhs: PaymentEvent, rhs: PaymentEvent) -> Bool {
        return lhs.id == lhs.id
    }
}
    
    


/// Model for User
struct User {
    // MARK: - Properties
    let id: Int
    let username: String
    let email: String
    let friends: Array<User>?
    let paymentEvents: Array<PaymentEvent>?
    
    // MARK: - init
    init?(dict: Dictionary<String, Any>?) {
        guard let dict = dict,
            let id = dict[UserKey.id] as? Int,
            let username = dict[UserKey.email] as? String,
            let email = dict[UserKey.email] as? String
            else {
                return nil
        }
        self.id = id
        self.username = username
        self.email = email
        
        if let userDictArray = dict[UserKey.friends] as? Array<Any> {
            var friends = Array<User>()
            for userDict in userDictArray {
                if let validUserDict = userDict as? Dictionary<String, Any>,
                    let validUser = User(dict: validUserDict) {
                    friends.append(validUser)
                }
            }
            if friends.isEmpty == false {
                self.friends = friends
            } else {
                self.friends = nil
            }
        } else {
            self.friends = nil
        }

        if let eventDictArray = dict[UserKey.paymentEvents] as? Array<Any> {
            var paymentEvents = Array<PaymentEvent>()
            for eventDict in eventDictArray {
                if let validEventDict = eventDict as? Dictionary<String, Any>,
                    let validEvent = PaymentEvent(dict: validEventDict) {
                    paymentEvents.append(validEvent)
                }
            }
            if paymentEvents.isEmpty == false {
                self.paymentEvents = paymentEvents
            } else {
                self.paymentEvents = nil
            }
        } else {
            self.paymentEvents = nil
        }
        
    }
}


// MARK: - User's Hashable
extension User: Hashable {
    var hashValue: Int {
        return self.id
    }
    
    static func==(lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }
}



/// keys for init PaymentEvent
struct PaymentEventKey {
    static let id = "id"
    static let title = "title"
    static let detail = "detail"
    static let paidBy = "paidBy"
    static let totalCost = "totalCost"
}



/// keys for init User
struct UserKey {
    static let id = "id"
    static let username = "username"
    static let email = "emial"
    static let friends = "friends"
    static let paymentEvents = "paymentEvents"
}
