//
//  ViewController+ActivityIndicator.swift
//  ImageCollection
//
//  Created by Дарья Воробей on 21.02.22.
//

import Foundation
import UIKit

extension ViewController {
    
    private enum ActivityIndicatorParameters {
        static let frameSize = 100
        static let borderWidth: CGFloat = 2
        static let cornerRadius: CGFloat = 6
        static let tag = 1
        static let backgroundColor = UIColor.clear
        static let borderColor = UIColor.cyan.cgColor
    }
    
    func showActivityIndicator() {
        let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: ActivityIndicatorParameters.frameSize, height: ActivityIndicatorParameters.frameSize))
        activityIndicator.backgroundColor = ActivityIndicatorParameters.backgroundColor
        activityIndicator.layer.borderWidth = ActivityIndicatorParameters.borderWidth
        activityIndicator.layer.borderColor = ActivityIndicatorParameters.borderColor
        activityIndicator.layer.cornerRadius = ActivityIndicatorParameters.cornerRadius
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .large
        activityIndicator.startAnimating()
        activityIndicator.tag = ActivityIndicatorParameters.tag
        view.addSubview(activityIndicator)
    }

    func hideActivityIndicator() {
        let activityIndicator = view.viewWithTag(ActivityIndicatorParameters.tag) as? UIActivityIndicatorView
        activityIndicator?.stopAnimating()
        activityIndicator?.removeFromSuperview()
    }
}
