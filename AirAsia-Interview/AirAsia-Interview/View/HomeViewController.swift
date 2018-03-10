//
//  HomeViewController.swift
//  AirAsia-Interview
//
//  Created by Manoj Gundluru on 10/03/18.
//  Copyright © 2018 Manoj Gundluru. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = nil
        CIMenu.shared.configure {
            if let navController = self.storyboard?.instantiateViewController(withIdentifier: "MenuNavigationController") {
                self.navigationController?.present(navController, animated: true, completion: nil)
            }
        }
    }
    
    
}
