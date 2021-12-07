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
    
    var brushDown: Bool = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        [mainImageView, drawLayer].forEach {
            addSubview($0)
            //backgroundColor = UIColor.yellow
            $0.pinToSuperViewEdges()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        lastPoint = touch.location(in: self)
        if brushDown {
            print("Touch began")
            currentLayer = CAShapeLayer()
            currentPath = UIBezierPath()
            drawLayer.layer.addSublayer(currentLayer)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        let currentPoint = touch.location(in: self)
        if brushDown {
            print("Touch move")
            drawLine(from: lastPoint, to: currentPoint)
        }
        lastPoint = currentPoint
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        if !brushDown, let layer = findLayer(in: touch) {
            removeFromSuperLayer(from: layer)
        }

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
        currentLayer.backgroundColor = UIColor(named: brush.getColor())?.cgColor
        currentLayer.strokeColor = UIColor(named: brush.getColor())?.cgColor
        currentLayer.lineWidth = 8
        currentLayer.lineCap = .round
        currentLayer.lineJoin = .round
    }
    
    private func findLayer(in touch: UITouch) -> CAShapeLayer? {
        let point = touch.location(in: self)

        guard let sublayers = drawLayer.layer.sublayers else { return nil }

        for layer in sublayers {
            if let shapeLayer = layer as? CAShapeLayer,
                let outline = shapeLayer.path?.copy(strokingWithWidth: 8, lineCap: .butt, lineJoin: .round, miterLimit: 0),
                outline.contains(point) == true {
                return shapeLayer
            }
        }
        
        return nil
    }
    
    private func removeFromSuperLayer(from layer: CALayer) {
        if layer != drawLayer.layer {
            if let superLayer = layer.superlayer {
                removeFromSuperLayer(from: superLayer)
                layer.removeFromSuperlayer()
            }
        }
    }
}
