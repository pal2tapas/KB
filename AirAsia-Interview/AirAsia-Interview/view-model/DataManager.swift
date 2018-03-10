//
//  DataManager.swift
//  AirAsia-Interview
//
//  Created by Manoj Gundluru on 10/03/18.
//  Copyright © 2018 Manoj Gundluru. All rights reserved.
//

import Foundation
import UIKit

class DataManager: NSObject {
    
    static let shared = DataManager()
    fileprivate var loggedInUser: CIUser?
    
    var currentUser: CIUser? {
        return loggedInUser
    }
    
    func saveLoggedInUser(_ user: CIUser) {
        loggedInUser = user
    }
}
