//
//  MenuViewController.swift
//  AirAsia-Interview
//
//  Created by Manoj Gundluru on 10/03/18.
//  Copyright © 2018 Manoj Gundluru. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var tblList: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
