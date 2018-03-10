//
//  Utils.swift
//  AirAsia-Interview
//
//  Created by Manoj Gundluru on 10/03/18.
//  Copyright © 2018 Manoj Gundluru. All rights reserved.
//

import Foundation
import UIKit

extension DispatchQueue {
    static func executeOnMain(_ closure: @escaping () -> Void) {
        if Thread.isMainThread {
            closure()
        } else {
            DispatchQueue.main.async {
                closure()
            }
        }
    }
}

extension UIAlertController {
    static func show(message: String, completion: (() -> Void)? = nil) {
        DispatchQueue.executeOnMain {
            let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
                if let completion = completion {
                    completion()
                }
            }))
            guard let navigationController = UIApplication.shared.delegate?.window??.rootViewController as? UINavigationController else {
                return
            }
            navigationController.present(alert, animated: true, completion: nil)
        }
    }
}

extension JSONSerialization {
    static func jsonContainsOf(_ fileName: String)  -> [String: AnyObject]? {
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let data = try NSData(contentsOfFile: path, options: .mappedIfSafe) as Data
                if let result = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: AnyObject] {
                    return result
                }
            } catch {
                print("Error")
            }
        }
        return nil
    }
}
