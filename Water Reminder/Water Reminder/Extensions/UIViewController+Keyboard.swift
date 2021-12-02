//
//  UIViewController+Keyboard.swift
//  Water Reminder
//
//  Created by Darya on 11/23/21.
//

import Foundation
import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func hideKeyboardToolbar() -> UIToolbar {
        let toolobar = UIToolbar()
        toolobar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.dismissKeyboard))
        
        toolobar.setItems([doneButton], animated: false)
        
        return toolobar
    }
}
