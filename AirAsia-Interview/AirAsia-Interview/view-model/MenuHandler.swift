//
//  MenuHandler.swift
//  AirAsia-Interview
//
//  Created by Manoj Gundluru on 10/03/18.
//  Copyright © 2018 Manoj Gundluru. All rights reserved.
//

import Foundation
import UIKit

class CIMenu: NSObject {
    static let shared = CIMenu()
    fileprivate var tapAction: (() -> Void)?
    var button: UIButton?
    
    func configure(didTap: @escaping () -> Void) {
        tapAction = didTap
        let menuButton = UIButton()
        menuButton.setImage(#imageLiteral(resourceName: "menu-icon"), for: .normal)
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        menuButton.addTarget(self, action: #selector(presentMenu), for: .touchUpInside)
        button = menuButton
        let window = UIApplication.shared.delegate!.window!!
        window.addSubview(menuButton)
        
        let views: [String: Any] = ["menu": menuButton]
        let menuMetrics = ["size": 40]
        window.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[menu(size)]-30-|", options: .init(rawValue: 0), metrics: menuMetrics, views: views))
        window.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[menu(size)]-30-|", options: .init(rawValue: 0), metrics: menuMetrics, views: views))
        
    }
    
    @objc fileprivate func presentMenu() {
        if let tapAction = tapAction {
            tapAction()
        }
    }
}
