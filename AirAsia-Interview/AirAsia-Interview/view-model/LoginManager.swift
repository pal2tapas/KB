//
//  LoginManager.swift
//  AirAsia-Interview
//
//  Created by Manoj Gundluru on 10/03/18.
//  Copyright © 2018 Manoj Gundluru. All rights reserved.
//

import Foundation
import UIKit

class LoginManager: NSObject {
    static let shared = LoginManager()
    
    fileprivate func validate(email: String, password: String) -> Bool {
        if email.isEmpty {
            UIAlertController.show(message: "Email is required")
            return false
        } else if password.isEmpty {
            UIAlertController.show(message: "Password is required")
            return false
        } else if !isValidEmail(email) {
            UIAlertController.show(message: "Enter a valid email")
            return false
        }
        return true
    }
    
    fileprivate func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    func authenticate(email: String, password: String) -> Bool {
        if !validate(email: email, password: password) {
            return false
        }
        
        guard let json = JSONSerialization.jsonContainsOf("LoginCredentials"), let data = json["data"] as? [[String: AnyObject]] else { return false }
        
        for eachData in data {
            if let emailData = eachData["email"] as? String, emailData == email, let passwordData = eachData["password"] as? String, passwordData == password {
                let user = CIUser(name: eachData["name"] as! String, email: emailData, phoneNumber: eachData["phoneNumber"] as! String)
                DataManager.shared.saveLoggedInUser(user)
                return true
            }
        }
        UIAlertController.show(message: "Invaild email/password")
        return false
    }
    
    
}

