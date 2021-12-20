//
//  UIView+ParentViewController.swift
//  Drawing
//
//  Created by Дарья Воробей on 12/17/21.
//

import Foundation
import UIKit

extension UIView {
    var parentViewController: UIViewController? {
        
        var parentResponder: UIResponder? = self.next
        while parentResponder != nil {
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
            parentResponder = parentResponder?.next
        }
        return nil
    }
}
