//
//  ViewController+AlertController.swift
//  TableViewApp
//
//  Created by Darya on 12/22/21.
//

import Foundation
import UIKit

extension ViewController {
    @objc func showAlert(_ sender: AnyObject) {
        
        let alert = UIAlertController(
            title: AlertParameters.title,
            message: AlertParameters.message,
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: AlertParameters.addTitle, style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: AlertParameters.cancelTitle, style: .default, handler: nil))
        
        alert.addTextField { field in
            field.placeholder = AlertParameters.placeholder
            field.returnKeyType = .continue
        }
        
        present(alert, animated: true)
    }
}
