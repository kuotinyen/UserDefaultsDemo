//
//  ViewController.swift
//  UserDefaultDemo
//
//  Created by TING YEN KUO on 2018/11/12.
//  Copyright © 2018 William Kuo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUserWithType()
        
        let user = getUserWithType()
        print(user)
    }
    
    func getUserWithType() -> User {
        return UserDefaults.standard.user ?? User(deviceId: "", name: "")
    }
    
    func setUserWithType() {
        guard let deviceId = UIDevice.current.identifierForVendor?.uuidString else { return }
        let user = User(deviceId: deviceId, name: "William")
        UserDefaults.standard.user = user
    }


}

