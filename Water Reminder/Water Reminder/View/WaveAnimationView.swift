//
//  WaveAnimationView.swift
//  Water Reminder
//
//  Created by Darya on 11/9/21.
//

import Foundation
import UIKit

class WaveAnimationView: UIView {
    
    private let frontWaveLine: UIBezierPath = UIBezierPath()
    private let backWaveLine: UIBezierPath = UIBezierPath()
    
    private let frontWaveLayer: CAShapeLayer = CAShapeLayer()
    private let backWaveSubLayer: CAShapeLayer = CAShapeLayer()
    private let timeInterval = 0.035
    
    private var timer = Timer()
    
    private var drawSeconds: CGFloat = 0.0
    private var drawElapsedTime: CGFloat = 0.0
    
    private var width: CGFloat
    private var height: CGFloat
    private var xAxis: CGFloat
    private var yAxis: CGFloat
    
    private var maskLayer: CALayer?
    
    var progress: Float {
        willSet {
            self.xAxis = self.height - self.height * CGFloat(min (max (newValue, 0), 1))
        }
    }
    
    private let waveHeight: CGFloat = 20.0
    private let waveDelay: CGFloat = 500.0
    
    private let frontColor: UIColor = UIColor(named: CustomColor.waveBack.rawValue) ?? UIColor.blue
    private let backColor: UIColor = UIColor(named: CustomColor.waveFront.rawValue) ?? UIColor.blue
    
    public override init(frame: CGRect) {
        self.width = frame.width
        self.height = frame.height
        self.xAxis = floor(height / 2)
        self.yAxis = 0.0
        self.progress = 0.1
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func draw(_ rect: CGRect) {
        wave(layer: backWaveSubLayer, path: backWaveLine, color: backColor, delay: waveDelay)
        wave(layer: frontWaveLayer, path: frontWaveLine, color: frontColor, delay: 0)
    }
    
    func setProgress(_ point: Float) {
        let setPoint:CGFloat = CGFloat(min(max(point, 0),1))
        progress = Float(setPoint)
    }
    
    func startAnimation() {
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(waveAnimation), userInfo: nil, repeats: true)
        }
    }
    
    func stopAnimation() {
        if timer.isValid {
            timer.invalidate()
        }
    }
    
    @objc private func waveAnimation() {
        self.setNeedsDisplay()
    }
    
    @objc private func wave(layer: CAShapeLayer, path: UIBezierPath, color: UIColor, delay: CGFloat) {
        let waveOffset: CGFloat = 0.009
        path.removeAllPoints()
        drawWave(layer: layer, path: path, color: color, delay: delay)
        drawSeconds += waveOffset
        drawElapsedTime = drawSeconds * CGFloat(Double.pi)
        
        if drawElapsedTime >= CGFloat(Double.pi) {
            drawSeconds = 0.0
            drawElapsedTime = 0.0
        }
    }
    
    private func drawWave(layer: CAShapeLayer, path: UIBezierPath, color: UIColor, delay: CGFloat) {
        drawSin(path: path, time: drawElapsedTime / 0.5, delay: delay)
        path.addLine(to: CGPoint(x: width + 10, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.close()
        
        layer.fillColor = color.cgColor
        layer.path = path.cgPath
        self.layer.insertSublayer(layer, at: 0)
    }
    
    private func drawSin(path: UIBezierPath, time: CGFloat, delay: CGFloat) {
        
        var x = time
        var y = sin(x)
        let offset: CGFloat = 10
        let newLineValue: CGFloat = 100
        let start = CGPoint(x: yAxis, y: newLineValue * y + xAxis)
        
        path.move(to: start)
        
        var iteration = yAxis
        while iteration <= width + offset {
            x = time + ( -yAxis + iteration ) / newLineValue
            y = sin(x - delay) / waveHeight
            
            path.addLine(to: CGPoint(x: iteration, y: newLineValue * y + xAxis))
            
            iteration += offset
        }
    }
}
