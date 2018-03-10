//
//  LoginViewController.swift
//  AirAsia-Interview
//
//  Created by Manoj Gundluru on 10/03/18.
//  Copyright © 2018 Manoj Gundluru. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    @IBAction func singin() {
        if LoginManager.shared.authenticate(email: tfEmail.text!, password: tfPassword.text!) {
            print("success")
        }
    }
}
