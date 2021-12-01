//
//  DrawingViewController.swift
//  Drawings
//
//  Created by Darya on 11/18/21.
//

import UIKit

class DrawingViewController: UIViewController {

    var drawing = Story()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        addAnimationPath()
    }
    
    func addAnimationPath() {
        let path = drawing.draw()
//        UIColor.white.setFill()
//        path.fill()
        
        UIColor.purple.setStroke()
        path.lineWidth = 0.1
        path.stroke()
        
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        
//        layer.strokeEnd = 0
//                layer.lineWidth = 2
//                layer.borderColor = UIColor.red.cgColor
//                layer.shadowColor = UIColor.red.cgColor
//                layer.shadowRadius = 2
//                layer.shadowOffset = CGSize(width: 1, height: 1)
//                layer.shadowOpacity = 0.8
//                layer.strokeColor = UIColor.blue.cgColor
//                layer.fillColor = UIColor.white.cgColor
        
        self.view.layer.addSublayer(layer)
              
              let animation = CABasicAnimation(keyPath: "strokeEnd")
              animation.toValue = 1
              animation.duration = 5
              animation.autoreverses = true
              animation.repeatCount = .infinity
              
              layer.add(animation, forKey: "line")
    }
}
