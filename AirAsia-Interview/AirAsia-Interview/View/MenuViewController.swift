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
    
    fileprivate var menu = [0: "Profile", 1: "Rewards", 2: "Wallets", 3: "Referal", 4: "Offers", 5: "Only For You", 6: "Log out"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CIMenu.shared.button?.isHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        CIMenu.shared.button?.isHidden = false
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        if let dequeCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            cell = dequeCell
        } else {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        
        cell.textLabel?.text = menu[indexPath.row]
        
        return cell
    }
}
