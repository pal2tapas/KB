//
//  CIUser.swift
//  AirAsia-Interview
//
//  Created by Manoj Gundluru on 10/03/18.
//  Copyright © 2018 Manoj Gundluru. All rights reserved.
//

import Foundation


class CIUser: NSObject {
    var name: String!
    var email: String!
    var phoneNumber: String!
    
    convenience init(name: String, email: String, phoneNumber: String) {
        self.init()
        self.name = name
        self.email = email
        self.phoneNumber = phoneNumber
    }
}
