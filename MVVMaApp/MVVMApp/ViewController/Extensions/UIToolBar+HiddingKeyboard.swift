//
//  UIToolBar+HiddingKeyboard.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/16/22.
//

import Foundation
import UIKit

extension UIToolbar {
    func hideKeyboardToolbar() -> UIToolbar {
        let toolobar = UIToolbar()
        toolobar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(UIViewController.dismissKeyboard))
        
        toolobar.setItems([doneButton], animated: false)
        
        return toolobar
    }
}
