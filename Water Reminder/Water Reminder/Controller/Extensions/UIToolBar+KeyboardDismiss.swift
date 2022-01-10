//
//  Keyboard+UIToolBar.swift
//  Water Reminder
//
//  Created by Дарья Воробей on 12/6/21.
//

import Foundation
import UIKit

extension UIToolbar {
    func hideKeyboardToolbar() -> UIToolbar {
        let toolobar = UIToolbar()
        toolobar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(ViewController.dismissKeyboard))
        
        toolobar.setItems([doneButton], animated: false)
        
        return toolobar
    }
}
