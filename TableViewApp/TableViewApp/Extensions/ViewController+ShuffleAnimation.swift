//
//  ViewController+ShuffleAnimation.swift
//  TableViewApp
//
//  Created by Darya on 12/21/21.
//

import Foundation
import UIKit

extension ViewController {
    
    enum AnimationParameters {
        static let springDumping: CGFloat = 0.4
        static let springVelocity: CGFloat = 0.1
        static let duration: TimeInterval = 1
        static let delayFactor = 0.05
    }
    
    func makeMoveUpWithBounce(rowHeight: CGFloat, duration: TimeInterval, delayFactor: Double) -> Animation {
        
        return { cell, indexPath, tableView in
            cell.transform = CGAffineTransform(translationX: 0, y: rowHeight)

            UIView.animate(
                withDuration: duration,
                delay: delayFactor * Double(indexPath.row),
                usingSpringWithDamping: AnimationParameters.springDumping,
                initialSpringVelocity: AnimationParameters.springVelocity,
                options: [.curveEaseInOut],
                animations: {
                    cell.transform = CGAffineTransform(translationX: 0, y: 0)
            })
        }
    }
}
