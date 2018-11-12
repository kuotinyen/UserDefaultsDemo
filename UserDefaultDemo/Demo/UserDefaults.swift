//
//  UserDefaults.swift
//  UserDefaultDemo
//
//  Created by TING YEN KUO on 2018/11/12.
//  Copyright © 2018 William Kuo. All rights reserved.
//

import Foundation

// Has Type UserDefaults
struct User: Codable {
    var deviceId: String
    var name: String
}

// Ref: https://archie.tw/2018/08/15/userdefaults-with-structure/
extension UserDefaults {
    var user: User? {
        get {
            guard let data = data(forKey: #function) else { return nil }
            return try? PropertyListDecoder().decode(User.self, from: data)
        }
        
        set {
            if let user = newValue {
                set(try? PropertyListEncoder().encode(user), forKey: #function)
            } else {
                set(nil, forKey: #function)
            }
        }
    }
}

// No Type UserDefaults
var DB: UserDefaults {
    get {
        return UserDefaults.standard
    }
}

extension UserDefaults {
    subscript(key: String) -> Any? {
        get {
            return object(forKey: key)
        }
        
        set {
            set(newValue, forKey: key)
        }
    }
    
    subscript(key: keys) -> Any? {
        get {
            return object(forKey: key.rawValue)
        }
        
        set {
            set(newValue, forKey: key.rawValue)
        }
    }
}

extension UserDefaults {
    enum keys: String {
        case fcmToken
    }
    
    static func set(_ value: Any, forKey key: keys) {
        let key = key.rawValue
        DB.set(value, forKey: key)
    }
    
    static func object(forKey key: keys) -> Any? {
        let key = key.rawValue
        return DB.object(forKey: key)
    }
}
