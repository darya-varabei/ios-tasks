//
//  CanvasView.swift
//  Drawing
//
//  Created by Дарья Воробей on 12/6/21.
//

import Foundation
import UIKit

class CanvasView: UIView {
    private var lastPoint: CGPoint = .zero
    private var currentPath = UIBezierPath()
    private var currentLayer: CAShapeLayer = CAShapeLayer()
    private let brush = Brush.brush
    private let drawLayer = UIView()
    private let mainImageView = UIImageView()
    private var brushDown: Bool = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(mainImageView)
        mainImageView.clipView()
        addSubview(drawLayer)
        drawLayer.clipView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        lastPoint = touch.location(in: self)
        if brushDown {
            currentLayer = CAShapeLayer()
            currentPath = UIBezierPath()
            drawLayer.layer.addSublayer(currentLayer)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        let currentPoint = touch.location(in: self)
        if brushDown {
            drawLine(from: lastPoint, to: currentPoint)
        }
        lastPoint = currentPoint
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let renderer = UIGraphicsImageRenderer(bounds: drawLayer.bounds)
        let image = renderer.image { rendererContext in
            drawLayer.layer.render(in: rendererContext.cgContext)
        }
        mainImageView.image = image
    }
    
    private func drawLine(from fromPoint: CGPoint, to toPoint: CGPoint) {
        currentPath.move(to: fromPoint)
        currentPath.addLine(to: toPoint)
        
        currentLayer.path = currentPath.cgPath
        currentLayer.strokeColor = UIColor(named: brush.getColor())?.cgColor
        currentLayer.lineWidth = CGFloat(brush.getOutlineWidth())
        currentLayer.lineCap = .round
        currentLayer.lineJoin = .round
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
