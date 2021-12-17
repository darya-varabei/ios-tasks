//
//  FadeTransition.swift
//  NavigationAnimation
//
//  Created by Дарья Воробей on 12/17/21.
//

import Foundation
import UIKit

class FadeTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    let alphaComponent: CGFloat
    
    init(alphaComponent: CGFloat) {
        self.alphaComponent = alphaComponent
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard
            let toViewController = transitionContext.viewController(forKey: .to)
        else {
            return
        }
        transitionContext.containerView.addSubview(toViewController.view)
        toViewController.view.alpha = 0
        
        let duration = self.transitionDuration(using: transitionContext)
        UIView.animate(withDuration: duration, animations: {
            toViewController.view.alpha = self.alphaComponent
        }, completion: { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
}


