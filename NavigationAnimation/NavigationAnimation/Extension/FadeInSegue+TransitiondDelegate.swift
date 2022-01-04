//
//  FadeInSegue+TransitiondDelegate.swift
//  NavigationAnimation
//
//  Created by Дарья Воробей on 12/17/21.
//

import Foundation
import UIKit

extension FadeInSegue: UIViewControllerTransitioningDelegate {
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return FadeTransition(alphaComponent: 1)
    }
}
