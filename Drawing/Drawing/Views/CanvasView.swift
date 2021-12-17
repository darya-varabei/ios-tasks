//
//  CanvasView.swift
//  Drawing
//
//  Created by Дарья Воробей on 12/6/21.
//

import Foundation
import UIKit

class CanvasView: UIView {
    
    let brush = Brush()
    let drawLayer = UIView()
    let mainImageView = UIImageView()
    var lastPoint: CGPoint = .zero
    var currentPath = UIBezierPath()
    var currentLayer: CAShapeLayer = CAShapeLayer()
    var brushDown: Bool = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(mainImageView)
        mainImageView.stretchToSuperviewFrame()
        addSubview(drawLayer)
        drawLayer.stretchToSuperviewFrame()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func changeColor(newColor: String) {
        brush.setColor(newColor: newColor)
    }
    
    func removeFromCanvas() {
        drawLayer.layer.sublayers?.removeLast()
        let renderer = UIGraphicsImageRenderer(bounds: drawLayer.bounds)
        let image = renderer.image { rendererContext in
            drawLayer.layer.render(in: rendererContext.cgContext)
        }
        mainImageView.image = image
    }
}
