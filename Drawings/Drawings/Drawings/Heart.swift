//
//  Heart.swift
//  Drawings
//
//  Created by Darya on 11/25/21.
//

import Foundation
import UIKit

class Heart: Drawing {
    
    override func draw() {
    //// Color Declarations
    let strokeColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)

    //// Bezier Drawing
    let bezierPath = UIBezierPath()
    bezierPath.move(to: CGPoint(x: 0, y: 224))
    bezierPath.addCurve(to: CGPoint(x: 161, y: 207.5), controlPoint1: CGPoint(x: 82.11, y: 233.33), controlPoint2: CGPoint(x: 114.76, y: 227.59))
    bezierPath.move(to: CGPoint(x: 161, y: 207.5))
    bezierPath.addCurve(to: CGPoint(x: 192.5, y: 159), controlPoint1: CGPoint(x: 196.94, y: 182.1), controlPoint2: CGPoint(x: 194.73, y: 173.97))
    bezierPath.addCurve(to: CGPoint(x: 174.5, y: 154.5), controlPoint1: CGPoint(x: 187.76, y: 152.34), controlPoint2: CGPoint(x: 183.58, y: 151.85))
    bezierPath.addCurve(to: CGPoint(x: 159.5, y: 173.5), controlPoint1: CGPoint(x: 167.08, y: 158.73), controlPoint2: CGPoint(x: 164.2, y: 163.72))
    bezierPath.addCurve(to: CGPoint(x: 143, y: 154.5), controlPoint1: CGPoint(x: 154.12, y: 160.94), controlPoint2: CGPoint(x: 150.28, y: 157.91))
    bezierPath.addCurve(to: CGPoint(x: 126, y: 159), controlPoint1: CGPoint(x: 134.27, y: 151.61), controlPoint2: CGPoint(x: 130.68, y: 152.9))
    bezierPath.addCurve(to: CGPoint(x: 132, y: 186.5), controlPoint1: CGPoint(x: 122.79, y: 171.02), controlPoint2: CGPoint(x: 125.87, y: 176.63))
    bezierPath.addCurve(to: CGPoint(x: 161, y: 207.5), controlPoint1: CGPoint(x: 141.37, y: 198.99), controlPoint2: CGPoint(x: 148.52, y: 201.83))
    bezierPath.close()
    bezierPath.move(to: CGPoint(x: 161, y: 207.5))
    bezierPath.addCurve(to: CGPoint(x: 210.5, y: 194.5), controlPoint1: CGPoint(x: 178.7, y: 209.22), controlPoint2: CGPoint(x: 189.62, y: 206.06))
    bezierPath.move(to: CGPoint(x: 210.5, y: 194.5))
    bezierPath.addCurve(to: CGPoint(x: 244, y: 154.5), controlPoint1: CGPoint(x: 227.03, y: 181.8), controlPoint2: CGPoint(x: 235.63, y: 174.11))
    bezierPath.addCurve(to: CGPoint(x: 241, y: 132.5), controlPoint1: CGPoint(x: 245.6, y: 144.99), controlPoint2: CGPoint(x: 247.57, y: 139.31))
    bezierPath.addCurve(to: CGPoint(x: 221, y: 132.5), controlPoint1: CGPoint(x: 233.54, y: 127.97), controlPoint2: CGPoint(x: 229.13, y: 128.33))
    bezierPath.addCurve(to: CGPoint(x: 207.5, y: 152.5), controlPoint1: CGPoint(x: 213.7, y: 138.53), controlPoint2: CGPoint(x: 210.6, y: 142.78))
    bezierPath.addCurve(to: CGPoint(x: 190.5, y: 132.5), controlPoint1: CGPoint(x: 203.17, y: 143.19), controlPoint2: CGPoint(x: 200.97, y: 137.82))
    bezierPath.addCurve(to: CGPoint(x: 172, y: 132.5), controlPoint1: CGPoint(x: 183.6, y: 128.23), controlPoint2: CGPoint(x: 179.56, y: 128.1))
    bezierPath.addCurve(to: CGPoint(x: 174.5, y: 164.5), controlPoint1: CGPoint(x: 164.14, y: 143.51), controlPoint2: CGPoint(x: 166.63, y: 150.84))
    bezierPath.addCurve(to: CGPoint(x: 210.5, y: 194.5), controlPoint1: CGPoint(x: 185.71, y: 178.39), controlPoint2: CGPoint(x: 191.89, y: 186.25))
    bezierPath.close()
    bezierPath.move(to: CGPoint(x: 210.5, y: 194.5))
    bezierPath.addCurve(to: CGPoint(x: 284.5, y: 214), controlPoint1: CGPoint(x: 235.88, y: 206.71), controlPoint2: CGPoint(x: 252.45, y: 210.49))
    bezierPath.addCurve(to: CGPoint(x: 376, y: 212), controlPoint1: CGPoint(x: 319.87, y: 217.92), controlPoint2: CGPoint(x: 339.92, y: 217.35))
    strokeColor.setStroke()
    bezierPath.lineWidth = 1
    bezierPath.miterLimit = 4
    bezierPath.stroke()
    }
}
