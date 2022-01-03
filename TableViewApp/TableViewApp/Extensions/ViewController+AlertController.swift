//
//  ViewController+AlertController.swift
//  TableViewApp
//
//  Created by Darya on 12/22/21.
//

import Foundation
import UIKit

extension ViewController {
    
    private enum AlertParameters {
        static let title = "Add new person"
        static let message = "Type new person's name"
        static let cancelTitle = "Cancel"
        static let addTitle = "Add"
        static let placeholder = "Name"
    }
    
    @objc func showAlert(_ sender: AnyObject) {
        
        let alert = UIAlertController(
            title: AlertParameters.title,
            message: AlertParameters.message,
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: AlertParameters.cancelTitle, style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: AlertParameters.addTitle, style: .default, handler: { [weak self] _ in
            guard let fields = alert.textFields else { return }
            let newNameField = fields[0]
            
            guard let newName = newNameField.text, !newName.isEmpty else { return }
            
            self?.updateNamesArray(newItem: newName)
            self?.reloadTable()
        }))
        
        alert.actions[1].isEnabled = false
        alert.addTextField { field in
            field.placeholder = AlertParameters.placeholder
            field.returnKeyType = .continue
            guard let newNameField = alert.textFields?[0] else { return }
            
            NotificationCenter.default.addObserver(forName: UITextField.textDidChangeNotification, object: newNameField, queue: OperationQueue.main, using: {_ in
                                                        
                   let textCount = newNameField.text?.trimmingCharacters(in: .whitespacesAndNewlines).count ?? 0
                   let textIsNotEmpty = textCount > 0
                                                        
                   alert.actions[1].isEnabled = textIsNotEmpty
            })
        }
        present(alert, animated: true)
    }
}

