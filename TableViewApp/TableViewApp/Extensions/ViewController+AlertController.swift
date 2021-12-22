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
        
        alert.addAction(UIAlertAction(title: AlertParameters.cancelTitle, style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: AlertParameters.addTitle, style: .default, handler: { _ in
            
            guard let fields = alert.textFields else { return }
            let newNameField = fields[0]
            
            guard let newName = newNameField.text, !newName.isEmpty else { return }
            
            self.namesArray.append(newName)
            self.familyTableView.reloadData()
        }))
        
        alert.addTextField { field in
            field.placeholder = AlertParameters.placeholder
            field.returnKeyType = .continue
        }

        present(alert, animated: true)
    }
}

