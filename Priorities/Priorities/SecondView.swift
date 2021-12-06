//
//  SecondView.swift
//  Priorities
//
//  Created by Дарья Воробей on 11/24/21.
//

import UIKit

class SecondView: UIView {
    
    override init(frame: CGRect) {
      super.init(frame: frame)
      setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      setupView()
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: frame.width, height: 100)
    }
    
    private func setupView() {
      backgroundColor = .cyan
    }
}
