//
//  AnimationFactory.swift
//  TableViewApp
//
//  Created by Darya on 12/21/21.
//

import Foundation
import UIKit

enum AnimationFactory {

    static func makeFadeAnimation(duration: TimeInterval, delayFactor: Double) -> Animation {
        
        return { cell, indexPath, _ in
            cell.alpha = 0

            UIView.animate (
                withDuration: duration,
                delay: delayFactor * Double(indexPath.row),
                animations: {
                    cell.alpha = 1
            })
        }
    }
}
