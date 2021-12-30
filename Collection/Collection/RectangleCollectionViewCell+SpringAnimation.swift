//
//  RectangleCollectionViewCell+SpringAnimation.swift
//  Collection
//
//  Created by Дарья Воробей on 12/25/21.
//

import Foundation
import UIKit

extension RectangleCollectionViewCell {
    
    private enum AnimationParameters {
        static let duration: TimeInterval = 0.15
        static let delay: TimeInterval = 0
        static let damping: CGFloat = 0.2
        static let velocity: CGFloat = 0.1
        static let transformationScale: CGFloat = 0.95
        static let fullScale: CGFloat = 1.0
    }
    
    func animateCellTap(sender: RectangleCollectionViewCell?) {
        UIView.animate(withDuration: AnimationParameters.duration,
                       delay: AnimationParameters.delay,
                       usingSpringWithDamping: AnimationParameters.damping,
                       initialSpringVelocity: AnimationParameters.velocity,
                       options: .curveEaseIn, animations: {
            sender?.transform = CGAffineTransform(scaleX: AnimationParameters.transformationScale, y: AnimationParameters.transformationScale)
        }) { (_) in
            
            UIView.animate(withDuration: AnimationParameters.duration,
                           delay: AnimationParameters.delay,
                           usingSpringWithDamping: AnimationParameters.damping,
                           initialSpringVelocity: AnimationParameters.velocity,
                           options: .curveEaseIn, animations: {
                sender?.transform = CGAffineTransform(scaleX: AnimationParameters.fullScale, y: AnimationParameters.fullScale)
            })
        }
    }
}
