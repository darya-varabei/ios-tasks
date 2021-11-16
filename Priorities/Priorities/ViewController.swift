//
//  ViewController.swift
//  Priorities
//
//  Created by Darya on 11/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
    }
    
    func setGradientBackground() {
        let colorTop =  UIColor(named: "headerStart")?.cgColor
        let colorBottom = UIColor(named: "headerFinish")?.cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.frame
        
        //self.view.layer.backgroundColor = gradientLayer
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
}

