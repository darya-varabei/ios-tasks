//
//  RectangleCollectionViewCell+SpringAnimation.swift
//  Collection
//
//  Created by Дарья Воробей on 12/25/21.
//

import Foundation
import UIKit

extension RectangleCollectionViewCell {
    
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
