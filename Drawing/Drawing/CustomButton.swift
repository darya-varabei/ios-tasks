//
//  CustomButton.swift
//  Drawing
//
//  Created by Darya on 12/8/21.
//

import UIKit

class CustomButton: UIButton {

    override func draw(_ rect: CGRect) {
        layer.cornerRadius = 25
        backgroundColor = UIColor.white
        self.layer.shadowColor = UIColor.black.cgColor
       // setImage(UIImage(systemName: "scribble.variable"), for: .normal)
        self.tintColor = UIColor.red
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 0.2
    }
}
