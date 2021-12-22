//
//  UITableView+MessageOnEmpty.swift
//  TableViewApp
//
//  Created by Darya on 12/22/21.
//

import Foundation
import UIKit

extension UITableView {

    func setEmptyMessage(emptyTableMessage: String) {
        
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = emptyTableMessage
        messageLabel.textColor = .white
        messageLabel.textAlignment = .center
        messageLabel.sizeToFit()

        self.backgroundView = messageLabel
        self.separatorStyle = .none
    }

    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}
