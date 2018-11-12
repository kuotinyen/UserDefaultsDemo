//
//  UserDefaults.swift
//  UserDefaultDemo
//
//  Created by TING YEN KUO on 2018/11/12.
//  Copyright © 2018 William Kuo. All rights reserved.
//

import Foundation

struct User: Codable {
    var deviceId: String
    var name: String
}

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
