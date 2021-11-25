//
//  Ornament.swift
//  Drawings
//
//  Created by Darya on 11/25/21.
//

import Foundation
import UIKit

class Ornament: Drawing {
    override func draw() {
        let context = UIGraphicsGetCurrentContext()!

        let strokeColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
        context.saveGState()
        context.setAlpha(0.01)

        let bezier9Path = UIBezierPath()
        bezier9Path.move(to: CGPoint(x: 149.44, y: 154.71))
        bezier9Path.addCurve(to: CGPoint(x: 149.89, y: 153.62), controlPoint1: CGPoint(x: 152, y: 152.62), controlPoint2: CGPoint(x: 150.23, y: 156.91))
        bezier9Path.addCurve(to: CGPoint(x: 150.98, y: 153.17), controlPoint1: CGPoint(x: 153.18, y: 153.96), controlPoint2: CGPoint(x: 148.89, y: 155.73))
        bezier9Path.addCurve(to: CGPoint(x: 152.07, y: 153.62), controlPoint1: CGPoint(x: 153.06, y: 155.73), controlPoint2: CGPoint(x: 148.78, y: 153.96))
        bezier9Path.addCurve(to: CGPoint(x: 152.52, y: 154.71), controlPoint1: CGPoint(x: 151.73, y: 156.91), controlPoint2: CGPoint(x: 149.95, y: 152.62))
        bezier9Path.addCurve(to: CGPoint(x: 152.07, y: 155.8), controlPoint1: CGPoint(x: 149.95, y: 156.8), controlPoint2: CGPoint(x: 151.73, y: 152.51))
        bezier9Path.addCurve(to: CGPoint(x: 150.98, y: 156.25), controlPoint1: CGPoint(x: 148.78, y: 155.46), controlPoint2: CGPoint(x: 153.06, y: 153.68))
        bezier9Path.addCurve(to: CGPoint(x: 149.89, y: 155.8), controlPoint1: CGPoint(x: 148.89, y: 153.68), controlPoint2: CGPoint(x: 153.18, y: 155.46))
        bezier9Path.addCurve(to: CGPoint(x: 149.44, y: 154.71), controlPoint1: CGPoint(x: 150.23, y: 152.51), controlPoint2: CGPoint(x: 152, y: 156.8))
        bezier9Path.close()
        strokeColor.setStroke()
        bezier9Path.lineWidth = 1
        bezier9Path.stroke()

        context.restoreGState()


        //// Bezier 10 Drawing
        context.saveGState()
        context.setAlpha(0.02)

        let bezier10Path = UIBezierPath()
        bezier10Path.move(to: CGPoint(x: 148.41, y: 154.64))
        bezier10Path.addCurve(to: CGPoint(x: 149.18, y: 152.84), controlPoint1: CGPoint(x: 152.7, y: 151.22), controlPoint2: CGPoint(x: 149.68, y: 158.31))
        bezier10Path.addCurve(to: CGPoint(x: 150.99, y: 152.11), controlPoint1: CGPoint(x: 154.63, y: 153.46), controlPoint2: CGPoint(x: 147.48, y: 156.33))
        bezier10Path.addCurve(to: CGPoint(x: 152.79, y: 152.88), controlPoint1: CGPoint(x: 154.41, y: 156.41), controlPoint2: CGPoint(x: 147.33, y: 153.38))
        bezier10Path.addCurve(to: CGPoint(x: 153.52, y: 154.69), controlPoint1: CGPoint(x: 152.17, y: 158.33), controlPoint2: CGPoint(x: 149.3, y: 151.18))
        bezier10Path.addCurve(to: CGPoint(x: 152.75, y: 156.49), controlPoint1: CGPoint(x: 149.23, y: 158.12), controlPoint2: CGPoint(x: 152.25, y: 151.03))
        bezier10Path.addCurve(to: CGPoint(x: 150.94, y: 157.22), controlPoint1: CGPoint(x: 147.3, y: 155.88), controlPoint2: CGPoint(x: 154.45, y: 153))
        bezier10Path.addCurve(to: CGPoint(x: 149.14, y: 156.46), controlPoint1: CGPoint(x: 147.52, y: 152.93), controlPoint2: CGPoint(x: 154.61, y: 155.95))
        bezier10Path.addCurve(to: CGPoint(x: 148.41, y: 154.64), controlPoint1: CGPoint(x: 149.76, y: 151), controlPoint2: CGPoint(x: 152.63, y: 158.15))
        bezier10Path.close()
        strokeColor.setStroke()
        bezier10Path.lineWidth = 1
        bezier10Path.stroke()

        context.restoreGState()


        //// Bezier 11 Drawing
        context.saveGState()
        context.setAlpha(0.02)

        let bezier11Path = UIBezierPath()
        bezier11Path.move(to: CGPoint(x: 147.38, y: 154.55))
        bezier11Path.addCurve(to: CGPoint(x: 148.48, y: 152.05), controlPoint1: CGPoint(x: 153.44, y: 149.84), controlPoint2: CGPoint(x: 149.11, y: 159.7))
        bezier11Path.addCurve(to: CGPoint(x: 151.03, y: 151.06), controlPoint1: CGPoint(x: 156.1, y: 152.99), controlPoint2: CGPoint(x: 146.06, y: 156.9))
        bezier11Path.addCurve(to: CGPoint(x: 153.53, y: 152.15), controlPoint1: CGPoint(x: 155.75, y: 157.11), controlPoint2: CGPoint(x: 145.89, y: 152.78))
        bezier11Path.addCurve(to: CGPoint(x: 154.53, y: 154.7), controlPoint1: CGPoint(x: 152.59, y: 159.77), controlPoint2: CGPoint(x: 148.68, y: 149.74))
        bezier11Path.addCurve(to: CGPoint(x: 153.43, y: 157.21), controlPoint1: CGPoint(x: 148.48, y: 159.42), controlPoint2: CGPoint(x: 152.8, y: 149.56))
        bezier11Path.addCurve(to: CGPoint(x: 150.88, y: 158.2), controlPoint1: CGPoint(x: 145.81, y: 156.26), controlPoint2: CGPoint(x: 155.85, y: 152.35))
        bezier11Path.addCurve(to: CGPoint(x: 148.38, y: 157.1), controlPoint1: CGPoint(x: 146.16, y: 152.15), controlPoint2: CGPoint(x: 156.03, y: 156.48))
        bezier11Path.addCurve(to: CGPoint(x: 147.38, y: 154.55), controlPoint1: CGPoint(x: 149.32, y: 149.49), controlPoint2: CGPoint(x: 153.23, y: 159.52))
        bezier11Path.close()
        strokeColor.setStroke()
        bezier11Path.lineWidth = 1
        bezier11Path.stroke()

        context.restoreGState()


        //// Bezier 12 Drawing
        context.saveGState()
        context.setAlpha(0.03)

        let bezier12Path = UIBezierPath()
        bezier12Path.move(to: CGPoint(x: 146.36, y: 154.44))
        bezier12Path.addCurve(to: CGPoint(x: 147.8, y: 151.24), controlPoint1: CGPoint(x: 154.19, y: 148.47), controlPoint2: CGPoint(x: 148.5, y: 161.07))
        bezier12Path.addCurve(to: CGPoint(x: 151.09, y: 150), controlPoint1: CGPoint(x: 157.57, y: 152.56), controlPoint2: CGPoint(x: 144.63, y: 157.45))
        bezier12Path.addCurve(to: CGPoint(x: 154.29, y: 151.45), controlPoint1: CGPoint(x: 157.07, y: 157.84), controlPoint2: CGPoint(x: 144.46, y: 152.14))
        bezier12Path.addCurve(to: CGPoint(x: 155.53, y: 154.73), controlPoint1: CGPoint(x: 152.98, y: 161.21), controlPoint2: CGPoint(x: 148.09, y: 148.27))
        bezier12Path.addCurve(to: CGPoint(x: 154.09, y: 157.93), controlPoint1: CGPoint(x: 147.7, y: 160.71), controlPoint2: CGPoint(x: 153.39, y: 148.1))
        bezier12Path.addCurve(to: CGPoint(x: 150.8, y: 159.18), controlPoint1: CGPoint(x: 144.32, y: 156.62), controlPoint2: CGPoint(x: 157.26, y: 151.73))
        bezier12Path.addCurve(to: CGPoint(x: 147.6, y: 157.73), controlPoint1: CGPoint(x: 144.82, y: 151.34), controlPoint2: CGPoint(x: 157.43, y: 157.03))
        bezier12Path.addCurve(to: CGPoint(x: 146.36, y: 154.44), controlPoint1: CGPoint(x: 148.91, y: 147.96), controlPoint2: CGPoint(x: 153.8, y: 160.9))
        bezier12Path.close()
        strokeColor.setStroke()
        bezier12Path.lineWidth = 1
        bezier12Path.stroke()

        context.restoreGState()


        //// Bezier 13 Drawing
        context.saveGState()
        context.setAlpha(0.04)

        let bezier13Path = UIBezierPath()
        bezier13Path.move(to: CGPoint(x: 145.33, y: 154.31))
        bezier13Path.addCurve(to: CGPoint(x: 147.14, y: 150.42), controlPoint1: CGPoint(x: 154.98, y: 147.11), controlPoint2: CGPoint(x: 147.87, y: 162.44))
        bezier13Path.addCurve(to: CGPoint(x: 151.17, y: 148.95), controlPoint1: CGPoint(x: 159.06, y: 152.15), controlPoint2: CGPoint(x: 143.19, y: 157.96))
        bezier13Path.addCurve(to: CGPoint(x: 155.06, y: 150.75), controlPoint1: CGPoint(x: 158.37, y: 158.6), controlPoint2: CGPoint(x: 143.04, y: 151.48))
        bezier13Path.addCurve(to: CGPoint(x: 156.54, y: 154.78), controlPoint1: CGPoint(x: 153.33, y: 162.67), controlPoint2: CGPoint(x: 147.53, y: 146.8))
        bezier13Path.addCurve(to: CGPoint(x: 154.73, y: 158.67), controlPoint1: CGPoint(x: 146.89, y: 161.98), controlPoint2: CGPoint(x: 154, y: 146.66))
        bezier13Path.addCurve(to: CGPoint(x: 150.7, y: 160.15), controlPoint1: CGPoint(x: 142.82, y: 156.94), controlPoint2: CGPoint(x: 158.68, y: 151.14))
        bezier13Path.addCurve(to: CGPoint(x: 146.81, y: 158.34), controlPoint1: CGPoint(x: 143.5, y: 150.5), controlPoint2: CGPoint(x: 158.83, y: 157.62))
        bezier13Path.addCurve(to: CGPoint(x: 145.33, y: 154.31), controlPoint1: CGPoint(x: 148.54, y: 146.43), controlPoint2: CGPoint(x: 154.35, y: 162.3))
        bezier13Path.close()
        strokeColor.setStroke()
        bezier13Path.lineWidth = 1
        bezier13Path.stroke()

        context.restoreGState()


        //// Bezier 14 Drawing
        context.saveGState()
        context.setAlpha(0.04)

        let bezier14Path = UIBezierPath()
        bezier14Path.move(to: CGPoint(x: 144.31, y: 154.16))
        bezier14Path.addCurve(to: CGPoint(x: 146.5, y: 149.59), controlPoint1: CGPoint(x: 155.8, y: 145.77), controlPoint2: CGPoint(x: 147.21, y: 163.79))
        bezier14Path.addCurve(to: CGPoint(x: 151.27, y: 147.89), controlPoint1: CGPoint(x: 160.55, y: 151.78), controlPoint2: CGPoint(x: 141.73, y: 158.44))
        bezier14Path.addCurve(to: CGPoint(x: 155.85, y: 150.08), controlPoint1: CGPoint(x: 159.66, y: 159.38), controlPoint2: CGPoint(x: 141.64, y: 150.79))
        bezier14Path.addCurve(to: CGPoint(x: 157.54, y: 154.85), controlPoint1: CGPoint(x: 153.66, y: 164.13), controlPoint2: CGPoint(x: 146.99, y: 145.31))
        bezier14Path.addCurve(to: CGPoint(x: 155.36, y: 159.43), controlPoint1: CGPoint(x: 146.05, y: 163.24), controlPoint2: CGPoint(x: 154.65, y: 145.22))
        bezier14Path.addCurve(to: CGPoint(x: 150.58, y: 161.12), controlPoint1: CGPoint(x: 141.31, y: 157.24), controlPoint2: CGPoint(x: 160.12, y: 150.58))
        bezier14Path.addCurve(to: CGPoint(x: 146.01, y: 158.94), controlPoint1: CGPoint(x: 142.19, y: 149.64), controlPoint2: CGPoint(x: 160.21, y: 158.23))
        bezier14Path.addCurve(to: CGPoint(x: 144.31, y: 154.16), controlPoint1: CGPoint(x: 148.2, y: 144.89), controlPoint2: CGPoint(x: 154.86, y: 163.7))
        bezier14Path.close()
        strokeColor.setStroke()
        bezier14Path.lineWidth = 1
        bezier14Path.stroke()

        context.restoreGState()


        //// Bezier 15 Drawing
        context.saveGState()
        context.setAlpha(0.05)

        let bezier15Path = UIBezierPath()
        bezier15Path.move(to: CGPoint(x: 143.29, y: 153.99))
        bezier15Path.addCurve(to: CGPoint(x: 145.87, y: 148.74), controlPoint1: CGPoint(x: 156.64, y: 144.45), controlPoint2: CGPoint(x: 146.51, y: 165.13))
        bezier15Path.addCurve(to: CGPoint(x: 151.4, y: 146.84), controlPoint1: CGPoint(x: 162.05, y: 151.44), controlPoint2: CGPoint(x: 140.26, y: 158.89))
        bezier15Path.addCurve(to: CGPoint(x: 156.65, y: 149.42), controlPoint1: CGPoint(x: 160.93, y: 160.19), controlPoint2: CGPoint(x: 140.26, y: 150.06))
        bezier15Path.addCurve(to: CGPoint(x: 158.54, y: 154.95), controlPoint1: CGPoint(x: 153.95, y: 165.6), controlPoint2: CGPoint(x: 146.49, y: 143.81))
        bezier15Path.addCurve(to: CGPoint(x: 155.97, y: 160.2), controlPoint1: CGPoint(x: 145.19, y: 164.48), controlPoint2: CGPoint(x: 155.32, y: 143.81))
        bezier15Path.addCurve(to: CGPoint(x: 150.44, y: 162.09), controlPoint1: CGPoint(x: 139.79, y: 157.5), controlPoint2: CGPoint(x: 161.57, y: 150.04))
        bezier15Path.addCurve(to: CGPoint(x: 145.19, y: 159.52), controlPoint1: CGPoint(x: 140.9, y: 148.74), controlPoint2: CGPoint(x: 161.58, y: 158.87))
        bezier15Path.addCurve(to: CGPoint(x: 143.29, y: 153.99), controlPoint1: CGPoint(x: 147.89, y: 143.34), controlPoint2: CGPoint(x: 155.34, y: 165.12))
        bezier15Path.close()
        strokeColor.setStroke()
        bezier15Path.lineWidth = 1
        bezier15Path.stroke()

        context.restoreGState()


        //// Bezier 16 Drawing
        context.saveGState()
        context.setAlpha(0.06)

        let bezier16Path = UIBezierPath()
        bezier16Path.move(to: CGPoint(x: 142.28, y: 153.8))
        bezier16Path.addCurve(to: CGPoint(x: 145.25, y: 147.88), controlPoint1: CGPoint(x: 157.52, y: 143.15), controlPoint2: CGPoint(x: 145.79, y: 166.46))
        bezier16Path.addCurve(to: CGPoint(x: 151.54, y: 145.8), controlPoint1: CGPoint(x: 163.56, y: 151.12), controlPoint2: CGPoint(x: 138.79, y: 159.32))
        bezier16Path.addCurve(to: CGPoint(x: 157.46, y: 148.77), controlPoint1: CGPoint(x: 162.19, y: 161.04), controlPoint2: CGPoint(x: 138.88, y: 149.31))
        bezier16Path.addCurve(to: CGPoint(x: 159.54, y: 155.06), controlPoint1: CGPoint(x: 154.22, y: 167.08), controlPoint2: CGPoint(x: 146.02, y: 142.31))
        bezier16Path.addCurve(to: CGPoint(x: 156.57, y: 160.98), controlPoint1: CGPoint(x: 144.3, y: 165.71), controlPoint2: CGPoint(x: 156.03, y: 142.4))
        bezier16Path.addCurve(to: CGPoint(x: 150.28, y: 163.06), controlPoint1: CGPoint(x: 138.26, y: 157.73), controlPoint2: CGPoint(x: 163.03, y: 149.54))
        bezier16Path.addCurve(to: CGPoint(x: 144.36, y: 160.09), controlPoint1: CGPoint(x: 139.63, y: 147.82), controlPoint2: CGPoint(x: 162.94, y: 159.55))
        bezier16Path.addCurve(to: CGPoint(x: 142.28, y: 153.8), controlPoint1: CGPoint(x: 147.61, y: 141.78), controlPoint2: CGPoint(x: 155.8, y: 166.55))
        bezier16Path.close()
        strokeColor.setStroke()
        bezier16Path.lineWidth = 1
        bezier16Path.stroke()

        context.restoreGState()


        //// Bezier 17 Drawing
        context.saveGState()
        context.setAlpha(0.06)

        let bezier17Path = UIBezierPath()
        bezier17Path.move(to: CGPoint(x: 141.26, y: 153.58))
        bezier17Path.addCurve(to: CGPoint(x: 144.66, y: 147), controlPoint1: CGPoint(x: 158.42, y: 141.86), controlPoint2: CGPoint(x: 145.05, y: 167.77))
        bezier17Path.addCurve(to: CGPoint(x: 151.71, y: 144.75), controlPoint1: CGPoint(x: 165.07, y: 150.85), controlPoint2: CGPoint(x: 137.3, y: 159.71))
        bezier17Path.addCurve(to: CGPoint(x: 158.29, y: 148.15), controlPoint1: CGPoint(x: 163.43, y: 161.9), controlPoint2: CGPoint(x: 137.52, y: 148.53))
        bezier17Path.addCurve(to: CGPoint(x: 160.54, y: 155.2), controlPoint1: CGPoint(x: 154.45, y: 168.56), controlPoint2: CGPoint(x: 145.58, y: 140.79))
        bezier17Path.addCurve(to: CGPoint(x: 157.15, y: 161.78), controlPoint1: CGPoint(x: 143.39, y: 166.92), controlPoint2: CGPoint(x: 156.76, y: 141.01))
        bezier17Path.addCurve(to: CGPoint(x: 150.09, y: 164.03), controlPoint1: CGPoint(x: 136.73, y: 157.93), controlPoint2: CGPoint(x: 164.51, y: 149.07))
        bezier17Path.addCurve(to: CGPoint(x: 143.51, y: 160.63), controlPoint1: CGPoint(x: 138.38, y: 146.88), controlPoint2: CGPoint(x: 164.28, y: 160.25))
        bezier17Path.addCurve(to: CGPoint(x: 141.26, y: 153.58), controlPoint1: CGPoint(x: 147.36, y: 140.22), controlPoint2: CGPoint(x: 156.22, y: 167.99))
        bezier17Path.close()
        strokeColor.setStroke()
        bezier17Path.lineWidth = 1
        bezier17Path.stroke()

        context.restoreGState()


        //// Bezier 18 Drawing
        context.saveGState()
        context.setAlpha(0.07)

        let bezier18Path = UIBezierPath()
        bezier18Path.move(to: CGPoint(x: 140.25, y: 153.34))
        bezier18Path.addCurve(to: CGPoint(x: 144.08, y: 146.11), controlPoint1: CGPoint(x: 159.34, y: 140.6), controlPoint2: CGPoint(x: 144.27, y: 169.07))
        bezier18Path.addCurve(to: CGPoint(x: 151.9, y: 143.71), controlPoint1: CGPoint(x: 166.6, y: 150.6), controlPoint2: CGPoint(x: 135.8, y: 160.07))
        bezier18Path.addCurve(to: CGPoint(x: 159.13, y: 147.54), controlPoint1: CGPoint(x: 164.65, y: 162.8), controlPoint2: CGPoint(x: 136.18, y: 147.72))
        bezier18Path.addCurve(to: CGPoint(x: 161.54, y: 155.36), controlPoint1: CGPoint(x: 154.65, y: 170.05), controlPoint2: CGPoint(x: 145.18, y: 139.26))
        bezier18Path.addCurve(to: CGPoint(x: 157.71, y: 162.59), controlPoint1: CGPoint(x: 142.45, y: 168.1), controlPoint2: CGPoint(x: 157.52, y: 139.63))
        bezier18Path.addCurve(to: CGPoint(x: 149.89, y: 164.99), controlPoint1: CGPoint(x: 135.2, y: 158.1), controlPoint2: CGPoint(x: 165.99, y: 148.63))
        bezier18Path.addCurve(to: CGPoint(x: 142.66, y: 161.16), controlPoint1: CGPoint(x: 137.14, y: 145.9), controlPoint2: CGPoint(x: 165.61, y: 160.98))
        bezier18Path.addCurve(to: CGPoint(x: 140.25, y: 153.34), controlPoint1: CGPoint(x: 147.14, y: 138.65), controlPoint2: CGPoint(x: 156.62, y: 169.44))
        bezier18Path.close()
        strokeColor.setStroke()
        bezier18Path.lineWidth = 1
        bezier18Path.stroke()

        context.restoreGState()


        //// Bezier 19 Drawing
        context.saveGState()
        context.setAlpha(0.08)

        let bezier19Path = UIBezierPath()
        bezier19Path.move(to: CGPoint(x: 139.25, y: 153.09))
        bezier19Path.addCurve(to: CGPoint(x: 143.52, y: 145.21), controlPoint1: CGPoint(x: 160.3, y: 139.35), controlPoint2: CGPoint(x: 143.46, y: 170.35))
        bezier19Path.addCurve(to: CGPoint(x: 152.11, y: 142.67), controlPoint1: CGPoint(x: 168.12, y: 150.38), controlPoint2: CGPoint(x: 134.3, y: 160.4))
        bezier19Path.addCurve(to: CGPoint(x: 159.99, y: 146.94), controlPoint1: CGPoint(x: 165.85, y: 163.72), controlPoint2: CGPoint(x: 134.85, y: 146.88))
        bezier19Path.addCurve(to: CGPoint(x: 162.53, y: 155.53), controlPoint1: CGPoint(x: 154.82, y: 171.55), controlPoint2: CGPoint(x: 144.8, y: 137.72))
        bezier19Path.addCurve(to: CGPoint(x: 158.26, y: 163.41), controlPoint1: CGPoint(x: 141.48, y: 169.28), controlPoint2: CGPoint(x: 158.32, y: 138.27))
        bezier19Path.addCurve(to: CGPoint(x: 149.67, y: 165.95), controlPoint1: CGPoint(x: 133.65, y: 158.24), controlPoint2: CGPoint(x: 167.48, y: 148.22))
        bezier19Path.addCurve(to: CGPoint(x: 141.79, y: 161.68), controlPoint1: CGPoint(x: 135.92, y: 144.9), controlPoint2: CGPoint(x: 166.93, y: 161.74))
        bezier19Path.addCurve(to: CGPoint(x: 139.25, y: 153.09), controlPoint1: CGPoint(x: 146.96, y: 137.08), controlPoint2: CGPoint(x: 156.98, y: 170.91))
        bezier19Path.close()
        strokeColor.setStroke()
        bezier19Path.lineWidth = 1
        bezier19Path.stroke()

        context.restoreGState()


        //// Bezier 20 Drawing
        context.saveGState()
        context.setAlpha(0.08)

        let bezier20Path = UIBezierPath()
        bezier20Path.move(to: CGPoint(x: 138.25, y: 152.81))
        bezier20Path.addCurve(to: CGPoint(x: 142.98, y: 144.3), controlPoint1: CGPoint(x: 161.28, y: 138.11), controlPoint2: CGPoint(x: 142.63, y: 171.62))
        bezier20Path.addCurve(to: CGPoint(x: 152.35, y: 141.63), controlPoint1: CGPoint(x: 169.66, y: 150.2), controlPoint2: CGPoint(x: 132.78, y: 160.7))
        bezier20Path.addCurve(to: CGPoint(x: 160.85, y: 146.37), controlPoint1: CGPoint(x: 167.04, y: 164.67), controlPoint2: CGPoint(x: 133.53, y: 146.02))
        bezier20Path.addCurve(to: CGPoint(x: 163.52, y: 155.73), controlPoint1: CGPoint(x: 154.96, y: 173.05), controlPoint2: CGPoint(x: 144.45, y: 136.17))
        bezier20Path.addCurve(to: CGPoint(x: 158.79, y: 164.24), controlPoint1: CGPoint(x: 140.49, y: 170.43), controlPoint2: CGPoint(x: 159.14, y: 136.92))
        bezier20Path.addCurve(to: CGPoint(x: 149.42, y: 166.91), controlPoint1: CGPoint(x: 132.11, y: 158.35), controlPoint2: CGPoint(x: 168.99, y: 147.84))
        bezier20Path.addCurve(to: CGPoint(x: 140.91, y: 162.17), controlPoint1: CGPoint(x: 134.73, y: 143.88), controlPoint2: CGPoint(x: 168.23, y: 162.53))
        bezier20Path.addCurve(to: CGPoint(x: 138.25, y: 152.81), controlPoint1: CGPoint(x: 146.81, y: 135.5), controlPoint2: CGPoint(x: 157.31, y: 172.38))
        bezier20Path.close()
        strokeColor.setStroke()
        bezier20Path.lineWidth = 1
        bezier20Path.stroke()

        context.restoreGState()


        //// Bezier 21 Drawing
        context.saveGState()
        context.setAlpha(0.09)

        let bezier21Path = UIBezierPath()
        bezier21Path.move(to: CGPoint(x: 137.25, y: 152.51))
        bezier21Path.addCurve(to: CGPoint(x: 142.46, y: 143.38), controlPoint1: CGPoint(x: 162.29, y: 136.9), controlPoint2: CGPoint(x: 141.77, y: 172.87))
        bezier21Path.addCurve(to: CGPoint(x: 152.6, y: 140.6), controlPoint1: CGPoint(x: 171.2, y: 150.05), controlPoint2: CGPoint(x: 131.26, y: 160.97))
        bezier21Path.addCurve(to: CGPoint(x: 161.73, y: 145.81), controlPoint1: CGPoint(x: 168.21, y: 165.64), controlPoint2: CGPoint(x: 132.24, y: 145.12))
        bezier21Path.addCurve(to: CGPoint(x: 164.51, y: 155.95), controlPoint1: CGPoint(x: 155.07, y: 174.55), controlPoint2: CGPoint(x: 144.14, y: 134.61))
        bezier21Path.addCurve(to: CGPoint(x: 159.3, y: 165.09), controlPoint1: CGPoint(x: 139.47, y: 171.56), controlPoint2: CGPoint(x: 159.99, y: 135.59))
        bezier21Path.addCurve(to: CGPoint(x: 149.16, y: 167.86), controlPoint1: CGPoint(x: 130.56, y: 158.42), controlPoint2: CGPoint(x: 170.5, y: 147.49))
        bezier21Path.addCurve(to: CGPoint(x: 140.02, y: 162.65), controlPoint1: CGPoint(x: 133.55, y: 142.82), controlPoint2: CGPoint(x: 169.52, y: 163.34))
        bezier21Path.addCurve(to: CGPoint(x: 137.25, y: 152.51), controlPoint1: CGPoint(x: 146.69, y: 133.91), controlPoint2: CGPoint(x: 157.62, y: 173.85))
        bezier21Path.close()
        strokeColor.setStroke()
        bezier21Path.lineWidth = 1
        bezier21Path.stroke()

        context.restoreGState()


        //// Bezier 22 Drawing
        context.saveGState()
        context.setAlpha(0.09)

        let bezier22Path = UIBezierPath()
        bezier22Path.move(to: CGPoint(x: 136.25, y: 152.19))
        bezier22Path.addCurve(to: CGPoint(x: 141.95, y: 142.44), controlPoint1: CGPoint(x: 163.32, y: 135.71), controlPoint2: CGPoint(x: 140.88, y: 174.11))
        bezier22Path.addCurve(to: CGPoint(x: 152.88, y: 139.57), controlPoint1: CGPoint(x: 172.74, y: 149.93), controlPoint2: CGPoint(x: 129.73, y: 161.21))
        bezier22Path.addCurve(to: CGPoint(x: 162.63, y: 145.27), controlPoint1: CGPoint(x: 169.36, y: 166.64), controlPoint2: CGPoint(x: 130.96, y: 144.2))
        bezier22Path.addCurve(to: CGPoint(x: 165.49, y: 156.2), controlPoint1: CGPoint(x: 155.14, y: 176.06), controlPoint2: CGPoint(x: 143.86, y: 133.05))
        bezier22Path.addCurve(to: CGPoint(x: 159.79, y: 165.95), controlPoint1: CGPoint(x: 138.43, y: 172.68), controlPoint2: CGPoint(x: 160.87, y: 134.28))
        bezier22Path.addCurve(to: CGPoint(x: 148.87, y: 168.81), controlPoint1: CGPoint(x: 129, y: 158.46), controlPoint2: CGPoint(x: 172.02, y: 147.18))
        bezier22Path.addCurve(to: CGPoint(x: 139.12, y: 163.12), controlPoint1: CGPoint(x: 132.39, y: 141.75), controlPoint2: CGPoint(x: 170.79, y: 164.19))
        bezier22Path.addCurve(to: CGPoint(x: 136.25, y: 152.19), controlPoint1: CGPoint(x: 146.61, y: 132.32), controlPoint2: CGPoint(x: 157.89, y: 175.34))
        bezier22Path.close()
        strokeColor.setStroke()
        bezier22Path.lineWidth = 1
        bezier22Path.stroke()

        context.restoreGState()


        //// Bezier 23 Drawing
        context.saveGState()
        context.setAlpha(0.1)

        let bezier23Path = UIBezierPath()
        bezier23Path.move(to: CGPoint(x: 135.27, y: 151.85))
        bezier23Path.addCurve(to: CGPoint(x: 141.47, y: 141.49), controlPoint1: CGPoint(x: 164.38, y: 134.54), controlPoint2: CGPoint(x: 139.97, y: 175.33))
        bezier23Path.addCurve(to: CGPoint(x: 153.17, y: 138.55), controlPoint1: CGPoint(x: 174.29, y: 149.84), controlPoint2: CGPoint(x: 128.19, y: 161.42))
        bezier23Path.addCurve(to: CGPoint(x: 163.53, y: 144.75), controlPoint1: CGPoint(x: 170.48, y: 167.66), controlPoint2: CGPoint(x: 129.69, y: 143.25))
        bezier23Path.addCurve(to: CGPoint(x: 166.47, y: 156.46), controlPoint1: CGPoint(x: 155.19, y: 177.58), controlPoint2: CGPoint(x: 143.6, y: 131.47))
        bezier23Path.addCurve(to: CGPoint(x: 160.27, y: 166.82), controlPoint1: CGPoint(x: 137.36, y: 173.77), controlPoint2: CGPoint(x: 161.77, y: 132.98))
        bezier23Path.addCurve(to: CGPoint(x: 148.56, y: 169.76), controlPoint1: CGPoint(x: 127.45, y: 158.47), controlPoint2: CGPoint(x: 173.55, y: 146.89))
        bezier23Path.addCurve(to: CGPoint(x: 138.21, y: 163.56), controlPoint1: CGPoint(x: 131.25, y: 140.65), controlPoint2: CGPoint(x: 172.04, y: 165.06))
        bezier23Path.addCurve(to: CGPoint(x: 135.27, y: 151.85), controlPoint1: CGPoint(x: 146.55, y: 130.73), controlPoint2: CGPoint(x: 158.13, y: 176.84))
        bezier23Path.close()
        strokeColor.setStroke()
        bezier23Path.lineWidth = 1
        bezier23Path.stroke()

        context.restoreGState()


        //// Bezier 24 Drawing
        context.saveGState()
        context.setAlpha(0.11)

        let bezier24Path = UIBezierPath()
        bezier24Path.move(to: CGPoint(x: 134.28, y: 151.49))
        bezier24Path.addCurve(to: CGPoint(x: 141, y: 140.53), controlPoint1: CGPoint(x: 165.46, y: 133.39), controlPoint2: CGPoint(x: 139.02, y: 176.53))
        bezier24Path.addCurve(to: CGPoint(x: 153.49, y: 137.53), controlPoint1: CGPoint(x: 175.84, y: 149.78), controlPoint2: CGPoint(x: 126.64, y: 161.6))
        bezier24Path.addCurve(to: CGPoint(x: 164.45, y: 144.25), controlPoint1: CGPoint(x: 171.59, y: 168.72), controlPoint2: CGPoint(x: 128.45, y: 142.28))
        bezier24Path.addCurve(to: CGPoint(x: 167.45, y: 156.74), controlPoint1: CGPoint(x: 155.2, y: 179.1), controlPoint2: CGPoint(x: 143.39, y: 129.89))
        bezier24Path.addCurve(to: CGPoint(x: 160.73, y: 167.7), controlPoint1: CGPoint(x: 136.27, y: 174.84), controlPoint2: CGPoint(x: 162.71, y: 131.7))
        bezier24Path.addCurve(to: CGPoint(x: 148.24, y: 170.7), controlPoint1: CGPoint(x: 125.89, y: 158.45), controlPoint2: CGPoint(x: 175.09, y: 146.64))
        bezier24Path.addCurve(to: CGPoint(x: 137.28, y: 163.98), controlPoint1: CGPoint(x: 130.14, y: 139.52), controlPoint2: CGPoint(x: 173.28, y: 165.96))
        bezier24Path.addCurve(to: CGPoint(x: 134.28, y: 151.49), controlPoint1: CGPoint(x: 146.53, y: 129.14), controlPoint2: CGPoint(x: 158.34, y: 178.34))
        bezier24Path.close()
        strokeColor.setStroke()
        bezier24Path.lineWidth = 1
        bezier24Path.stroke()

        context.restoreGState()


        //// Bezier 25 Drawing
        context.saveGState()
        context.setAlpha(0.11)

        let bezier25Path = UIBezierPath()
        bezier25Path.move(to: CGPoint(x: 133.31, y: 151.11))
        bezier25Path.addCurve(to: CGPoint(x: 140.55, y: 139.56), controlPoint1: CGPoint(x: 166.57, y: 132.26), controlPoint2: CGPoint(x: 138.06, y: 177.72))
        bezier25Path.addCurve(to: CGPoint(x: 153.83, y: 136.52), controlPoint1: CGPoint(x: 177.4, y: 149.76), controlPoint2: CGPoint(x: 125.09, y: 161.74))
        bezier25Path.addCurve(to: CGPoint(x: 165.38, y: 143.76), controlPoint1: CGPoint(x: 172.68, y: 169.79), controlPoint2: CGPoint(x: 127.22, y: 141.27))
        bezier25Path.addCurve(to: CGPoint(x: 168.42, y: 157.05), controlPoint1: CGPoint(x: 155.18, y: 180.62), controlPoint2: CGPoint(x: 143.2, y: 128.31))
        bezier25Path.addCurve(to: CGPoint(x: 161.18, y: 168.59), controlPoint1: CGPoint(x: 135.15, y: 175.9), controlPoint2: CGPoint(x: 163.67, y: 130.44))
        bezier25Path.addCurve(to: CGPoint(x: 147.89, y: 171.63), controlPoint1: CGPoint(x: 124.32, y: 158.4), controlPoint2: CGPoint(x: 176.63, y: 146.42))
        bezier25Path.addCurve(to: CGPoint(x: 136.35, y: 164.39), controlPoint1: CGPoint(x: 129.04, y: 138.37), controlPoint2: CGPoint(x: 174.5, y: 166.88))
        bezier25Path.addCurve(to: CGPoint(x: 133.31, y: 151.11), controlPoint1: CGPoint(x: 146.54, y: 127.54), controlPoint2: CGPoint(x: 158.52, y: 179.85))
        bezier25Path.close()
        strokeColor.setStroke()
        bezier25Path.lineWidth = 1
        bezier25Path.stroke()

        context.restoreGState()


        //// Bezier 26 Drawing
        context.saveGState()
        context.setAlpha(0.12)

        let bezier26Path = UIBezierPath()
        bezier26Path.move(to: CGPoint(x: 132.33, y: 150.71))
        bezier26Path.addCurve(to: CGPoint(x: 140.12, y: 138.58), controlPoint1: CGPoint(x: 167.71, y: 131.15), controlPoint2: CGPoint(x: 137.06, y: 178.89))
        bezier26Path.addCurve(to: CGPoint(x: 154.19, y: 135.52), controlPoint1: CGPoint(x: 178.96, y: 149.77), controlPoint2: CGPoint(x: 123.53, y: 161.85))
        bezier26Path.addCurve(to: CGPoint(x: 166.31, y: 143.3), controlPoint1: CGPoint(x: 173.75, y: 170.89), controlPoint2: CGPoint(x: 126.01, y: 140.24))
        bezier26Path.addCurve(to: CGPoint(x: 169.38, y: 157.37), controlPoint1: CGPoint(x: 155.13, y: 182.14), controlPoint2: CGPoint(x: 143.04, y: 126.71))
        bezier26Path.addCurve(to: CGPoint(x: 161.6, y: 169.5), controlPoint1: CGPoint(x: 134.01, y: 176.93), controlPoint2: CGPoint(x: 164.66, y: 129.19))
        bezier26Path.addCurve(to: CGPoint(x: 147.53, y: 172.56), controlPoint1: CGPoint(x: 122.76, y: 158.31), controlPoint2: CGPoint(x: 178.19, y: 146.23))
        bezier26Path.addCurve(to: CGPoint(x: 135.4, y: 164.78), controlPoint1: CGPoint(x: 127.97, y: 137.19), controlPoint2: CGPoint(x: 175.71, y: 167.84))
        bezier26Path.addCurve(to: CGPoint(x: 132.33, y: 150.71), controlPoint1: CGPoint(x: 146.59, y: 125.94), controlPoint2: CGPoint(x: 158.67, y: 181.37))
        bezier26Path.close()
        strokeColor.setStroke()
        bezier26Path.lineWidth = 1
        bezier26Path.stroke()

        context.restoreGState()


        //// Bezier 27 Drawing
        context.saveGState()
        context.setAlpha(0.13)

        let bezier27Path = UIBezierPath()
        bezier27Path.move(to: CGPoint(x: 131.37, y: 150.28))
        bezier27Path.addCurve(to: CGPoint(x: 139.71, y: 137.59), controlPoint1: CGPoint(x: 168.87, y: 130.06), controlPoint2: CGPoint(x: 136.04, y: 180.04))
        bezier27Path.addCurve(to: CGPoint(x: 154.57, y: 134.51), controlPoint1: CGPoint(x: 180.52, y: 149.81), controlPoint2: CGPoint(x: 121.97, y: 161.94))
        bezier27Path.addCurve(to: CGPoint(x: 167.26, y: 142.85), controlPoint1: CGPoint(x: 174.8, y: 172.01), controlPoint2: CGPoint(x: 124.82, y: 139.18))
        bezier27Path.addCurve(to: CGPoint(x: 170.34, y: 157.72), controlPoint1: CGPoint(x: 155.05, y: 183.66), controlPoint2: CGPoint(x: 142.92, y: 125.11))
        bezier27Path.addCurve(to: CGPoint(x: 162.01, y: 170.41), controlPoint1: CGPoint(x: 132.84, y: 177.94), controlPoint2: CGPoint(x: 165.67, y: 127.96))
        bezier27Path.addCurve(to: CGPoint(x: 147.14, y: 173.49), controlPoint1: CGPoint(x: 121.19, y: 158.19), controlPoint2: CGPoint(x: 179.74, y: 146.07))
        bezier27Path.addCurve(to: CGPoint(x: 134.45, y: 165.15), controlPoint1: CGPoint(x: 126.92, y: 135.99), controlPoint2: CGPoint(x: 176.89, y: 168.82))
        bezier27Path.addCurve(to: CGPoint(x: 131.37, y: 150.28), controlPoint1: CGPoint(x: 146.66, y: 124.34), controlPoint2: CGPoint(x: 158.79, y: 182.89))
        bezier27Path.close()
        strokeColor.setStroke()
        bezier27Path.lineWidth = 1
        bezier27Path.stroke()

        context.restoreGState()


        //// Bezier 28 Drawing
        context.saveGState()
        context.setAlpha(0.13)

        let bezier28Path = UIBezierPath()
        bezier28Path.move(to: CGPoint(x: 130.41, y: 149.84))
        bezier28Path.addCurve(to: CGPoint(x: 139.31, y: 136.59), controlPoint1: CGPoint(x: 170.05, y: 129), controlPoint2: CGPoint(x: 134.99, y: 181.17))
        bezier28Path.addCurve(to: CGPoint(x: 154.98, y: 133.52), controlPoint1: CGPoint(x: 182.08, y: 149.88), controlPoint2: CGPoint(x: 120.4, y: 161.99))
        bezier28Path.addCurve(to: CGPoint(x: 168.22, y: 142.42), controlPoint1: CGPoint(x: 175.82, y: 173.16), controlPoint2: CGPoint(x: 123.65, y: 138.1))
        bezier28Path.addCurve(to: CGPoint(x: 171.3, y: 158.09), controlPoint1: CGPoint(x: 154.93, y: 185.19), controlPoint2: CGPoint(x: 142.83, y: 123.51))
        bezier28Path.addCurve(to: CGPoint(x: 162.4, y: 171.33), controlPoint1: CGPoint(x: 131.66, y: 178.93), controlPoint2: CGPoint(x: 166.72, y: 126.76))
        bezier28Path.addCurve(to: CGPoint(x: 146.73, y: 174.41), controlPoint1: CGPoint(x: 119.63, y: 158.04), controlPoint2: CGPoint(x: 181.31, y: 145.94))
        bezier28Path.addCurve(to: CGPoint(x: 133.48, y: 165.5), controlPoint1: CGPoint(x: 125.89, y: 134.77), controlPoint2: CGPoint(x: 178.06, y: 169.83))
        bezier28Path.addCurve(to: CGPoint(x: 130.41, y: 149.84), controlPoint1: CGPoint(x: 146.77, y: 122.74), controlPoint2: CGPoint(x: 158.88, y: 184.42))
        bezier28Path.close()
        strokeColor.setStroke()
        bezier28Path.lineWidth = 1
        bezier28Path.stroke()

        context.restoreGState()


        //// Bezier 29 Drawing
        context.saveGState()
        context.setAlpha(0.14)

        let bezier29Path = UIBezierPath()
        bezier29Path.move(to: CGPoint(x: 129.46, y: 149.38))
        bezier29Path.addCurve(to: CGPoint(x: 138.94, y: 135.58), controlPoint1: CGPoint(x: 171.26, y: 127.96), controlPoint2: CGPoint(x: 133.92, y: 182.28))
        bezier29Path.addCurve(to: CGPoint(x: 155.4, y: 132.53), controlPoint1: CGPoint(x: 183.65, y: 149.99), controlPoint2: CGPoint(x: 118.83, y: 162))
        bezier29Path.addCurve(to: CGPoint(x: 169.2, y: 142.01), controlPoint1: CGPoint(x: 176.82, y: 174.33), controlPoint2: CGPoint(x: 122.5, y: 136.99))
        bezier29Path.addCurve(to: CGPoint(x: 172.25, y: 158.47), controlPoint1: CGPoint(x: 154.79, y: 186.72), controlPoint2: CGPoint(x: 142.77, y: 121.9))
        bezier29Path.addCurve(to: CGPoint(x: 162.76, y: 172.27), controlPoint1: CGPoint(x: 130.45, y: 179.9), controlPoint2: CGPoint(x: 167.79, y: 125.57))
        bezier29Path.addCurve(to: CGPoint(x: 146.31, y: 175.32), controlPoint1: CGPoint(x: 118.06, y: 157.86), controlPoint2: CGPoint(x: 182.88, y: 145.85))
        bezier29Path.addCurve(to: CGPoint(x: 132.51, y: 165.84), controlPoint1: CGPoint(x: 124.88, y: 133.52), controlPoint2: CGPoint(x: 179.21, y: 170.86))
        bezier29Path.addCurve(to: CGPoint(x: 129.46, y: 149.38), controlPoint1: CGPoint(x: 146.92, y: 121.13), controlPoint2: CGPoint(x: 158.93, y: 185.95))
        bezier29Path.close()
        strokeColor.setStroke()
        bezier29Path.lineWidth = 1
        bezier29Path.stroke()

        context.restoreGState()


        //// Bezier 30 Drawing
        context.saveGState()
        context.setAlpha(0.15)

        let bezier30Path = UIBezierPath()
        bezier30Path.move(to: CGPoint(x: 128.51, y: 148.9))
        bezier30Path.addCurve(to: CGPoint(x: 138.59, y: 134.56), controlPoint1: CGPoint(x: 172.49, y: 126.94), controlPoint2: CGPoint(x: 132.82, y: 183.38))
        bezier30Path.addCurve(to: CGPoint(x: 155.84, y: 131.55), controlPoint1: CGPoint(x: 185.21, y: 150.13), controlPoint2: CGPoint(x: 117.25, y: 161.99))
        bezier30Path.addCurve(to: CGPoint(x: 170.18, y: 141.62), controlPoint1: CGPoint(x: 177.8, y: 175.53), controlPoint2: CGPoint(x: 121.36, y: 135.86))
        bezier30Path.addCurve(to: CGPoint(x: 173.19, y: 158.88), controlPoint1: CGPoint(x: 154.61, y: 188.25), controlPoint2: CGPoint(x: 142.75, y: 120.29))
        bezier30Path.addCurve(to: CGPoint(x: 163.12, y: 173.21), controlPoint1: CGPoint(x: 129.21, y: 180.84), controlPoint2: CGPoint(x: 168.88, y: 124.4))
        bezier30Path.addCurve(to: CGPoint(x: 145.86, y: 176.23), controlPoint1: CGPoint(x: 116.49, y: 157.65), controlPoint2: CGPoint(x: 184.45, y: 145.79))
        bezier30Path.addCurve(to: CGPoint(x: 131.53, y: 166.15), controlPoint1: CGPoint(x: 123.9, y: 132.25), controlPoint2: CGPoint(x: 180.34, y: 171.92))
        bezier30Path.addCurve(to: CGPoint(x: 128.51, y: 148.9), controlPoint1: CGPoint(x: 147.09, y: 119.53), controlPoint2: CGPoint(x: 158.95, y: 187.49))
        bezier30Path.close()
        strokeColor.setStroke()
        bezier30Path.lineWidth = 1
        bezier30Path.stroke()

        context.restoreGState()


        //// Bezier 31 Drawing
        context.saveGState()
        context.setAlpha(0.15)

        let bezier31Path = UIBezierPath()
        bezier31Path.move(to: CGPoint(x: 127.58, y: 148.39))
        bezier31Path.addCurve(to: CGPoint(x: 138.25, y: 133.53), controlPoint1: CGPoint(x: 173.74, y: 125.94), controlPoint2: CGPoint(x: 131.7, y: 184.45))
        bezier31Path.addCurve(to: CGPoint(x: 156.31, y: 130.58), controlPoint1: CGPoint(x: 186.77, y: 150.3), controlPoint2: CGPoint(x: 115.67, y: 161.95))
        bezier31Path.addCurve(to: CGPoint(x: 171.17, y: 141.25), controlPoint1: CGPoint(x: 178.76, y: 176.74), controlPoint2: CGPoint(x: 120.25, y: 134.7))
        bezier31Path.addCurve(to: CGPoint(x: 174.12, y: 159.31), controlPoint1: CGPoint(x: 154.4, y: 189.77), controlPoint2: CGPoint(x: 142.76, y: 118.67))
        bezier31Path.addCurve(to: CGPoint(x: 163.45, y: 174.17), controlPoint1: CGPoint(x: 127.96, y: 181.76), controlPoint2: CGPoint(x: 170, y: 123.25))
        bezier31Path.addCurve(to: CGPoint(x: 145.39, y: 177.12), controlPoint1: CGPoint(x: 114.93, y: 157.4), controlPoint2: CGPoint(x: 186.03, y: 145.76))
        bezier31Path.addCurve(to: CGPoint(x: 130.53, y: 166.45), controlPoint1: CGPoint(x: 122.94, y: 130.96), controlPoint2: CGPoint(x: 181.45, y: 173))
        bezier31Path.addCurve(to: CGPoint(x: 127.58, y: 148.39), controlPoint1: CGPoint(x: 147.3, y: 117.93), controlPoint2: CGPoint(x: 158.95, y: 189.03))
        bezier31Path.close()
        strokeColor.setStroke()
        bezier31Path.lineWidth = 1
        bezier31Path.stroke()

        context.restoreGState()


        //// Bezier 32 Drawing
        context.saveGState()
        context.setAlpha(0.16)

        let bezier32Path = UIBezierPath()
        bezier32Path.move(to: CGPoint(x: 126.65, y: 147.87))
        bezier32Path.addCurve(to: CGPoint(x: 137.94, y: 132.5), controlPoint1: CGPoint(x: 175.02, y: 124.97), controlPoint2: CGPoint(x: 130.55, y: 185.5))
        bezier32Path.addCurve(to: CGPoint(x: 156.8, y: 129.61), controlPoint1: CGPoint(x: 188.34, y: 150.51), controlPoint2: CGPoint(x: 114.09, y: 161.87))
        bezier32Path.addCurve(to: CGPoint(x: 172.17, y: 140.9), controlPoint1: CGPoint(x: 179.7, y: 177.98), controlPoint2: CGPoint(x: 119.16, y: 133.51))
        bezier32Path.addCurve(to: CGPoint(x: 175.05, y: 159.76), controlPoint1: CGPoint(x: 154.16, y: 191.3), controlPoint2: CGPoint(x: 142.8, y: 117.05))
        bezier32Path.addCurve(to: CGPoint(x: 163.76, y: 175.13), controlPoint1: CGPoint(x: 126.68, y: 182.66), controlPoint2: CGPoint(x: 171.15, y: 122.12))
        bezier32Path.addCurve(to: CGPoint(x: 144.91, y: 178.02), controlPoint1: CGPoint(x: 113.36, y: 157.12), controlPoint2: CGPoint(x: 187.61, y: 145.76))
        bezier32Path.addCurve(to: CGPoint(x: 129.53, y: 166.72), controlPoint1: CGPoint(x: 122, y: 129.65), controlPoint2: CGPoint(x: 182.54, y: 174.11))
        bezier32Path.addCurve(to: CGPoint(x: 126.65, y: 147.87), controlPoint1: CGPoint(x: 147.54, y: 116.33), controlPoint2: CGPoint(x: 158.9, y: 190.58))
        bezier32Path.close()
        strokeColor.setStroke()
        bezier32Path.lineWidth = 1
        bezier32Path.stroke()

        context.restoreGState()


        //// Bezier 33 Drawing
        context.saveGState()
        context.setAlpha(0.17)

        let bezier33Path = UIBezierPath()
        bezier33Path.move(to: CGPoint(x: 125.73, y: 147.33))
        bezier33Path.addCurve(to: CGPoint(x: 137.65, y: 131.45), controlPoint1: CGPoint(x: 176.32, y: 124.02), controlPoint2: CGPoint(x: 129.38, y: 186.54))
        bezier33Path.addCurve(to: CGPoint(x: 157.3, y: 128.65), controlPoint1: CGPoint(x: 189.9, y: 150.74), controlPoint2: CGPoint(x: 112.5, y: 161.76))
        bezier33Path.addCurve(to: CGPoint(x: 173.18, y: 140.57), controlPoint1: CGPoint(x: 180.61, y: 179.24), controlPoint2: CGPoint(x: 118.09, y: 132.31))
        bezier33Path.addCurve(to: CGPoint(x: 175.97, y: 160.23), controlPoint1: CGPoint(x: 153.89, y: 192.83), controlPoint2: CGPoint(x: 142.87, y: 115.43))
        bezier33Path.addCurve(to: CGPoint(x: 164.06, y: 176.1), controlPoint1: CGPoint(x: 125.38, y: 183.54), controlPoint2: CGPoint(x: 172.32, y: 121.02))
        bezier33Path.addCurve(to: CGPoint(x: 144.4, y: 178.9), controlPoint1: CGPoint(x: 111.8, y: 156.81), controlPoint2: CGPoint(x: 189.2, y: 145.8))
        bezier33Path.addCurve(to: CGPoint(x: 128.53, y: 166.98), controlPoint1: CGPoint(x: 121.09, y: 128.31), controlPoint2: CGPoint(x: 183.61, y: 175.25))
        bezier33Path.addCurve(to: CGPoint(x: 125.73, y: 147.33), controlPoint1: CGPoint(x: 147.82, y: 114.73), controlPoint2: CGPoint(x: 158.83, y: 192.12))
        bezier33Path.close()
        strokeColor.setStroke()
        bezier33Path.lineWidth = 1
        bezier33Path.stroke()

        context.restoreGState()


        //// Bezier 34 Drawing
        context.saveGState()
        context.setAlpha(0.17)

        let bezier34Path = UIBezierPath()
        bezier34Path.move(to: CGPoint(x: 124.82, y: 146.76))
        bezier34Path.addCurve(to: CGPoint(x: 137.38, y: 130.4), controlPoint1: CGPoint(x: 177.64, y: 123.09), controlPoint2: CGPoint(x: 128.18, y: 187.55))
        bezier34Path.addCurve(to: CGPoint(x: 157.83, y: 127.7), controlPoint1: CGPoint(x: 191.46, y: 151.01), controlPoint2: CGPoint(x: 110.92, y: 161.62))
        bezier34Path.addCurve(to: CGPoint(x: 174.2, y: 140.26), controlPoint1: CGPoint(x: 181.5, y: 180.53), controlPoint2: CGPoint(x: 117.05, y: 131.07))
        bezier34Path.addCurve(to: CGPoint(x: 176.89, y: 160.72), controlPoint1: CGPoint(x: 153.58, y: 194.35), controlPoint2: CGPoint(x: 142.98, y: 113.81))
        bezier34Path.addCurve(to: CGPoint(x: 164.33, y: 177.08), controlPoint1: CGPoint(x: 124.06, y: 184.39), controlPoint2: CGPoint(x: 173.52, y: 119.93))
        bezier34Path.addCurve(to: CGPoint(x: 143.88, y: 179.78), controlPoint1: CGPoint(x: 110.24, y: 156.47), controlPoint2: CGPoint(x: 190.79, y: 145.86))
        bezier34Path.addCurve(to: CGPoint(x: 127.51, y: 167.22), controlPoint1: CGPoint(x: 120.21, y: 126.95), controlPoint2: CGPoint(x: 184.66, y: 176.41))
        bezier34Path.addCurve(to: CGPoint(x: 124.82, y: 146.76), controlPoint1: CGPoint(x: 148.12, y: 113.13), controlPoint2: CGPoint(x: 158.73, y: 193.68))
        bezier34Path.close()
        strokeColor.setStroke()
        bezier34Path.lineWidth = 1
        bezier34Path.stroke()

        context.restoreGState()


        //// Bezier 35 Drawing
        context.saveGState()
        context.setAlpha(0.18)

        let bezier35Path = UIBezierPath()
        bezier35Path.move(to: CGPoint(x: 123.91, y: 146.18))
        bezier35Path.addCurve(to: CGPoint(x: 137.12, y: 129.34), controlPoint1: CGPoint(x: 178.98, y: 122.2), controlPoint2: CGPoint(x: 126.96, y: 188.54))
        bezier35Path.addCurve(to: CGPoint(x: 158.38, y: 126.76), controlPoint1: CGPoint(x: 193.02, y: 151.32), controlPoint2: CGPoint(x: 109.33, y: 161.44))
        bezier35Path.addCurve(to: CGPoint(x: 175.22, y: 139.97), controlPoint1: CGPoint(x: 182.36, y: 181.83), controlPoint2: CGPoint(x: 116.02, y: 129.81))
        bezier35Path.addCurve(to: CGPoint(x: 177.79, y: 161.23), controlPoint1: CGPoint(x: 153.24, y: 195.88), controlPoint2: CGPoint(x: 143.11, y: 112.18))
        bezier35Path.addCurve(to: CGPoint(x: 164.58, y: 178.07), controlPoint1: CGPoint(x: 122.72, y: 185.21), controlPoint2: CGPoint(x: 174.74, y: 118.87))
        bezier35Path.addCurve(to: CGPoint(x: 143.33, y: 180.64), controlPoint1: CGPoint(x: 108.68, y: 156.09), controlPoint2: CGPoint(x: 192.38, y: 145.97))
        bezier35Path.addCurve(to: CGPoint(x: 126.49, y: 167.44), controlPoint1: CGPoint(x: 119.34, y: 125.57), controlPoint2: CGPoint(x: 185.69, y: 177.59))
        bezier35Path.addCurve(to: CGPoint(x: 123.91, y: 146.18), controlPoint1: CGPoint(x: 148.46, y: 111.53), controlPoint2: CGPoint(x: 158.59, y: 195.23))
        bezier35Path.close()
        strokeColor.setStroke()
        bezier35Path.lineWidth = 1
        bezier35Path.stroke()

        context.restoreGState()


        //// Bezier 36 Drawing
        context.saveGState()
        context.setAlpha(0.19)

        let bezier36Path = UIBezierPath()
        bezier36Path.move(to: CGPoint(x: 123.02, y: 145.58))
        bezier36Path.addCurve(to: CGPoint(x: 136.89, y: 128.27), controlPoint1: CGPoint(x: 180.35, y: 121.32), controlPoint2: CGPoint(x: 125.72, y: 189.51))
        bezier36Path.addCurve(to: CGPoint(x: 158.94, y: 125.83), controlPoint1: CGPoint(x: 194.58, y: 151.65), controlPoint2: CGPoint(x: 107.74, y: 161.24))
        bezier36Path.addCurve(to: CGPoint(x: 176.26, y: 139.7), controlPoint1: CGPoint(x: 183.2, y: 183.16), controlPoint2: CGPoint(x: 115.02, y: 128.53))
        bezier36Path.addCurve(to: CGPoint(x: 178.69, y: 161.76), controlPoint1: CGPoint(x: 152.87, y: 197.4), controlPoint2: CGPoint(x: 143.29, y: 110.55))
        bezier36Path.addCurve(to: CGPoint(x: 164.82, y: 179.07), controlPoint1: CGPoint(x: 121.36, y: 186.02), controlPoint2: CGPoint(x: 175.99, y: 117.83))
        bezier36Path.addCurve(to: CGPoint(x: 142.77, y: 181.5), controlPoint1: CGPoint(x: 107.13, y: 155.69), controlPoint2: CGPoint(x: 193.97, y: 146.1))
        bezier36Path.addCurve(to: CGPoint(x: 125.45, y: 167.63), controlPoint1: CGPoint(x: 118.51, y: 124.18), controlPoint2: CGPoint(x: 186.69, y: 178.8))
        bezier36Path.addCurve(to: CGPoint(x: 123.02, y: 145.58), controlPoint1: CGPoint(x: 148.84, y: 109.94), controlPoint2: CGPoint(x: 158.42, y: 196.78))
        bezier36Path.close()
        strokeColor.setStroke()
        bezier36Path.lineWidth = 1
        bezier36Path.stroke()

        context.restoreGState()


        //// Bezier 37 Drawing
        context.saveGState()
        context.setAlpha(0.19)

        let bezier37Path = UIBezierPath()
        bezier37Path.move(to: CGPoint(x: 122.13, y: 144.96))
        bezier37Path.addCurve(to: CGPoint(x: 136.68, y: 127.19), controlPoint1: CGPoint(x: 181.73, y: 120.47), controlPoint2: CGPoint(x: 124.45, y: 190.45))
        bezier37Path.addCurve(to: CGPoint(x: 159.53, y: 124.91), controlPoint1: CGPoint(x: 196.14, y: 152.02), controlPoint2: CGPoint(x: 106.15, y: 161))
        bezier37Path.addCurve(to: CGPoint(x: 177.3, y: 139.45), controlPoint1: CGPoint(x: 184.02, y: 184.51), controlPoint2: CGPoint(x: 114.04, y: 127.23))
        bezier37Path.addCurve(to: CGPoint(x: 179.58, y: 162.3), controlPoint1: CGPoint(x: 152.47, y: 198.91), controlPoint2: CGPoint(x: 143.49, y: 108.93))
        bezier37Path.addCurve(to: CGPoint(x: 165.04, y: 180.08), controlPoint1: CGPoint(x: 119.98, y: 186.79), controlPoint2: CGPoint(x: 177.26, y: 116.81))
        bezier37Path.addCurve(to: CGPoint(x: 142.19, y: 182.36), controlPoint1: CGPoint(x: 105.58, y: 155.25), controlPoint2: CGPoint(x: 195.56, y: 146.27))
        bezier37Path.addCurve(to: CGPoint(x: 124.42, y: 167.81), controlPoint1: CGPoint(x: 117.7, y: 122.76), controlPoint2: CGPoint(x: 187.68, y: 180.04))
        bezier37Path.addCurve(to: CGPoint(x: 122.13, y: 144.96), controlPoint1: CGPoint(x: 149.24, y: 108.35), controlPoint2: CGPoint(x: 158.22, y: 198.34))
        bezier37Path.close()
        strokeColor.setStroke()
        bezier37Path.lineWidth = 1
        bezier37Path.stroke()

        context.restoreGState()


        //// Bezier 38 Drawing
        context.saveGState()
        context.setAlpha(0.2)

        let bezier38Path = UIBezierPath()
        bezier38Path.move(to: CGPoint(x: 121.26, y: 144.32))
        bezier38Path.addCurve(to: CGPoint(x: 136.49, y: 126.11), controlPoint1: CGPoint(x: 183.14, y: 119.65), controlPoint2: CGPoint(x: 123.17, y: 191.38))
        bezier38Path.addCurve(to: CGPoint(x: 160.14, y: 124), controlPoint1: CGPoint(x: 197.69, y: 152.42), controlPoint2: CGPoint(x: 104.56, y: 160.73))
        bezier38Path.addCurve(to: CGPoint(x: 178.35, y: 139.22), controlPoint1: CGPoint(x: 184.81, y: 185.88), controlPoint2: CGPoint(x: 113.08, y: 125.9))
        bezier38Path.addCurve(to: CGPoint(x: 180.46, y: 162.87), controlPoint1: CGPoint(x: 152.04, y: 200.43), controlPoint2: CGPoint(x: 143.73, y: 107.3))
        bezier38Path.addCurve(to: CGPoint(x: 165.23, y: 181.09), controlPoint1: CGPoint(x: 118.58, y: 187.54), controlPoint2: CGPoint(x: 178.56, y: 115.82))
        bezier38Path.addCurve(to: CGPoint(x: 141.58, y: 183.2), controlPoint1: CGPoint(x: 104.03, y: 154.78), controlPoint2: CGPoint(x: 197.16, y: 146.46))
        bezier38Path.addCurve(to: CGPoint(x: 123.37, y: 167.97), controlPoint1: CGPoint(x: 116.91, y: 121.32), controlPoint2: CGPoint(x: 188.64, y: 181.29))
        bezier38Path.addCurve(to: CGPoint(x: 121.26, y: 144.32), controlPoint1: CGPoint(x: 149.68, y: 106.77), controlPoint2: CGPoint(x: 157.99, y: 199.89))
        bezier38Path.close()
        strokeColor.setStroke()
        bezier38Path.lineWidth = 1
        bezier38Path.stroke()

        context.restoreGState()


        //// Bezier 39 Drawing
        context.saveGState()
        context.setAlpha(0.21)

        let bezier39Path = UIBezierPath()
        bezier39Path.move(to: CGPoint(x: 120.39, y: 143.66))
        bezier39Path.addCurve(to: CGPoint(x: 136.32, y: 125.02), controlPoint1: CGPoint(x: 184.57, y: 118.85), controlPoint2: CGPoint(x: 121.85, y: 192.28))
        bezier39Path.addCurve(to: CGPoint(x: 160.76, y: 123.09), controlPoint1: CGPoint(x: 199.24, y: 152.85), controlPoint2: CGPoint(x: 102.97, y: 160.43))
        bezier39Path.addCurve(to: CGPoint(x: 179.41, y: 139.02), controlPoint1: CGPoint(x: 185.57, y: 187.26), controlPoint2: CGPoint(x: 112.15, y: 124.55))
        bezier39Path.addCurve(to: CGPoint(x: 181.33, y: 163.46), controlPoint1: CGPoint(x: 151.58, y: 201.94), controlPoint2: CGPoint(x: 144, y: 105.67))
        bezier39Path.addCurve(to: CGPoint(x: 165.41, y: 182.11), controlPoint1: CGPoint(x: 117.16, y: 188.27), controlPoint2: CGPoint(x: 179.87, y: 114.84))
        bezier39Path.addCurve(to: CGPoint(x: 140.96, y: 184.03), controlPoint1: CGPoint(x: 102.49, y: 154.27), controlPoint2: CGPoint(x: 198.75, y: 146.7))
        bezier39Path.addCurve(to: CGPoint(x: 122.32, y: 168.11), controlPoint1: CGPoint(x: 116.15, y: 119.86), controlPoint2: CGPoint(x: 189.58, y: 182.57))
        bezier39Path.addCurve(to: CGPoint(x: 120.39, y: 143.66), controlPoint1: CGPoint(x: 150.15, y: 105.19), controlPoint2: CGPoint(x: 157.73, y: 201.45))
        bezier39Path.close()
        strokeColor.setStroke()
        bezier39Path.lineWidth = 1
        bezier39Path.stroke()

        context.restoreGState()


        //// Bezier 40 Drawing
        context.saveGState()
        context.setAlpha(0.21)

        let bezier40Path = UIBezierPath()
        bezier40Path.move(to: CGPoint(x: 119.54, y: 142.98))
        bezier40Path.addCurve(to: CGPoint(x: 136.17, y: 123.92), controlPoint1: CGPoint(x: 186.01, y: 118.08), controlPoint2: CGPoint(x: 120.52, y: 193.16))
        bezier40Path.addCurve(to: CGPoint(x: 161.41, y: 122.2), controlPoint1: CGPoint(x: 200.78, y: 153.31), controlPoint2: CGPoint(x: 101.39, y: 160.09))
        bezier40Path.addCurve(to: CGPoint(x: 180.47, y: 138.83), controlPoint1: CGPoint(x: 186.31, y: 188.67), controlPoint2: CGPoint(x: 111.24, y: 123.18))
        bezier40Path.addCurve(to: CGPoint(x: 182.19, y: 164.07), controlPoint1: CGPoint(x: 151.08, y: 203.44), controlPoint2: CGPoint(x: 144.3, y: 104.05))
        bezier40Path.addCurve(to: CGPoint(x: 165.56, y: 183.13), controlPoint1: CGPoint(x: 115.72, y: 188.97), controlPoint2: CGPoint(x: 181.21, y: 113.9))
        bezier40Path.addCurve(to: CGPoint(x: 140.32, y: 184.85), controlPoint1: CGPoint(x: 100.95, y: 153.74), controlPoint2: CGPoint(x: 200.35, y: 146.96))
        bezier40Path.addCurve(to: CGPoint(x: 121.26, y: 168.22), controlPoint1: CGPoint(x: 115.42, y: 118.38), controlPoint2: CGPoint(x: 190.5, y: 183.87))
        bezier40Path.addCurve(to: CGPoint(x: 119.54, y: 142.98), controlPoint1: CGPoint(x: 150.66, y: 103.61), controlPoint2: CGPoint(x: 157.43, y: 203.01))
        bezier40Path.close()
        strokeColor.setStroke()
        bezier40Path.lineWidth = 1
        bezier40Path.stroke()

        context.restoreGState()


        //// Bezier 41 Drawing
        context.saveGState()
        context.setAlpha(0.22)

        let bezier41Path = UIBezierPath()
        bezier41Path.move(to: CGPoint(x: 118.7, y: 142.29))
        bezier41Path.addCurve(to: CGPoint(x: 136.04, y: 122.82), controlPoint1: CGPoint(x: 187.48, y: 117.34), controlPoint2: CGPoint(x: 119.17, y: 194.01))
        bezier41Path.addCurve(to: CGPoint(x: 162.08, y: 121.32), controlPoint1: CGPoint(x: 202.32, y: 153.81), controlPoint2: CGPoint(x: 99.8, y: 159.72))
        bezier41Path.addCurve(to: CGPoint(x: 181.55, y: 138.66), controlPoint1: CGPoint(x: 187.02, y: 190.1), controlPoint2: CGPoint(x: 110.35, y: 121.79))
        bezier41Path.addCurve(to: CGPoint(x: 183.05, y: 164.7), controlPoint1: CGPoint(x: 150.55, y: 204.94), controlPoint2: CGPoint(x: 144.64, y: 102.42))
        bezier41Path.addCurve(to: CGPoint(x: 165.7, y: 184.17), controlPoint1: CGPoint(x: 114.27, y: 189.64), controlPoint2: CGPoint(x: 182.58, y: 112.97))
        bezier41Path.addCurve(to: CGPoint(x: 139.67, y: 185.67), controlPoint1: CGPoint(x: 99.42, y: 153.17), controlPoint2: CGPoint(x: 201.94, y: 147.26))
        bezier41Path.addCurve(to: CGPoint(x: 120.2, y: 168.32), controlPoint1: CGPoint(x: 114.72, y: 116.89), controlPoint2: CGPoint(x: 191.39, y: 185.2))
        bezier41Path.addCurve(to: CGPoint(x: 118.7, y: 142.29), controlPoint1: CGPoint(x: 151.19, y: 102.04), controlPoint2: CGPoint(x: 157.1, y: 204.56))
        bezier41Path.close()
        strokeColor.setStroke()
        bezier41Path.lineWidth = 1
        bezier41Path.stroke()

        context.restoreGState()


        //// Bezier 42 Drawing
        context.saveGState()
        context.setAlpha(0.22)

        let bezier42Path = UIBezierPath()
        bezier42Path.move(to: CGPoint(x: 117.86, y: 141.57))
        bezier42Path.addCurve(to: CGPoint(x: 135.94, y: 121.71), controlPoint1: CGPoint(x: 188.96, y: 116.62), controlPoint2: CGPoint(x: 117.79, y: 194.84))
        bezier42Path.addCurve(to: CGPoint(x: 162.76, y: 120.44), controlPoint1: CGPoint(x: 203.85, y: 154.34), controlPoint2: CGPoint(x: 98.22, y: 159.32))
        bezier42Path.addCurve(to: CGPoint(x: 182.62, y: 138.52), controlPoint1: CGPoint(x: 187.71, y: 191.54), controlPoint2: CGPoint(x: 109.49, y: 120.37))
        bezier42Path.addCurve(to: CGPoint(x: 183.89, y: 165.34), controlPoint1: CGPoint(x: 149.99, y: 206.43), controlPoint2: CGPoint(x: 145.01, y: 100.8))
        bezier42Path.addCurve(to: CGPoint(x: 165.82, y: 185.2), controlPoint1: CGPoint(x: 112.79, y: 190.29), controlPoint2: CGPoint(x: 183.96, y: 112.07))
        bezier42Path.addCurve(to: CGPoint(x: 138.99, y: 186.47), controlPoint1: CGPoint(x: 97.9, y: 152.57), controlPoint2: CGPoint(x: 203.53, y: 147.59))
        bezier42Path.addCurve(to: CGPoint(x: 119.13, y: 168.4), controlPoint1: CGPoint(x: 114.04, y: 115.37), controlPoint2: CGPoint(x: 192.26, y: 186.54))
        bezier42Path.addCurve(to: CGPoint(x: 117.86, y: 141.57), controlPoint1: CGPoint(x: 151.76, y: 100.48), controlPoint2: CGPoint(x: 156.74, y: 206.12))
        bezier42Path.close()
        strokeColor.setStroke()
        bezier42Path.lineWidth = 1
        bezier42Path.stroke()

        context.restoreGState()


        //// Bezier 43 Drawing
        context.saveGState()
        context.setAlpha(0.23)

        let bezier43Path = UIBezierPath()
        bezier43Path.move(to: CGPoint(x: 117.04, y: 140.84))
        bezier43Path.addCurve(to: CGPoint(x: 135.85, y: 120.6), controlPoint1: CGPoint(x: 190.47, y: 115.93), controlPoint2: CGPoint(x: 116.39, y: 195.65))
        bezier43Path.addCurve(to: CGPoint(x: 163.47, y: 119.58), controlPoint1: CGPoint(x: 205.38, y: 154.9), controlPoint2: CGPoint(x: 96.64, y: 158.89))
        bezier43Path.addCurve(to: CGPoint(x: 183.71, y: 138.39), controlPoint1: CGPoint(x: 188.37, y: 193.01), controlPoint2: CGPoint(x: 108.66, y: 118.93))
        bezier43Path.addCurve(to: CGPoint(x: 184.72, y: 166.01), controlPoint1: CGPoint(x: 149.4, y: 207.92), controlPoint2: CGPoint(x: 145.41, y: 99.18))
        bezier43Path.addCurve(to: CGPoint(x: 165.91, y: 186.25), controlPoint1: CGPoint(x: 111.3, y: 190.91), controlPoint2: CGPoint(x: 185.37, y: 111.2))
        bezier43Path.addCurve(to: CGPoint(x: 138.3, y: 187.26), controlPoint1: CGPoint(x: 96.38, y: 151.94), controlPoint2: CGPoint(x: 205.13, y: 147.95))
        bezier43Path.addCurve(to: CGPoint(x: 118.05, y: 168.45), controlPoint1: CGPoint(x: 113.39, y: 113.84), controlPoint2: CGPoint(x: 193.1, y: 187.91))
        bezier43Path.addCurve(to: CGPoint(x: 117.04, y: 140.84), controlPoint1: CGPoint(x: 152.36, y: 98.92), controlPoint2: CGPoint(x: 156.35, y: 207.67))
        bezier43Path.close()
        strokeColor.setStroke()
        bezier43Path.lineWidth = 1
        bezier43Path.stroke()

        context.restoreGState()


        //// Bezier 44 Drawing
        context.saveGState()
        context.setAlpha(0.24)

        let bezier44Path = UIBezierPath()
        bezier44Path.move(to: CGPoint(x: 116.23, y: 140.09))
        bezier44Path.addCurve(to: CGPoint(x: 135.79, y: 119.48), controlPoint1: CGPoint(x: 191.99, y: 115.27), controlPoint2: CGPoint(x: 114.97, y: 196.43))
        bezier44Path.addCurve(to: CGPoint(x: 164.19, y: 118.73), controlPoint1: CGPoint(x: 206.9, y: 155.5), controlPoint2: CGPoint(x: 95.06, y: 158.43))
        bezier44Path.addCurve(to: CGPoint(x: 184.8, y: 138.29), controlPoint1: CGPoint(x: 189, y: 194.49), controlPoint2: CGPoint(x: 107.85, y: 117.48))
        bezier44Path.addCurve(to: CGPoint(x: 185.54, y: 166.69), controlPoint1: CGPoint(x: 148.78, y: 209.4), controlPoint2: CGPoint(x: 145.85, y: 97.56))
        bezier44Path.addCurve(to: CGPoint(x: 165.98, y: 187.3), controlPoint1: CGPoint(x: 109.79, y: 191.51), controlPoint2: CGPoint(x: 186.8, y: 110.35))
        bezier44Path.addCurve(to: CGPoint(x: 137.58, y: 188.04), controlPoint1: CGPoint(x: 94.87, y: 151.28), controlPoint2: CGPoint(x: 206.71, y: 148.35))
        bezier44Path.addCurve(to: CGPoint(x: 116.98, y: 168.49), controlPoint1: CGPoint(x: 112.77, y: 112.29), controlPoint2: CGPoint(x: 193.93, y: 189.3))
        bezier44Path.addCurve(to: CGPoint(x: 116.23, y: 140.09), controlPoint1: CGPoint(x: 153, y: 97.37), controlPoint2: CGPoint(x: 155.92, y: 209.22))
        bezier44Path.close()
        strokeColor.setStroke()
        bezier44Path.lineWidth = 1
        bezier44Path.stroke()

        context.restoreGState()


        //// Bezier 45 Drawing
        context.saveGState()
        context.setAlpha(0.24)

        let bezier45Path = UIBezierPath()
        bezier45Path.move(to: CGPoint(x: 115.43, y: 139.32))
        bezier45Path.addCurve(to: CGPoint(x: 135.75, y: 118.36), controlPoint1: CGPoint(x: 193.53, y: 114.64), controlPoint2: CGPoint(x: 113.53, y: 197.18))
        bezier45Path.addCurve(to: CGPoint(x: 164.93, y: 117.9), controlPoint1: CGPoint(x: 208.42, y: 156.13), controlPoint2: CGPoint(x: 93.48, y: 157.93))
        bezier45Path.addCurve(to: CGPoint(x: 185.89, y: 138.21), controlPoint1: CGPoint(x: 189.61, y: 195.99), controlPoint2: CGPoint(x: 107.06, y: 116))
        bezier45Path.addCurve(to: CGPoint(x: 186.35, y: 167.39), controlPoint1: CGPoint(x: 148.12, y: 210.88), controlPoint2: CGPoint(x: 146.32, y: 95.95))
        bezier45Path.addCurve(to: CGPoint(x: 166.04, y: 188.36), controlPoint1: CGPoint(x: 108.26, y: 192.07), controlPoint2: CGPoint(x: 188.25, y: 109.53))
        bezier45Path.addCurve(to: CGPoint(x: 136.85, y: 188.81), controlPoint1: CGPoint(x: 93.37, y: 150.58), controlPoint2: CGPoint(x: 208.3, y: 148.78))
        bezier45Path.addCurve(to: CGPoint(x: 115.89, y: 168.5), controlPoint1: CGPoint(x: 112.18, y: 110.72), controlPoint2: CGPoint(x: 194.72, y: 190.71))
        bezier45Path.addCurve(to: CGPoint(x: 115.43, y: 139.32), controlPoint1: CGPoint(x: 153.66, y: 95.83), controlPoint2: CGPoint(x: 155.47, y: 210.76))
        bezier45Path.close()
        strokeColor.setStroke()
        bezier45Path.lineWidth = 1
        bezier45Path.stroke()

        context.restoreGState()


        //// Bezier 46 Drawing
        context.saveGState()
        context.setAlpha(0.25)

        let bezier46Path = UIBezierPath()
        bezier46Path.move(to: CGPoint(x: 114.65, y: 138.53))
        bezier46Path.addCurve(to: CGPoint(x: 135.73, y: 117.23), controlPoint1: CGPoint(x: 195.08, y: 114.03), controlPoint2: CGPoint(x: 112.08, y: 197.92))
        bezier46Path.addCurve(to: CGPoint(x: 165.69, y: 117.07), controlPoint1: CGPoint(x: 209.92, y: 156.78), controlPoint2: CGPoint(x: 91.91, y: 157.4))
        bezier46Path.addCurve(to: CGPoint(x: 186.99, y: 138.15), controlPoint1: CGPoint(x: 190.19, y: 197.51), controlPoint2: CGPoint(x: 106.31, y: 114.5))
        bezier46Path.addCurve(to: CGPoint(x: 187.15, y: 168.12), controlPoint1: CGPoint(x: 147.44, y: 212.35), controlPoint2: CGPoint(x: 146.82, y: 94.34))
        bezier46Path.addCurve(to: CGPoint(x: 166.07, y: 189.42), controlPoint1: CGPoint(x: 106.71, y: 192.61), controlPoint2: CGPoint(x: 189.72, y: 108.73))
        bezier46Path.addCurve(to: CGPoint(x: 136.1, y: 189.57), controlPoint1: CGPoint(x: 91.87, y: 149.86), controlPoint2: CGPoint(x: 209.88, y: 149.24))
        bezier46Path.addCurve(to: CGPoint(x: 114.8, y: 168.49), controlPoint1: CGPoint(x: 111.61, y: 109.14), controlPoint2: CGPoint(x: 195.49, y: 192.14))
        bezier46Path.addCurve(to: CGPoint(x: 114.65, y: 138.53), controlPoint1: CGPoint(x: 154.36, y: 94.3), controlPoint2: CGPoint(x: 154.98, y: 212.31))
        bezier46Path.close()
        strokeColor.setStroke()
        bezier46Path.lineWidth = 1
        bezier46Path.stroke()

        context.restoreGState()


        //// Bezier 47 Drawing
        context.saveGState()
        context.setAlpha(0.26)

        let bezier47Path = UIBezierPath()
        bezier47Path.move(to: CGPoint(x: 113.87, y: 137.72))
        bezier47Path.addCurve(to: CGPoint(x: 135.73, y: 116.1), controlPoint1: CGPoint(x: 196.66, y: 113.46), controlPoint2: CGPoint(x: 110.6, y: 198.62))
        bezier47Path.addCurve(to: CGPoint(x: 166.47, y: 116.26), controlPoint1: CGPoint(x: 211.42, y: 157.48), controlPoint2: CGPoint(x: 90.35, y: 156.84))
        bezier47Path.addCurve(to: CGPoint(x: 188.1, y: 138.11), controlPoint1: CGPoint(x: 190.74, y: 199.04), controlPoint2: CGPoint(x: 105.57, y: 112.98))
        bezier47Path.addCurve(to: CGPoint(x: 187.94, y: 168.86), controlPoint1: CGPoint(x: 146.72, y: 213.8), controlPoint2: CGPoint(x: 147.35, y: 92.73))
        bezier47Path.addCurve(to: CGPoint(x: 166.08, y: 190.48), controlPoint1: CGPoint(x: 105.15, y: 193.12), controlPoint2: CGPoint(x: 191.21, y: 107.96))
        bezier47Path.addCurve(to: CGPoint(x: 135.34, y: 190.32), controlPoint1: CGPoint(x: 90.39, y: 149.1), controlPoint2: CGPoint(x: 211.46, y: 149.74))
        bezier47Path.addCurve(to: CGPoint(x: 113.71, y: 168.47), controlPoint1: CGPoint(x: 111.07, y: 107.54), controlPoint2: CGPoint(x: 196.24, y: 193.6))
        bezier47Path.addCurve(to: CGPoint(x: 113.87, y: 137.72), controlPoint1: CGPoint(x: 155.09, y: 92.77), controlPoint2: CGPoint(x: 154.46, y: 213.84))
        bezier47Path.close()
        strokeColor.setStroke()
        bezier47Path.lineWidth = 1
        bezier47Path.stroke()

        context.restoreGState()


        //// Bezier 48 Drawing
        context.saveGState()
        context.setAlpha(0.26)

        let bezier48Path = UIBezierPath()
        bezier48Path.move(to: CGPoint(x: 113.11, y: 136.9))
        bezier48Path.addCurve(to: CGPoint(x: 135.75, y: 114.96), controlPoint1: CGPoint(x: 198.25, y: 112.91), controlPoint2: CGPoint(x: 109.1, y: 199.3))
        bezier48Path.addCurve(to: CGPoint(x: 167.27, y: 115.46), controlPoint1: CGPoint(x: 212.91, y: 158.2), controlPoint2: CGPoint(x: 88.79, y: 156.25))
        bezier48Path.addCurve(to: CGPoint(x: 189.21, y: 138.09), controlPoint1: CGPoint(x: 191.26, y: 200.59), controlPoint2: CGPoint(x: 104.87, y: 111.44))
        bezier48Path.addCurve(to: CGPoint(x: 188.71, y: 169.61), controlPoint1: CGPoint(x: 145.97, y: 215.26), controlPoint2: CGPoint(x: 147.92, y: 91.13))
        bezier48Path.addCurve(to: CGPoint(x: 166.07, y: 191.55), controlPoint1: CGPoint(x: 103.58, y: 193.6), controlPoint2: CGPoint(x: 192.72, y: 107.21))
        bezier48Path.addCurve(to: CGPoint(x: 134.55, y: 191.06), controlPoint1: CGPoint(x: 88.91, y: 148.31), controlPoint2: CGPoint(x: 213.04, y: 150.26))
        bezier48Path.addCurve(to: CGPoint(x: 112.62, y: 168.42), controlPoint1: CGPoint(x: 110.57, y: 105.92), controlPoint2: CGPoint(x: 196.96, y: 195.07))
        bezier48Path.addCurve(to: CGPoint(x: 113.11, y: 136.9), controlPoint1: CGPoint(x: 155.85, y: 91.26), controlPoint2: CGPoint(x: 153.9, y: 215.38))
        bezier48Path.close()
        strokeColor.setStroke()
        bezier48Path.lineWidth = 1
        bezier48Path.stroke()

        context.restoreGState()


        //// Bezier 49 Drawing
        context.saveGState()
        context.setAlpha(0.27)

        let bezier49Path = UIBezierPath()
        bezier49Path.move(to: CGPoint(x: 112.37, y: 136.06))
        bezier49Path.addCurve(to: CGPoint(x: 135.8, y: 113.82), controlPoint1: CGPoint(x: 199.85, y: 112.39), controlPoint2: CGPoint(x: 107.58, y: 199.95))
        bezier49Path.addCurve(to: CGPoint(x: 168.08, y: 114.67), controlPoint1: CGPoint(x: 214.39, y: 158.95), controlPoint2: CGPoint(x: 87.23, y: 155.62))
        bezier49Path.addCurve(to: CGPoint(x: 190.32, y: 138.1), controlPoint1: CGPoint(x: 191.75, y: 202.16), controlPoint2: CGPoint(x: 104.19, y: 109.89))
        bezier49Path.addCurve(to: CGPoint(x: 189.47, y: 170.39), controlPoint1: CGPoint(x: 145.19, y: 216.7), controlPoint2: CGPoint(x: 148.52, y: 89.54))
        bezier49Path.addCurve(to: CGPoint(x: 166.04, y: 192.62), controlPoint1: CGPoint(x: 101.99, y: 194.05), controlPoint2: CGPoint(x: 194.26, y: 106.5))
        bezier49Path.addCurve(to: CGPoint(x: 133.75, y: 191.78), controlPoint1: CGPoint(x: 87.45, y: 147.5), controlPoint2: CGPoint(x: 214.6, y: 150.82))
        bezier49Path.addCurve(to: CGPoint(x: 111.52, y: 168.35), controlPoint1: CGPoint(x: 110.09, y: 104.29), controlPoint2: CGPoint(x: 197.65, y: 196.56))
        bezier49Path.addCurve(to: CGPoint(x: 112.37, y: 136.06), controlPoint1: CGPoint(x: 156.65, y: 89.75), controlPoint2: CGPoint(x: 153.32, y: 216.91))
        bezier49Path.close()
        strokeColor.setStroke()
        bezier49Path.lineWidth = 1
        bezier49Path.stroke()

        context.restoreGState()


        //// Bezier 50 Drawing
        context.saveGState()
        context.setAlpha(0.28)

        let bezier50Path = UIBezierPath()
        bezier50Path.move(to: CGPoint(x: 111.63, y: 135.2))
        bezier50Path.addCurve(to: CGPoint(x: 135.86, y: 112.68), controlPoint1: CGPoint(x: 201.47, y: 111.9), controlPoint2: CGPoint(x: 106.05, y: 200.58))
        bezier50Path.addCurve(to: CGPoint(x: 168.92, y: 113.9), controlPoint1: CGPoint(x: 215.86, y: 159.74), controlPoint2: CGPoint(x: 85.69, y: 154.97))
        bezier50Path.addCurve(to: CGPoint(x: 191.44, y: 138.13), controlPoint1: CGPoint(x: 192.21, y: 203.74), controlPoint2: CGPoint(x: 103.54, y: 108.31))
        bezier50Path.addCurve(to: CGPoint(x: 190.22, y: 171.18), controlPoint1: CGPoint(x: 144.38, y: 218.13), controlPoint2: CGPoint(x: 149.15, y: 87.95))
        bezier50Path.addCurve(to: CGPoint(x: 165.99, y: 193.7), controlPoint1: CGPoint(x: 100.38, y: 194.48), controlPoint2: CGPoint(x: 195.81, y: 105.81))
        bezier50Path.addCurve(to: CGPoint(x: 132.94, y: 192.49), controlPoint1: CGPoint(x: 85.99, y: 146.64), controlPoint2: CGPoint(x: 216.17, y: 151.42))
        bezier50Path.addCurve(to: CGPoint(x: 110.42, y: 168.26), controlPoint1: CGPoint(x: 109.64, y: 102.65), controlPoint2: CGPoint(x: 198.31, y: 198.07))
        bezier50Path.addCurve(to: CGPoint(x: 111.63, y: 135.2), controlPoint1: CGPoint(x: 157.47, y: 88.26), controlPoint2: CGPoint(x: 152.7, y: 218.43))
        bezier50Path.close()
        strokeColor.setStroke()
        bezier50Path.lineWidth = 1
        bezier50Path.stroke()

        context.restoreGState()


        //// Bezier 51 Drawing
        context.saveGState()
        context.setAlpha(0.28)

        let bezier51Path = UIBezierPath()
        bezier51Path.move(to: CGPoint(x: 110.91, y: 134.33))
        bezier51Path.addCurve(to: CGPoint(x: 135.95, y: 111.54), controlPoint1: CGPoint(x: 203.11, y: 111.45), controlPoint2: CGPoint(x: 104.5, y: 201.18))
        bezier51Path.addCurve(to: CGPoint(x: 169.77, y: 113.13), controlPoint1: CGPoint(x: 217.33, y: 160.56), controlPoint2: CGPoint(x: 84.14, y: 154.28))
        bezier51Path.addCurve(to: CGPoint(x: 192.56, y: 138.18), controlPoint1: CGPoint(x: 192.65, y: 205.34), controlPoint2: CGPoint(x: 102.92, y: 106.72))
        bezier51Path.addCurve(to: CGPoint(x: 190.96, y: 171.99), controlPoint1: CGPoint(x: 143.54, y: 219.55), controlPoint2: CGPoint(x: 149.82, y: 86.37))
        bezier51Path.addCurve(to: CGPoint(x: 165.92, y: 194.78), controlPoint1: CGPoint(x: 98.76, y: 194.87), controlPoint2: CGPoint(x: 197.38, y: 105.14))
        bezier51Path.addCurve(to: CGPoint(x: 132.1, y: 193.19), controlPoint1: CGPoint(x: 84.55, y: 145.76), controlPoint2: CGPoint(x: 217.73, y: 152.04))
        bezier51Path.addCurve(to: CGPoint(x: 109.31, y: 168.14), controlPoint1: CGPoint(x: 109.22, y: 100.99), controlPoint2: CGPoint(x: 198.95, y: 199.6))
        bezier51Path.addCurve(to: CGPoint(x: 110.91, y: 134.33), controlPoint1: CGPoint(x: 158.33, y: 86.77), controlPoint2: CGPoint(x: 152.05, y: 219.95))
        bezier51Path.close()
        strokeColor.setStroke()
        bezier51Path.lineWidth = 1
        bezier51Path.stroke()

        context.restoreGState()


        //// Bezier 52 Drawing
        context.saveGState()
        context.setAlpha(0.29)

        let bezier52Path = UIBezierPath()
        bezier52Path.move(to: CGPoint(x: 110.2, y: 133.43))
        bezier52Path.addCurve(to: CGPoint(x: 136.06, y: 110.39), controlPoint1: CGPoint(x: 204.76, y: 111.02), controlPoint2: CGPoint(x: 102.93, y: 201.75))
        bezier52Path.addCurve(to: CGPoint(x: 170.64, y: 112.39), controlPoint1: CGPoint(x: 218.78, y: 161.41), controlPoint2: CGPoint(x: 82.61, y: 153.56))
        bezier52Path.addCurve(to: CGPoint(x: 193.68, y: 138.25), controlPoint1: CGPoint(x: 193.06, y: 206.95), controlPoint2: CGPoint(x: 102.32, y: 105.11))
        bezier52Path.addCurve(to: CGPoint(x: 191.69, y: 172.82), controlPoint1: CGPoint(x: 142.67, y: 220.96), controlPoint2: CGPoint(x: 150.52, y: 84.79))
        bezier52Path.addCurve(to: CGPoint(x: 165.83, y: 195.86), controlPoint1: CGPoint(x: 97.13, y: 195.24), controlPoint2: CGPoint(x: 198.96, y: 104.51))
        bezier52Path.addCurve(to: CGPoint(x: 131.25, y: 193.87), controlPoint1: CGPoint(x: 83.11, y: 144.85), controlPoint2: CGPoint(x: 219.28, y: 152.7))
        bezier52Path.addCurve(to: CGPoint(x: 108.21, y: 168.01), controlPoint1: CGPoint(x: 108.83, y: 99.31), controlPoint2: CGPoint(x: 199.57, y: 201.15))
        bezier52Path.addCurve(to: CGPoint(x: 110.2, y: 133.43), controlPoint1: CGPoint(x: 159.22, y: 85.3), controlPoint2: CGPoint(x: 151.37, y: 221.46))
        bezier52Path.close()
        strokeColor.setStroke()
        bezier52Path.lineWidth = 1
        bezier52Path.stroke()

        context.restoreGState()


        //// Bezier 53 Drawing
        context.saveGState()
        context.setAlpha(0.3)

        let bezier53Path = UIBezierPath()
        bezier53Path.move(to: CGPoint(x: 109.51, y: 132.53))
        bezier53Path.addCurve(to: CGPoint(x: 136.2, y: 109.25), controlPoint1: CGPoint(x: 206.43, y: 110.62), controlPoint2: CGPoint(x: 101.34, y: 202.29))
        bezier53Path.addCurve(to: CGPoint(x: 171.53, y: 111.65), controlPoint1: CGPoint(x: 220.22, y: 162.29), controlPoint2: CGPoint(x: 81.08, y: 152.8))
        bezier53Path.addCurve(to: CGPoint(x: 194.81, y: 138.34), controlPoint1: CGPoint(x: 193.43, y: 208.57), controlPoint2: CGPoint(x: 101.76, y: 103.48))
        bezier53Path.addCurve(to: CGPoint(x: 192.4, y: 173.67), controlPoint1: CGPoint(x: 141.76, y: 222.36), controlPoint2: CGPoint(x: 151.25, y: 83.23))
        bezier53Path.addCurve(to: CGPoint(x: 165.71, y: 196.95), controlPoint1: CGPoint(x: 95.48, y: 195.58), controlPoint2: CGPoint(x: 200.57, y: 103.9))
        bezier53Path.addCurve(to: CGPoint(x: 130.38, y: 194.54), controlPoint1: CGPoint(x: 81.69, y: 143.91), controlPoint2: CGPoint(x: 220.82, y: 153.39))
        bezier53Path.addCurve(to: CGPoint(x: 107.1, y: 167.86), controlPoint1: CGPoint(x: 108.47, y: 97.62), controlPoint2: CGPoint(x: 200.15, y: 202.71))
        bezier53Path.addCurve(to: CGPoint(x: 109.51, y: 132.53), controlPoint1: CGPoint(x: 160.14, y: 83.83), controlPoint2: CGPoint(x: 150.66, y: 222.97))
        bezier53Path.close()
        strokeColor.setStroke()
        bezier53Path.lineWidth = 1
        bezier53Path.stroke()

        context.restoreGState()


        //// Bezier 54 Drawing
        context.saveGState()
        context.setAlpha(0.3)

        let bezier54Path = UIBezierPath()
        bezier54Path.move(to: CGPoint(x: 108.83, y: 131.6))
        bezier54Path.addCurve(to: CGPoint(x: 136.35, y: 108.1), controlPoint1: CGPoint(x: 208.11, y: 110.25), controlPoint2: CGPoint(x: 99.73, y: 202.81))
        bezier54Path.addCurve(to: CGPoint(x: 172.43, y: 110.94), controlPoint1: CGPoint(x: 221.65, y: 163.2), controlPoint2: CGPoint(x: 79.56, y: 152.02))
        bezier54Path.addCurve(to: CGPoint(x: 195.93, y: 138.46), controlPoint1: CGPoint(x: 193.78, y: 210.21), controlPoint2: CGPoint(x: 101.22, y: 101.84))
        bezier54Path.addCurve(to: CGPoint(x: 193.09, y: 174.53), controlPoint1: CGPoint(x: 140.83, y: 223.75), controlPoint2: CGPoint(x: 152.01, y: 81.67))
        bezier54Path.addCurve(to: CGPoint(x: 165.57, y: 198.04), controlPoint1: CGPoint(x: 93.82, y: 195.88), controlPoint2: CGPoint(x: 202.19, y: 103.32))
        bezier54Path.addCurve(to: CGPoint(x: 129.5, y: 195.2), controlPoint1: CGPoint(x: 80.28, y: 142.94), controlPoint2: CGPoint(x: 222.36, y: 154.12))
        bezier54Path.addCurve(to: CGPoint(x: 105.99, y: 167.68), controlPoint1: CGPoint(x: 108.15, y: 95.92), controlPoint2: CGPoint(x: 200.71, y: 204.3))
        bezier54Path.addCurve(to: CGPoint(x: 108.83, y: 131.6), controlPoint1: CGPoint(x: 161.09, y: 82.38), controlPoint2: CGPoint(x: 149.91, y: 224.47))
        bezier54Path.close()
        strokeColor.setStroke()
        bezier54Path.lineWidth = 1
        bezier54Path.stroke()

        context.restoreGState()


        //// Bezier 55 Drawing
        context.saveGState()
        context.setAlpha(0.31)

        let bezier55Path = UIBezierPath()
        bezier55Path.move(to: CGPoint(x: 108.17, y: 130.66))
        bezier55Path.addCurve(to: CGPoint(x: 136.53, y: 106.95), controlPoint1: CGPoint(x: 209.8, y: 109.91), controlPoint2: CGPoint(x: 98.11, y: 203.3))
        bezier55Path.addCurve(to: CGPoint(x: 173.35, y: 110.23), controlPoint1: CGPoint(x: 223.06, y: 164.14), controlPoint2: CGPoint(x: 78.05, y: 151.2))
        bezier55Path.addCurve(to: CGPoint(x: 197.06, y: 138.59), controlPoint1: CGPoint(x: 194.1, y: 211.87), controlPoint2: CGPoint(x: 100.71, y: 100.18))
        bezier55Path.addCurve(to: CGPoint(x: 193.78, y: 175.42), controlPoint1: CGPoint(x: 139.87, y: 225.13), controlPoint2: CGPoint(x: 152.81, y: 80.12))
        bezier55Path.addCurve(to: CGPoint(x: 165.42, y: 199.13), controlPoint1: CGPoint(x: 92.14, y: 196.16), controlPoint2: CGPoint(x: 203.83, y: 102.78))
        bezier55Path.addCurve(to: CGPoint(x: 128.59, y: 195.84), controlPoint1: CGPoint(x: 78.88, y: 141.93), controlPoint2: CGPoint(x: 223.89, y: 154.87))
        bezier55Path.addCurve(to: CGPoint(x: 104.88, y: 167.48), controlPoint1: CGPoint(x: 107.85, y: 94.21), controlPoint2: CGPoint(x: 201.23, y: 205.9))
        bezier55Path.addCurve(to: CGPoint(x: 108.17, y: 130.66), controlPoint1: CGPoint(x: 162.08, y: 80.95), controlPoint2: CGPoint(x: 149.14, y: 225.96))
        bezier55Path.close()
        strokeColor.setStroke()
        bezier55Path.lineWidth = 1
        bezier55Path.stroke()

        context.restoreGState()


        //// Bezier 56 Drawing
        context.saveGState()
        context.setAlpha(0.32)

        let bezier56Path = UIBezierPath()
        bezier56Path.move(to: CGPoint(x: 107.52, y: 129.7))
        bezier56Path.addCurve(to: CGPoint(x: 136.73, y: 105.79), controlPoint1: CGPoint(x: 211.51, y: 109.61), controlPoint2: CGPoint(x: 96.48, y: 203.76))
        bezier56Path.addCurve(to: CGPoint(x: 174.29, y: 109.54), controlPoint1: CGPoint(x: 224.47, y: 165.12), controlPoint2: CGPoint(x: 76.55, y: 150.35))
        bezier56Path.addCurve(to: CGPoint(x: 198.2, y: 138.75), controlPoint1: CGPoint(x: 194.38, y: 213.53), controlPoint2: CGPoint(x: 100.23, y: 98.5))
        bezier56Path.addCurve(to: CGPoint(x: 194.45, y: 176.31), controlPoint1: CGPoint(x: 138.87, y: 226.49), controlPoint2: CGPoint(x: 153.64, y: 78.58))
        bezier56Path.addCurve(to: CGPoint(x: 165.24, y: 200.22), controlPoint1: CGPoint(x: 90.46, y: 196.41), controlPoint2: CGPoint(x: 205.49, y: 102.26))
        bezier56Path.addCurve(to: CGPoint(x: 127.68, y: 196.47), controlPoint1: CGPoint(x: 77.5, y: 140.9), controlPoint2: CGPoint(x: 225.41, y: 155.66))
        bezier56Path.addCurve(to: CGPoint(x: 103.77, y: 167.26), controlPoint1: CGPoint(x: 107.58, y: 92.48), controlPoint2: CGPoint(x: 201.73, y: 207.51))
        bezier56Path.addCurve(to: CGPoint(x: 107.52, y: 129.7), controlPoint1: CGPoint(x: 163.09, y: 79.52), controlPoint2: CGPoint(x: 148.33, y: 227.44))
        bezier56Path.close()
        strokeColor.setStroke()
        bezier56Path.lineWidth = 1
        bezier56Path.stroke()

        context.restoreGState()


        //// Bezier 57 Drawing
        context.saveGState()
        context.setAlpha(0.32)

        let bezier57Path = UIBezierPath()
        bezier57Path.move(to: CGPoint(x: 106.88, y: 128.73))
        bezier57Path.addCurve(to: CGPoint(x: 136.95, y: 104.64), controlPoint1: CGPoint(x: 213.23, y: 109.33), controlPoint2: CGPoint(x: 94.82, y: 204.19))
        bezier57Path.addCurve(to: CGPoint(x: 175.24, y: 108.87), controlPoint1: CGPoint(x: 225.86, y: 166.12), controlPoint2: CGPoint(x: 75.06, y: 149.47))
        bezier57Path.addCurve(to: CGPoint(x: 199.33, y: 138.94), controlPoint1: CGPoint(x: 194.64, y: 215.21), controlPoint2: CGPoint(x: 99.78, y: 96.81))
        bezier57Path.addCurve(to: CGPoint(x: 195.1, y: 177.23), controlPoint1: CGPoint(x: 137.85, y: 227.84), controlPoint2: CGPoint(x: 154.5, y: 77.05))
        bezier57Path.addCurve(to: CGPoint(x: 165.04, y: 201.32), controlPoint1: CGPoint(x: 88.76, y: 196.62), controlPoint2: CGPoint(x: 207.16, y: 101.77))
        bezier57Path.addCurve(to: CGPoint(x: 126.74, y: 197.09), controlPoint1: CGPoint(x: 76.13, y: 139.84), controlPoint2: CGPoint(x: 226.92, y: 156.48))
        bezier57Path.addCurve(to: CGPoint(x: 102.66, y: 167.02), controlPoint1: CGPoint(x: 107.35, y: 90.75), controlPoint2: CGPoint(x: 202.21, y: 209.15))
        bezier57Path.addCurve(to: CGPoint(x: 106.88, y: 128.73), controlPoint1: CGPoint(x: 164.14, y: 78.11), controlPoint2: CGPoint(x: 147.49, y: 228.91))
        bezier57Path.close()
        strokeColor.setStroke()
        bezier57Path.lineWidth = 1
        bezier57Path.stroke()

        context.restoreGState()


        //// Bezier 58 Drawing
        context.saveGState()
        context.setAlpha(0.33)

        let bezier58Path = UIBezierPath()
        bezier58Path.move(to: CGPoint(x: 106.27, y: 127.74))
        bezier58Path.addCurve(to: CGPoint(x: 137.19, y: 103.49), controlPoint1: CGPoint(x: 214.96, y: 109.09), controlPoint2: CGPoint(x: 93.16, y: 204.59))
        bezier58Path.addCurve(to: CGPoint(x: 176.21, y: 108.21), controlPoint1: CGPoint(x: 227.24, y: 167.16), controlPoint2: CGPoint(x: 73.58, y: 148.56))
        bezier58Path.addCurve(to: CGPoint(x: 200.46, y: 139.14), controlPoint1: CGPoint(x: 194.86, y: 216.9), controlPoint2: CGPoint(x: 99.36, y: 95.1))
        bezier58Path.addCurve(to: CGPoint(x: 195.74, y: 178.16), controlPoint1: CGPoint(x: 136.8, y: 229.18), controlPoint2: CGPoint(x: 155.39, y: 75.53))
        bezier58Path.addCurve(to: CGPoint(x: 164.81, y: 202.41), controlPoint1: CGPoint(x: 87.05, y: 196.81), controlPoint2: CGPoint(x: 208.85, y: 101.31))
        bezier58Path.addCurve(to: CGPoint(x: 125.8, y: 197.69), controlPoint1: CGPoint(x: 74.77, y: 138.74), controlPoint2: CGPoint(x: 228.43, y: 157.34))
        bezier58Path.addCurve(to: CGPoint(x: 101.54, y: 166.76), controlPoint1: CGPoint(x: 107.15, y: 89), controlPoint2: CGPoint(x: 202.65, y: 210.8))
        bezier58Path.addCurve(to: CGPoint(x: 106.27, y: 127.74), controlPoint1: CGPoint(x: 165.21, y: 76.72), controlPoint2: CGPoint(x: 146.62, y: 230.37))
        bezier58Path.close()
        strokeColor.setStroke()
        bezier58Path.lineWidth = 1
        bezier58Path.stroke()

        context.restoreGState()


        //// Bezier 59 Drawing
        context.saveGState()
        context.setAlpha(0.34)

        let bezier59Path = UIBezierPath()
        bezier59Path.move(to: CGPoint(x: 105.66, y: 126.74))
        bezier59Path.addCurve(to: CGPoint(x: 137.46, y: 102.34), controlPoint1: CGPoint(x: 216.7, y: 108.88), controlPoint2: CGPoint(x: 91.47, y: 204.97))
        bezier59Path.addCurve(to: CGPoint(x: 177.2, y: 107.57), controlPoint1: CGPoint(x: 228.6, y: 168.22), controlPoint2: CGPoint(x: 72.11, y: 147.62))
        bezier59Path.addCurve(to: CGPoint(x: 201.6, y: 139.37), controlPoint1: CGPoint(x: 195.06, y: 218.6), controlPoint2: CGPoint(x: 98.97, y: 93.38))
        bezier59Path.addCurve(to: CGPoint(x: 196.37, y: 179.11), controlPoint1: CGPoint(x: 135.71, y: 230.51), controlPoint2: CGPoint(x: 156.32, y: 74.02))
        bezier59Path.addCurve(to: CGPoint(x: 164.57, y: 203.5), controlPoint1: CGPoint(x: 85.33, y: 196.96), controlPoint2: CGPoint(x: 210.56, y: 100.88))
        bezier59Path.addCurve(to: CGPoint(x: 124.83, y: 198.27), controlPoint1: CGPoint(x: 73.43, y: 137.62), controlPoint2: CGPoint(x: 229.92, y: 158.22))
        bezier59Path.addCurve(to: CGPoint(x: 100.43, y: 166.47), controlPoint1: CGPoint(x: 106.97, y: 87.24), controlPoint2: CGPoint(x: 203.06, y: 212.46))
        bezier59Path.addCurve(to: CGPoint(x: 105.66, y: 126.74), controlPoint1: CGPoint(x: 166.32, y: 75.33), controlPoint2: CGPoint(x: 145.72, y: 231.82))
        bezier59Path.close()
        strokeColor.setStroke()
        bezier59Path.lineWidth = 1
        bezier59Path.stroke()

        context.restoreGState()


        //// Bezier 60 Drawing
        context.saveGState()
        context.setAlpha(0.34)

        let bezier60Path = UIBezierPath()
        bezier60Path.move(to: CGPoint(x: 105.08, y: 125.72))
        bezier60Path.addCurve(to: CGPoint(x: 137.75, y: 101.18), controlPoint1: CGPoint(x: 218.45, y: 108.7), controlPoint2: CGPoint(x: 89.78, y: 205.31))
        bezier60Path.addCurve(to: CGPoint(x: 178.2, y: 106.94), controlPoint1: CGPoint(x: 229.95, y: 169.32), controlPoint2: CGPoint(x: 70.65, y: 146.65))
        bezier60Path.addCurve(to: CGPoint(x: 202.73, y: 139.62), controlPoint1: CGPoint(x: 195.22, y: 220.32), controlPoint2: CGPoint(x: 98.61, y: 91.64))
        bezier60Path.addCurve(to: CGPoint(x: 196.98, y: 180.07), controlPoint1: CGPoint(x: 134.6, y: 231.82), controlPoint2: CGPoint(x: 157.27, y: 72.52))
        bezier60Path.addCurve(to: CGPoint(x: 164.3, y: 204.6), controlPoint1: CGPoint(x: 83.6, y: 197.09), controlPoint2: CGPoint(x: 212.28, y: 100.48))
        bezier60Path.addCurve(to: CGPoint(x: 123.85, y: 198.84), controlPoint1: CGPoint(x: 72.1, y: 136.47), controlPoint2: CGPoint(x: 231.4, y: 159.14))
        bezier60Path.addCurve(to: CGPoint(x: 99.32, y: 166.17), controlPoint1: CGPoint(x: 106.83, y: 85.47), controlPoint2: CGPoint(x: 203.44, y: 214.14))
        bezier60Path.addCurve(to: CGPoint(x: 105.08, y: 125.72), controlPoint1: CGPoint(x: 167.45, y: 73.97), controlPoint2: CGPoint(x: 144.78, y: 233.27))
        bezier60Path.close()
        strokeColor.setStroke()
        bezier60Path.lineWidth = 1
        bezier60Path.stroke()

        context.restoreGState()


        //// Bezier 61 Drawing
        context.saveGState()
        context.setAlpha(0.35)

        let bezier61Path = UIBezierPath()
        bezier61Path.move(to: CGPoint(x: 104.51, y: 124.68))
        bezier61Path.addCurve(to: CGPoint(x: 138.06, y: 100.03), controlPoint1: CGPoint(x: 220.22, y: 108.55), controlPoint2: CGPoint(x: 88.07, y: 205.62))
        bezier61Path.addCurve(to: CGPoint(x: 179.22, y: 106.33), controlPoint1: CGPoint(x: 231.29, y: 170.45), controlPoint2: CGPoint(x: 69.21, y: 145.64))
        bezier61Path.addCurve(to: CGPoint(x: 203.87, y: 139.89), controlPoint1: CGPoint(x: 195.35, y: 222.04), controlPoint2: CGPoint(x: 98.28, y: 89.89))
        bezier61Path.addCurve(to: CGPoint(x: 197.57, y: 181.05), controlPoint1: CGPoint(x: 133.46, y: 233.11), controlPoint2: CGPoint(x: 158.26, y: 71.03))
        bezier61Path.addCurve(to: CGPoint(x: 164.02, y: 205.7), controlPoint1: CGPoint(x: 81.86, y: 197.18), controlPoint2: CGPoint(x: 214.01, y: 100.11))
        bezier61Path.addCurve(to: CGPoint(x: 122.86, y: 199.4), controlPoint1: CGPoint(x: 70.79, y: 135.28), controlPoint2: CGPoint(x: 232.87, y: 160.09))
        bezier61Path.addCurve(to: CGPoint(x: 98.21, y: 165.84), controlPoint1: CGPoint(x: 106.73, y: 83.69), controlPoint2: CGPoint(x: 203.8, y: 215.84))
        bezier61Path.addCurve(to: CGPoint(x: 104.51, y: 124.68), controlPoint1: CGPoint(x: 168.62, y: 72.62), controlPoint2: CGPoint(x: 143.82, y: 234.7))
        bezier61Path.close()
        strokeColor.setStroke()
        bezier61Path.lineWidth = 1
        bezier61Path.stroke()

        context.restoreGState()


        //// Bezier 62 Drawing
        context.saveGState()
        context.setAlpha(0.35)

        let bezier62Path = UIBezierPath()
        bezier62Path.move(to: CGPoint(x: 103.95, y: 123.63))
        bezier62Path.addCurve(to: CGPoint(x: 138.4, y: 98.88), controlPoint1: CGPoint(x: 221.99, y: 108.44), controlPoint2: CGPoint(x: 86.34, y: 205.91))
        bezier62Path.addCurve(to: CGPoint(x: 180.25, y: 105.74), controlPoint1: CGPoint(x: 232.61, y: 171.6), controlPoint2: CGPoint(x: 67.77, y: 144.61))
        bezier62Path.addCurve(to: CGPoint(x: 205.01, y: 140.18), controlPoint1: CGPoint(x: 195.45, y: 223.77), controlPoint2: CGPoint(x: 97.98, y: 88.13))
        bezier62Path.addCurve(to: CGPoint(x: 198.15, y: 182.04), controlPoint1: CGPoint(x: 132.29, y: 234.39), controlPoint2: CGPoint(x: 159.28, y: 69.56))
        bezier62Path.addCurve(to: CGPoint(x: 163.71, y: 206.79), controlPoint1: CGPoint(x: 80.11, y: 197.24), controlPoint2: CGPoint(x: 215.76, y: 99.77))
        bezier62Path.addCurve(to: CGPoint(x: 121.85, y: 199.94), controlPoint1: CGPoint(x: 69.5, y: 134.07), controlPoint2: CGPoint(x: 234.33, y: 161.07))
        bezier62Path.addCurve(to: CGPoint(x: 97.1, y: 165.49), controlPoint1: CGPoint(x: 106.65, y: 81.9), controlPoint2: CGPoint(x: 204.12, y: 217.54))
        bezier62Path.addCurve(to: CGPoint(x: 103.95, y: 123.63), controlPoint1: CGPoint(x: 169.82, y: 71.28), controlPoint2: CGPoint(x: 142.82, y: 236.12))
        bezier62Path.close()
        strokeColor.setStroke()
        bezier62Path.lineWidth = 1
        bezier62Path.stroke()

        context.restoreGState()


        //// Bezier 63 Drawing
        context.saveGState()
        context.setAlpha(0.36)

        let bezier63Path = UIBezierPath()
        bezier63Path.move(to: CGPoint(x: 103.41, y: 122.57))
        bezier63Path.addCurve(to: CGPoint(x: 138.75, y: 97.74), controlPoint1: CGPoint(x: 223.77, y: 108.35), controlPoint2: CGPoint(x: 84.61, y: 206.16))
        bezier63Path.addCurve(to: CGPoint(x: 181.3, y: 105.16), controlPoint1: CGPoint(x: 233.91, y: 172.79), controlPoint2: CGPoint(x: 66.35, y: 143.54))
        bezier63Path.addCurve(to: CGPoint(x: 206.14, y: 140.5), controlPoint1: CGPoint(x: 195.52, y: 225.52), controlPoint2: CGPoint(x: 97.71, y: 86.35))
        bezier63Path.addCurve(to: CGPoint(x: 198.71, y: 183.05), controlPoint1: CGPoint(x: 131.09, y: 235.66), controlPoint2: CGPoint(x: 160.33, y: 68.09))
        bezier63Path.addCurve(to: CGPoint(x: 163.37, y: 207.89), controlPoint1: CGPoint(x: 78.36, y: 197.27), controlPoint2: CGPoint(x: 217.52, y: 99.46))
        bezier63Path.addCurve(to: CGPoint(x: 120.82, y: 200.46), controlPoint1: CGPoint(x: 68.22, y: 132.83), controlPoint2: CGPoint(x: 235.78, y: 162.08))
        bezier63Path.addCurve(to: CGPoint(x: 95.99, y: 165.12), controlPoint1: CGPoint(x: 106.61, y: 80.1), controlPoint2: CGPoint(x: 204.41, y: 219.27))
        bezier63Path.addCurve(to: CGPoint(x: 103.41, y: 122.57), controlPoint1: CGPoint(x: 171.04, y: 69.96), controlPoint2: CGPoint(x: 141.8, y: 237.53))
        bezier63Path.close()
        strokeColor.setStroke()
        bezier63Path.lineWidth = 1
        bezier63Path.stroke()

        context.restoreGState()


        //// Bezier 64 Drawing
        context.saveGState()
        context.setAlpha(0.37)

        let bezier64Path = UIBezierPath()
        bezier64Path.move(to: CGPoint(x: 102.89, y: 121.49))
        bezier64Path.addCurve(to: CGPoint(x: 139.13, y: 96.59), controlPoint1: CGPoint(x: 225.56, y: 108.31), controlPoint2: CGPoint(x: 82.86, y: 206.38))
        bezier64Path.addCurve(to: CGPoint(x: 182.37, y: 104.6), controlPoint1: CGPoint(x: 235.2, y: 174), controlPoint2: CGPoint(x: 64.94, y: 142.45))
        bezier64Path.addCurve(to: CGPoint(x: 207.27, y: 140.84), controlPoint1: CGPoint(x: 195.56, y: 227.27), controlPoint2: CGPoint(x: 97.48, y: 84.57))
        bezier64Path.addCurve(to: CGPoint(x: 199.26, y: 184.07), controlPoint1: CGPoint(x: 129.86, y: 236.91), controlPoint2: CGPoint(x: 161.41, y: 66.65))
        bezier64Path.addCurve(to: CGPoint(x: 163.02, y: 208.98), controlPoint1: CGPoint(x: 76.59, y: 197.26), controlPoint2: CGPoint(x: 219.3, y: 99.18))
        bezier64Path.addCurve(to: CGPoint(x: 119.79, y: 200.97), controlPoint1: CGPoint(x: 66.95, y: 131.56), controlPoint2: CGPoint(x: 237.22, y: 163.12))
        bezier64Path.addCurve(to: CGPoint(x: 94.88, y: 164.73), controlPoint1: CGPoint(x: 106.6, y: 78.3), controlPoint2: CGPoint(x: 204.68, y: 221))
        bezier64Path.addCurve(to: CGPoint(x: 102.89, y: 121.49), controlPoint1: CGPoint(x: 172.3, y: 68.66), controlPoint2: CGPoint(x: 140.74, y: 238.92))
        bezier64Path.close()
        strokeColor.setStroke()
        bezier64Path.lineWidth = 1
        bezier64Path.stroke()

        context.restoreGState()


        //// Bezier 65 Drawing
        context.saveGState()
        context.setAlpha(0.37)

        let bezier65Path = UIBezierPath()
        bezier65Path.move(to: CGPoint(x: 102.39, y: 120.4))
        bezier65Path.addCurve(to: CGPoint(x: 139.53, y: 95.44), controlPoint1: CGPoint(x: 227.37, y: 108.29), controlPoint2: CGPoint(x: 81.1, y: 206.58))
        bezier65Path.addCurve(to: CGPoint(x: 183.45, y: 104.06), controlPoint1: CGPoint(x: 236.47, y: 175.25), controlPoint2: CGPoint(x: 63.54, y: 141.32))
        bezier65Path.addCurve(to: CGPoint(x: 208.4, y: 141.2), controlPoint1: CGPoint(x: 195.56, y: 229.03), controlPoint2: CGPoint(x: 97.27, y: 82.76))
        bezier65Path.addCurve(to: CGPoint(x: 199.79, y: 185.11), controlPoint1: CGPoint(x: 128.6, y: 238.14), controlPoint2: CGPoint(x: 162.53, y: 65.21))
        bezier65Path.addCurve(to: CGPoint(x: 162.65, y: 210.07), controlPoint1: CGPoint(x: 74.81, y: 197.23), controlPoint2: CGPoint(x: 221.08, y: 98.94))
        bezier65Path.addCurve(to: CGPoint(x: 118.73, y: 201.46), controlPoint1: CGPoint(x: 65.71, y: 130.27), controlPoint2: CGPoint(x: 238.64, y: 164.2))
        bezier65Path.addCurve(to: CGPoint(x: 93.78, y: 164.31), controlPoint1: CGPoint(x: 106.62, y: 76.48), controlPoint2: CGPoint(x: 204.91, y: 222.75))
        bezier65Path.addCurve(to: CGPoint(x: 102.39, y: 120.4), controlPoint1: CGPoint(x: 173.58, y: 67.38), controlPoint2: CGPoint(x: 139.65, y: 240.31))
        bezier65Path.close()
        strokeColor.setStroke()
        bezier65Path.lineWidth = 1
        bezier65Path.stroke()

        context.restoreGState()


        //// Bezier 66 Drawing
        context.saveGState()
        context.setAlpha(0.38)

        let bezier66Path = UIBezierPath()
        bezier66Path.move(to: CGPoint(x: 101.91, y: 119.3))
        bezier66Path.addCurve(to: CGPoint(x: 139.96, y: 94.3), controlPoint1: CGPoint(x: 229.18, y: 108.3), controlPoint2: CGPoint(x: 79.32, y: 206.74))
        bezier66Path.addCurve(to: CGPoint(x: 184.54, y: 103.53), controlPoint1: CGPoint(x: 237.72, y: 176.52), controlPoint2: CGPoint(x: 62.16, y: 140.16))
        bezier66Path.addCurve(to: CGPoint(x: 209.53, y: 141.59), controlPoint1: CGPoint(x: 195.53, y: 230.8), controlPoint2: CGPoint(x: 97.1, y: 80.95))
        bezier66Path.addCurve(to: CGPoint(x: 200.3, y: 186.17), controlPoint1: CGPoint(x: 127.31, y: 239.35), controlPoint2: CGPoint(x: 163.67, y: 63.79))
        bezier66Path.addCurve(to: CGPoint(x: 162.25, y: 211.16), controlPoint1: CGPoint(x: 73.03, y: 197.16), controlPoint2: CGPoint(x: 222.88, y: 98.73))
        bezier66Path.addCurve(to: CGPoint(x: 117.67, y: 201.93), controlPoint1: CGPoint(x: 64.48, y: 128.94), controlPoint2: CGPoint(x: 240.05, y: 165.3))
        bezier66Path.addCurve(to: CGPoint(x: 92.67, y: 163.88), controlPoint1: CGPoint(x: 106.68, y: 74.66), controlPoint2: CGPoint(x: 205.11, y: 224.51))
        bezier66Path.addCurve(to: CGPoint(x: 101.91, y: 119.3), controlPoint1: CGPoint(x: 174.89, y: 66.11), controlPoint2: CGPoint(x: 138.54, y: 241.68))
        bezier66Path.close()
        strokeColor.setStroke()
        bezier66Path.lineWidth = 1
        bezier66Path.stroke()

        context.restoreGState()


        //// Bezier 67 Drawing
        context.saveGState()
        context.setAlpha(0.39)

        let bezier67Path = UIBezierPath()
        bezier67Path.move(to: CGPoint(x: 101.44, y: 118.18))
        bezier67Path.addCurve(to: CGPoint(x: 140.4, y: 93.16), controlPoint1: CGPoint(x: 230.99, y: 108.35), controlPoint2: CGPoint(x: 77.54, y: 206.87))
        bezier67Path.addCurve(to: CGPoint(x: 185.65, y: 103.03), controlPoint1: CGPoint(x: 238.96, y: 177.82), controlPoint2: CGPoint(x: 60.79, y: 138.98))
        bezier67Path.addCurve(to: CGPoint(x: 210.66, y: 141.99), controlPoint1: CGPoint(x: 195.47, y: 232.58), controlPoint2: CGPoint(x: 96.96, y: 79.13))
        bezier67Path.addCurve(to: CGPoint(x: 200.8, y: 187.24), controlPoint1: CGPoint(x: 126, y: 240.55), controlPoint2: CGPoint(x: 164.85, y: 62.38))
        bezier67Path.addCurve(to: CGPoint(x: 161.83, y: 212.25), controlPoint1: CGPoint(x: 71.24, y: 197.06), controlPoint2: CGPoint(x: 224.7, y: 98.55))
        bezier67Path.addCurve(to: CGPoint(x: 116.59, y: 202.39), controlPoint1: CGPoint(x: 63.28, y: 127.59), controlPoint2: CGPoint(x: 241.44, y: 166.44))
        bezier67Path.addCurve(to: CGPoint(x: 91.57, y: 163.42), controlPoint1: CGPoint(x: 106.76, y: 72.83), controlPoint2: CGPoint(x: 205.28, y: 226.28))
        bezier67Path.addCurve(to: CGPoint(x: 101.44, y: 118.18), controlPoint1: CGPoint(x: 176.24, y: 64.87), controlPoint2: CGPoint(x: 137.39, y: 243.03))
        bezier67Path.close()
        strokeColor.setStroke()
        bezier67Path.lineWidth = 1
        bezier67Path.stroke()

        context.restoreGState()


        //// Bezier 68 Drawing
        context.saveGState()
        context.setAlpha(0.39)

        let bezier68Path = UIBezierPath()
        bezier68Path.move(to: CGPoint(x: 100.99, y: 117.05))
        bezier68Path.addCurve(to: CGPoint(x: 140.87, y: 92.03), controlPoint1: CGPoint(x: 232.82, y: 108.44), controlPoint2: CGPoint(x: 75.75, y: 206.97))
        bezier68Path.addCurve(to: CGPoint(x: 186.77, y: 102.54), controlPoint1: CGPoint(x: 240.18, y: 179.16), controlPoint2: CGPoint(x: 59.44, y: 137.76))
        bezier68Path.addCurve(to: CGPoint(x: 211.79, y: 142.42), controlPoint1: CGPoint(x: 195.38, y: 234.37), controlPoint2: CGPoint(x: 96.85, y: 77.3))
        bezier68Path.addCurve(to: CGPoint(x: 201.28, y: 188.32), controlPoint1: CGPoint(x: 124.66, y: 241.73), controlPoint2: CGPoint(x: 166.05, y: 60.99))
        bezier68Path.addCurve(to: CGPoint(x: 161.39, y: 213.34), controlPoint1: CGPoint(x: 69.45, y: 196.93), controlPoint2: CGPoint(x: 226.52, y: 98.4))
        bezier68Path.addCurve(to: CGPoint(x: 115.5, y: 202.83), controlPoint1: CGPoint(x: 62.09, y: 126.21), controlPoint2: CGPoint(x: 242.82, y: 167.6))
        bezier68Path.addCurve(to: CGPoint(x: 90.48, y: 162.94), controlPoint1: CGPoint(x: 106.89, y: 71), controlPoint2: CGPoint(x: 205.42, y: 228.07))
        bezier68Path.addCurve(to: CGPoint(x: 100.99, y: 117.05), controlPoint1: CGPoint(x: 177.61, y: 63.64), controlPoint2: CGPoint(x: 136.21, y: 244.37))
        bezier68Path.close()
        strokeColor.setStroke()
        bezier68Path.lineWidth = 1
        bezier68Path.stroke()

        context.restoreGState()


        //// Bezier 69 Drawing
        context.saveGState()
        context.setAlpha(0.4)

        let bezier69Path = UIBezierPath()
        bezier69Path.move(to: CGPoint(x: 100.56, y: 115.9))
        bezier69Path.addCurve(to: CGPoint(x: 141.36, y: 90.89), controlPoint1: CGPoint(x: 234.65, y: 108.55), controlPoint2: CGPoint(x: 73.94, y: 207.03))
        bezier69Path.addCurve(to: CGPoint(x: 187.9, y: 102.07), controlPoint1: CGPoint(x: 241.38, y: 180.52), controlPoint2: CGPoint(x: 58.1, y: 136.52))
        bezier69Path.addCurve(to: CGPoint(x: 212.91, y: 142.88), controlPoint1: CGPoint(x: 195.25, y: 236.16), controlPoint2: CGPoint(x: 96.77, y: 75.45))
        bezier69Path.addCurve(to: CGPoint(x: 201.74, y: 189.41), controlPoint1: CGPoint(x: 123.29, y: 242.89), controlPoint2: CGPoint(x: 167.29, y: 59.62))
        bezier69Path.addCurve(to: CGPoint(x: 160.93, y: 214.42), controlPoint1: CGPoint(x: 67.65, y: 196.76), controlPoint2: CGPoint(x: 228.35, y: 98.28))
        bezier69Path.addCurve(to: CGPoint(x: 114.39, y: 203.25), controlPoint1: CGPoint(x: 60.92, y: 124.8), controlPoint2: CGPoint(x: 244.19, y: 168.8))
        bezier69Path.addCurve(to: CGPoint(x: 89.38, y: 162.44), controlPoint1: CGPoint(x: 107.04, y: 69.16), controlPoint2: CGPoint(x: 205.52, y: 229.86))
        bezier69Path.addCurve(to: CGPoint(x: 100.56, y: 115.9), controlPoint1: CGPoint(x: 179, y: 62.43), controlPoint2: CGPoint(x: 135, y: 245.7))
        bezier69Path.close()
        strokeColor.setStroke()
        bezier69Path.lineWidth = 1
        bezier69Path.stroke()

        context.restoreGState()


        //// Bezier 70 Drawing
        context.saveGState()
        context.setAlpha(0.41)

        let bezier70Path = UIBezierPath()
        bezier70Path.move(to: CGPoint(x: 100.14, y: 114.74))
        bezier70Path.addCurve(to: CGPoint(x: 141.88, y: 89.77), controlPoint1: CGPoint(x: 236.48, y: 108.7), controlPoint2: CGPoint(x: 72.13, y: 207.07))
        bezier70Path.addCurve(to: CGPoint(x: 189.05, y: 101.61), controlPoint1: CGPoint(x: 242.56, y: 181.9), controlPoint2: CGPoint(x: 56.78, y: 135.24))
        bezier70Path.addCurve(to: CGPoint(x: 214.03, y: 143.35), controlPoint1: CGPoint(x: 195.09, y: 237.96), controlPoint2: CGPoint(x: 96.73, y: 73.6))
        bezier70Path.addCurve(to: CGPoint(x: 202.18, y: 190.52), controlPoint1: CGPoint(x: 121.89, y: 244.03), controlPoint2: CGPoint(x: 168.56, y: 58.26))
        bezier70Path.addCurve(to: CGPoint(x: 160.44, y: 215.5), controlPoint1: CGPoint(x: 65.84, y: 196.56), controlPoint2: CGPoint(x: 230.2, y: 98.2))
        bezier70Path.addCurve(to: CGPoint(x: 113.27, y: 203.65), controlPoint1: CGPoint(x: 59.77, y: 123.37), controlPoint2: CGPoint(x: 245.54, y: 170.03))
        bezier70Path.addCurve(to: CGPoint(x: 88.29, y: 161.92), controlPoint1: CGPoint(x: 107.23, y: 67.31), controlPoint2: CGPoint(x: 205.6, y: 231.67))
        bezier70Path.addCurve(to: CGPoint(x: 100.14, y: 114.74), controlPoint1: CGPoint(x: 180.43, y: 61.24), controlPoint2: CGPoint(x: 133.77, y: 247.01))
        bezier70Path.close()
        strokeColor.setStroke()
        bezier70Path.lineWidth = 1
        bezier70Path.stroke()

        context.restoreGState()


        //// Bezier 71 Drawing
        context.saveGState()
        context.setAlpha(0.41)

        let bezier71Path = UIBezierPath()
        bezier71Path.move(to: CGPoint(x: 99.75, y: 113.57))
        bezier71Path.addCurve(to: CGPoint(x: 142.41, y: 88.64), controlPoint1: CGPoint(x: 238.33, y: 108.89), controlPoint2: CGPoint(x: 70.3, y: 207.07))
        bezier71Path.addCurve(to: CGPoint(x: 190.21, y: 101.18), controlPoint1: CGPoint(x: 243.72, y: 183.32), controlPoint2: CGPoint(x: 55.48, y: 133.94))
        bezier71Path.addCurve(to: CGPoint(x: 215.15, y: 143.85), controlPoint1: CGPoint(x: 194.9, y: 239.76), controlPoint2: CGPoint(x: 96.71, y: 71.74))
        bezier71Path.addCurve(to: CGPoint(x: 202.61, y: 191.65), controlPoint1: CGPoint(x: 120.47, y: 245.15), controlPoint2: CGPoint(x: 169.85, y: 56.91))
        bezier71Path.addCurve(to: CGPoint(x: 159.94, y: 216.58), controlPoint1: CGPoint(x: 64.03, y: 196.33), controlPoint2: CGPoint(x: 232.05, y: 98.15))
        bezier71Path.addCurve(to: CGPoint(x: 112.14, y: 204.04), controlPoint1: CGPoint(x: 58.64, y: 121.9), controlPoint2: CGPoint(x: 246.87, y: 171.29))
        bezier71Path.addCurve(to: CGPoint(x: 87.21, y: 161.37), controlPoint1: CGPoint(x: 107.45, y: 65.46), controlPoint2: CGPoint(x: 205.64, y: 233.49))
        bezier71Path.addCurve(to: CGPoint(x: 99.75, y: 113.57), controlPoint1: CGPoint(x: 181.88, y: 60.07), controlPoint2: CGPoint(x: 132.5, y: 248.31))
        bezier71Path.close()
        strokeColor.setStroke()
        bezier71Path.lineWidth = 1
        bezier71Path.stroke()

        context.restoreGState()


        //// Bezier 72 Drawing
        context.saveGState()
        context.setAlpha(0.42)

        let bezier72Path = UIBezierPath()
        bezier72Path.move(to: CGPoint(x: 99.37, y: 112.39))
        bezier72Path.addCurve(to: CGPoint(x: 142.97, y: 87.52), controlPoint1: CGPoint(x: 240.17, y: 109.11), controlPoint2: CGPoint(x: 68.47, y: 207.04))
        bezier72Path.addCurve(to: CGPoint(x: 191.39, y: 100.77), controlPoint1: CGPoint(x: 244.86, y: 184.76), controlPoint2: CGPoint(x: 54.19, y: 132.6))
        bezier72Path.addCurve(to: CGPoint(x: 216.26, y: 144.37), controlPoint1: CGPoint(x: 194.67, y: 241.57), controlPoint2: CGPoint(x: 96.74, y: 69.87))
        bezier72Path.addCurve(to: CGPoint(x: 203.01, y: 192.78), controlPoint1: CGPoint(x: 119.02, y: 246.25), controlPoint2: CGPoint(x: 171.18, y: 55.59))
        bezier72Path.addCurve(to: CGPoint(x: 159.41, y: 217.65), controlPoint1: CGPoint(x: 62.21, y: 196.07), controlPoint2: CGPoint(x: 233.91, y: 98.13))
        bezier72Path.addCurve(to: CGPoint(x: 111, y: 204.41), controlPoint1: CGPoint(x: 57.53, y: 120.41), controlPoint2: CGPoint(x: 248.19, y: 172.58))
        bezier72Path.addCurve(to: CGPoint(x: 86.13, y: 160.81), controlPoint1: CGPoint(x: 107.71, y: 63.61), controlPoint2: CGPoint(x: 205.65, y: 235.31))
        bezier72Path.addCurve(to: CGPoint(x: 99.37, y: 112.39), controlPoint1: CGPoint(x: 183.37, y: 58.92), controlPoint2: CGPoint(x: 131.2, y: 249.59))
        bezier72Path.close()
        strokeColor.setStroke()
        bezier72Path.lineWidth = 1
        bezier72Path.stroke()

        context.restoreGState()


        //// Bezier 73 Drawing
        context.saveGState()
        context.setAlpha(0.43)

        let bezier73Path = UIBezierPath()
        bezier73Path.move(to: CGPoint(x: 99.01, y: 111.2))
        bezier73Path.addCurve(to: CGPoint(x: 143.55, y: 86.41), controlPoint1: CGPoint(x: 242.03, y: 109.36), controlPoint2: CGPoint(x: 66.63, y: 206.98))
        bezier73Path.addCurve(to: CGPoint(x: 192.58, y: 100.37), controlPoint1: CGPoint(x: 245.98, y: 186.23), controlPoint2: CGPoint(x: 52.92, y: 131.24))
        bezier73Path.addCurve(to: CGPoint(x: 217.37, y: 144.91), controlPoint1: CGPoint(x: 194.41, y: 243.38), controlPoint2: CGPoint(x: 96.79, y: 67.99))
        bezier73Path.addCurve(to: CGPoint(x: 203.4, y: 193.93), controlPoint1: CGPoint(x: 117.54, y: 247.34), controlPoint2: CGPoint(x: 172.53, y: 54.28))
        bezier73Path.addCurve(to: CGPoint(x: 158.86, y: 218.72), controlPoint1: CGPoint(x: 60.39, y: 195.77), controlPoint2: CGPoint(x: 235.79, y: 98.15))
        bezier73Path.addCurve(to: CGPoint(x: 109.84, y: 204.76), controlPoint1: CGPoint(x: 56.44, y: 118.9), controlPoint2: CGPoint(x: 249.49, y: 173.89))
        bezier73Path.addCurve(to: CGPoint(x: 85.05, y: 160.22), controlPoint1: CGPoint(x: 108, y: 61.75), controlPoint2: CGPoint(x: 205.63, y: 237.15))
        bezier73Path.addCurve(to: CGPoint(x: 99.01, y: 111.2), controlPoint1: CGPoint(x: 184.87, y: 57.8), controlPoint2: CGPoint(x: 129.88, y: 250.85))
        bezier73Path.close()
        strokeColor.setStroke()
        bezier73Path.lineWidth = 1
        bezier73Path.stroke()

        context.restoreGState()


        //// Bezier 74 Drawing
        context.saveGState()
        context.setAlpha(0.43)

        let bezier74Path = UIBezierPath()
        bezier74Path.move(to: CGPoint(x: 98.67, y: 109.99))
        bezier74Path.addCurve(to: CGPoint(x: 144.16, y: 85.3), controlPoint1: CGPoint(x: 243.88, y: 109.65), controlPoint2: CGPoint(x: 64.78, y: 206.89))
        bezier74Path.addCurve(to: CGPoint(x: 193.78, y: 100), controlPoint1: CGPoint(x: 247.08, y: 187.73), controlPoint2: CGPoint(x: 51.67, y: 129.85))
        bezier74Path.addCurve(to: CGPoint(x: 218.47, y: 145.48), controlPoint1: CGPoint(x: 194.12, y: 245.2), controlPoint2: CGPoint(x: 96.88, y: 66.1))
        bezier74Path.addCurve(to: CGPoint(x: 203.77, y: 195.1), controlPoint1: CGPoint(x: 116.04, y: 248.4), controlPoint2: CGPoint(x: 173.92, y: 52.99))
        bezier74Path.addCurve(to: CGPoint(x: 158.29, y: 219.79), controlPoint1: CGPoint(x: 58.56, y: 195.44), controlPoint2: CGPoint(x: 237.67, y: 98.2))
        bezier74Path.addCurve(to: CGPoint(x: 108.67, y: 205.09), controlPoint1: CGPoint(x: 55.37, y: 117.36), controlPoint2: CGPoint(x: 250.78, y: 175.24))
        bezier74Path.addCurve(to: CGPoint(x: 83.98, y: 159.61), controlPoint1: CGPoint(x: 108.32, y: 59.88), controlPoint2: CGPoint(x: 205.57, y: 238.99))
        bezier74Path.addCurve(to: CGPoint(x: 98.67, y: 109.99), controlPoint1: CGPoint(x: 186.41, y: 56.69), controlPoint2: CGPoint(x: 128.53, y: 252.1))
        bezier74Path.close()
        strokeColor.setStroke()
        bezier74Path.lineWidth = 1
        bezier74Path.stroke()

        context.restoreGState()


        //// Bezier 75 Drawing
        context.saveGState()
        context.setAlpha(0.44)

        let bezier75Path = UIBezierPath()
        bezier75Path.move(to: CGPoint(x: 98.36, y: 108.77))
        bezier75Path.addCurve(to: CGPoint(x: 144.78, y: 84.19), controlPoint1: CGPoint(x: 245.74, y: 109.97), controlPoint2: CGPoint(x: 62.92, y: 206.76))
        bezier75Path.addCurve(to: CGPoint(x: 194.99, y: 99.64), controlPoint1: CGPoint(x: 248.16, y: 189.25), controlPoint2: CGPoint(x: 50.44, y: 128.43))
        bezier75Path.addCurve(to: CGPoint(x: 219.57, y: 146.06), controlPoint1: CGPoint(x: 193.8, y: 247.03), controlPoint2: CGPoint(x: 97, y: 64.21))
        bezier75Path.addCurve(to: CGPoint(x: 204.12, y: 196.27), controlPoint1: CGPoint(x: 114.51, y: 249.44), controlPoint2: CGPoint(x: 175.33, y: 51.72))
        bezier75Path.addCurve(to: CGPoint(x: 157.7, y: 220.85), controlPoint1: CGPoint(x: 56.74, y: 195.08), controlPoint2: CGPoint(x: 239.56, y: 98.28))
        bezier75Path.addCurve(to: CGPoint(x: 107.49, y: 205.41), controlPoint1: CGPoint(x: 54.32, y: 115.79), controlPoint2: CGPoint(x: 252.04, y: 176.62))
        bezier75Path.addCurve(to: CGPoint(x: 82.91, y: 158.98), controlPoint1: CGPoint(x: 108.68, y: 58.02), controlPoint2: CGPoint(x: 205.48, y: 240.84))
        bezier75Path.addCurve(to: CGPoint(x: 98.36, y: 108.77), controlPoint1: CGPoint(x: 187.97, y: 55.61), controlPoint2: CGPoint(x: 127.14, y: 253.33))
        bezier75Path.close()
        strokeColor.setStroke()
        bezier75Path.lineWidth = 1
        bezier75Path.stroke()

        context.restoreGState()


        //// Bezier 76 Drawing
        context.saveGState()
        context.setAlpha(0.45)

        let bezier76Path = UIBezierPath()
        bezier76Path.move(to: CGPoint(x: 98.06, y: 107.55))
        bezier76Path.addCurve(to: CGPoint(x: 145.43, y: 83.1), controlPoint1: CGPoint(x: 247.61, y: 110.32), controlPoint2: CGPoint(x: 61.06, y: 206.61))
        bezier76Path.addCurve(to: CGPoint(x: 196.21, y: 99.3), controlPoint1: CGPoint(x: 249.21, y: 190.81), controlPoint2: CGPoint(x: 49.22, y: 126.98))
        bezier76Path.addCurve(to: CGPoint(x: 220.66, y: 146.67), controlPoint1: CGPoint(x: 193.44, y: 248.85), controlPoint2: CGPoint(x: 97.15, y: 62.31))
        bezier76Path.addCurve(to: CGPoint(x: 204.45, y: 197.46), controlPoint1: CGPoint(x: 112.95, y: 250.46), controlPoint2: CGPoint(x: 176.78, y: 50.47))
        bezier76Path.addCurve(to: CGPoint(x: 157.08, y: 221.91), controlPoint1: CGPoint(x: 54.91, y: 194.68), controlPoint2: CGPoint(x: 241.45, y: 98.4))
        bezier76Path.addCurve(to: CGPoint(x: 106.3, y: 205.7), controlPoint1: CGPoint(x: 53.3, y: 114.2), controlPoint2: CGPoint(x: 253.29, y: 178.02))
        bezier76Path.addCurve(to: CGPoint(x: 81.85, y: 158.33), controlPoint1: CGPoint(x: 109.08, y: 56.15), controlPoint2: CGPoint(x: 205.36, y: 242.7))
        bezier76Path.addCurve(to: CGPoint(x: 98.06, y: 107.55), controlPoint1: CGPoint(x: 189.56, y: 54.55), controlPoint2: CGPoint(x: 125.73, y: 254.54))
        bezier76Path.close()
        strokeColor.setStroke()
        bezier76Path.lineWidth = 1
        bezier76Path.stroke()

        context.restoreGState()


        //// Bezier 77 Drawing
        context.saveGState()
        context.setAlpha(0.45)

        let bezier77Path = UIBezierPath()
        bezier77Path.move(to: CGPoint(x: 97.78, y: 106.31))
        bezier77Path.addCurve(to: CGPoint(x: 146.1, y: 82), controlPoint1: CGPoint(x: 249.47, y: 110.71), controlPoint2: CGPoint(x: 59.19, y: 206.41))
        bezier77Path.addCurve(to: CGPoint(x: 197.45, y: 98.99), controlPoint1: CGPoint(x: 250.25, y: 192.38), controlPoint2: CGPoint(x: 48.02, y: 125.51))
        bezier77Path.addCurve(to: CGPoint(x: 221.75, y: 147.31), controlPoint1: CGPoint(x: 193.04, y: 250.68), controlPoint2: CGPoint(x: 97.34, y: 60.4))
        bezier77Path.addCurve(to: CGPoint(x: 204.77, y: 198.66), controlPoint1: CGPoint(x: 111.37, y: 251.45), controlPoint2: CGPoint(x: 178.25, y: 49.23))
        bezier77Path.addCurve(to: CGPoint(x: 156.45, y: 222.96), controlPoint1: CGPoint(x: 53.07, y: 194.25), controlPoint2: CGPoint(x: 243.35, y: 98.55))
        bezier77Path.addCurve(to: CGPoint(x: 105.1, y: 205.98), controlPoint1: CGPoint(x: 52.3, y: 112.58), controlPoint2: CGPoint(x: 254.52, y: 179.46))
        bezier77Path.addCurve(to: CGPoint(x: 80.8, y: 157.66), controlPoint1: CGPoint(x: 109.5, y: 54.28), controlPoint2: CGPoint(x: 205.2, y: 244.56))
        bezier77Path.addCurve(to: CGPoint(x: 97.78, y: 106.31), controlPoint1: CGPoint(x: 191.17, y: 53.51), controlPoint2: CGPoint(x: 124.3, y: 255.73))
        bezier77Path.close()
        strokeColor.setStroke()
        bezier77Path.lineWidth = 1
        bezier77Path.stroke()

        context.restoreGState()


        //// Bezier 78 Drawing
        context.saveGState()
        context.setAlpha(0.46)

        let bezier78Path = UIBezierPath()
        bezier78Path.move(to: CGPoint(x: 97.52, y: 105.06))
        bezier78Path.addCurve(to: CGPoint(x: 146.79, y: 80.92), controlPoint1: CGPoint(x: 251.34, y: 111.14), controlPoint2: CGPoint(x: 57.31, y: 206.19))
        bezier78Path.addCurve(to: CGPoint(x: 198.69, y: 98.69), controlPoint1: CGPoint(x: 251.26, y: 193.99), controlPoint2: CGPoint(x: 46.85, y: 124))
        bezier78Path.addCurve(to: CGPoint(x: 222.83, y: 147.96), controlPoint1: CGPoint(x: 192.61, y: 252.51), controlPoint2: CGPoint(x: 97.56, y: 58.49))
        bezier78Path.addCurve(to: CGPoint(x: 205.06, y: 199.87), controlPoint1: CGPoint(x: 109.76, y: 252.43), controlPoint2: CGPoint(x: 179.75, y: 48.02))
        bezier78Path.addCurve(to: CGPoint(x: 155.79, y: 224), controlPoint1: CGPoint(x: 51.24, y: 193.79), controlPoint2: CGPoint(x: 245.26, y: 98.73))
        bezier78Path.addCurve(to: CGPoint(x: 103.88, y: 206.23), controlPoint1: CGPoint(x: 51.32, y: 110.94), controlPoint2: CGPoint(x: 255.73, y: 180.92))
        bezier78Path.addCurve(to: CGPoint(x: 79.75, y: 156.96), controlPoint1: CGPoint(x: 109.96, y: 52.41), controlPoint2: CGPoint(x: 205.02, y: 246.44))
        bezier78Path.addCurve(to: CGPoint(x: 97.52, y: 105.06), controlPoint1: CGPoint(x: 192.81, y: 52.49), controlPoint2: CGPoint(x: 122.83, y: 256.9))
        bezier78Path.close()
        strokeColor.setStroke()
        bezier78Path.lineWidth = 1
        bezier78Path.stroke()

        context.restoreGState()


        //// Bezier 79 Drawing
        context.saveGState()
        context.setAlpha(0.47)

        let bezier79Path = UIBezierPath()
        bezier79Path.move(to: CGPoint(x: 97.28, y: 103.8))
        bezier79Path.addCurve(to: CGPoint(x: 147.5, y: 79.84), controlPoint1: CGPoint(x: 253.21, y: 111.6), controlPoint2: CGPoint(x: 55.43, y: 205.93))
        bezier79Path.addCurve(to: CGPoint(x: 199.95, y: 98.42), controlPoint1: CGPoint(x: 252.24, y: 195.62), controlPoint2: CGPoint(x: 45.69, y: 122.47))
        bezier79Path.addCurve(to: CGPoint(x: 223.91, y: 148.64), controlPoint1: CGPoint(x: 192.15, y: 254.34), controlPoint2: CGPoint(x: 97.82, y: 56.57))
        bezier79Path.addCurve(to: CGPoint(x: 205.33, y: 201.09), controlPoint1: CGPoint(x: 108.13, y: 253.38), controlPoint2: CGPoint(x: 181.28, y: 46.83))
        bezier79Path.addCurve(to: CGPoint(x: 155.11, y: 225.04), controlPoint1: CGPoint(x: 49.4, y: 193.29), controlPoint2: CGPoint(x: 247.18, y: 98.95))
        bezier79Path.addCurve(to: CGPoint(x: 102.66, y: 206.47), controlPoint1: CGPoint(x: 50.37, y: 109.27), controlPoint2: CGPoint(x: 256.92, y: 182.41))
        bezier79Path.addCurve(to: CGPoint(x: 78.71, y: 156.25), controlPoint1: CGPoint(x: 110.46, y: 50.54), controlPoint2: CGPoint(x: 204.79, y: 248.31))
        bezier79Path.addCurve(to: CGPoint(x: 97.28, y: 103.8), controlPoint1: CGPoint(x: 194.48, y: 51.5), controlPoint2: CGPoint(x: 121.34, y: 258.06))
        bezier79Path.close()
        strokeColor.setStroke()
        bezier79Path.lineWidth = 1
        bezier79Path.stroke()

        context.restoreGState()


        //// Bezier 80 Drawing
        context.saveGState()
        context.setAlpha(0.47)

        let bezier80Path = UIBezierPath()
        bezier80Path.move(to: CGPoint(x: 97.06, y: 102.53))
        bezier80Path.addCurve(to: CGPoint(x: 148.24, y: 78.77), controlPoint1: CGPoint(x: 255.08, y: 112.09), controlPoint2: CGPoint(x: 53.55, y: 205.64))
        bezier80Path.addCurve(to: CGPoint(x: 201.22, y: 98.16), controlPoint1: CGPoint(x: 253.21, y: 197.27), controlPoint2: CGPoint(x: 44.56, y: 120.91))
        bezier80Path.addCurve(to: CGPoint(x: 224.98, y: 149.34), controlPoint1: CGPoint(x: 191.66, y: 256.18), controlPoint2: CGPoint(x: 98.11, y: 54.65))
        bezier80Path.addCurve(to: CGPoint(x: 205.59, y: 202.32), controlPoint1: CGPoint(x: 106.48, y: 254.31), controlPoint2: CGPoint(x: 182.83, y: 45.66))
        bezier80Path.addCurve(to: CGPoint(x: 154.41, y: 226.07), controlPoint1: CGPoint(x: 47.57, y: 192.76), controlPoint2: CGPoint(x: 249.1, y: 99.21))
        bezier80Path.addCurve(to: CGPoint(x: 101.43, y: 206.69), controlPoint1: CGPoint(x: 49.44, y: 107.58), controlPoint2: CGPoint(x: 258.09, y: 183.93))
        bezier80Path.addCurve(to: CGPoint(x: 77.67, y: 155.51), controlPoint1: CGPoint(x: 110.99, y: 48.67), controlPoint2: CGPoint(x: 204.54, y: 250.2))
        bezier80Path.addCurve(to: CGPoint(x: 97.06, y: 102.53), controlPoint1: CGPoint(x: 196.17, y: 50.54), controlPoint2: CGPoint(x: 119.81, y: 259.19))
        bezier80Path.close()
        strokeColor.setStroke()
        bezier80Path.lineWidth = 1
        bezier80Path.stroke()

        context.restoreGState()


        //// Bezier 81 Drawing
        context.saveGState()
        context.setAlpha(0.48)

        let bezier81Path = UIBezierPath()
        bezier81Path.move(to: CGPoint(x: 96.86, y: 101.25))
        bezier81Path.addCurve(to: CGPoint(x: 148.99, y: 77.71), controlPoint1: CGPoint(x: 256.95, y: 112.62), controlPoint2: CGPoint(x: 51.66, y: 205.31))
        bezier81Path.addCurve(to: CGPoint(x: 202.5, y: 97.93), controlPoint1: CGPoint(x: 254.15, y: 198.95), controlPoint2: CGPoint(x: 43.44, y: 119.33))
        bezier81Path.addCurve(to: CGPoint(x: 226.04, y: 150.06), controlPoint1: CGPoint(x: 191.13, y: 258.01), controlPoint2: CGPoint(x: 98.43, y: 52.72))
        bezier81Path.addCurve(to: CGPoint(x: 205.82, y: 203.56), controlPoint1: CGPoint(x: 104.8, y: 255.21), controlPoint2: CGPoint(x: 184.42, y: 44.51))
        bezier81Path.addCurve(to: CGPoint(x: 153.69, y: 227.1), controlPoint1: CGPoint(x: 45.73, y: 192.19), controlPoint2: CGPoint(x: 251.03, y: 99.5))
        bezier81Path.addCurve(to: CGPoint(x: 100.18, y: 206.88), controlPoint1: CGPoint(x: 48.53, y: 105.86), controlPoint2: CGPoint(x: 259.24, y: 185.48))
        bezier81Path.addCurve(to: CGPoint(x: 76.65, y: 154.75), controlPoint1: CGPoint(x: 111.56, y: 46.8), controlPoint2: CGPoint(x: 204.25, y: 252.09))
        bezier81Path.addCurve(to: CGPoint(x: 96.86, y: 101.25), controlPoint1: CGPoint(x: 197.88, y: 49.6), controlPoint2: CGPoint(x: 118.27, y: 260.3))
        bezier81Path.close()
        strokeColor.setStroke()
        bezier81Path.lineWidth = 1
        bezier81Path.stroke()

        context.restoreGState()


        //// Bezier 82 Drawing
        context.saveGState()
        context.setAlpha(0.49)

        let bezier82Path = UIBezierPath()
        bezier82Path.move(to: CGPoint(x: 96.69, y: 99.96))
        bezier82Path.addCurve(to: CGPoint(x: 149.77, y: 76.65), controlPoint1: CGPoint(x: 258.82, y: 113.18), controlPoint2: CGPoint(x: 49.76, y: 204.95))
        bezier82Path.addCurve(to: CGPoint(x: 203.79, y: 97.71), controlPoint1: CGPoint(x: 255.07, y: 200.65), controlPoint2: CGPoint(x: 42.35, y: 117.72))
        bezier82Path.addCurve(to: CGPoint(x: 227.09, y: 150.8), controlPoint1: CGPoint(x: 190.56, y: 259.85), controlPoint2: CGPoint(x: 98.79, y: 50.79))
        bezier82Path.addCurve(to: CGPoint(x: 206.03, y: 204.82), controlPoint1: CGPoint(x: 103.09, y: 256.09), controlPoint2: CGPoint(x: 186.03, y: 43.38))
        bezier82Path.addCurve(to: CGPoint(x: 152.95, y: 228.12), controlPoint1: CGPoint(x: 43.9, y: 191.59), controlPoint2: CGPoint(x: 252.95, y: 99.82))
        bezier82Path.addCurve(to: CGPoint(x: 98.93, y: 207.06), controlPoint1: CGPoint(x: 47.65, y: 104.12), controlPoint2: CGPoint(x: 260.37, y: 187.06))
        bezier82Path.addCurve(to: CGPoint(x: 75.63, y: 153.97), controlPoint1: CGPoint(x: 112.16, y: 44.93), controlPoint2: CGPoint(x: 203.92, y: 253.98))
        bezier82Path.addCurve(to: CGPoint(x: 96.69, y: 99.96), controlPoint1: CGPoint(x: 199.62, y: 48.68), controlPoint2: CGPoint(x: 116.69, y: 261.4))
        bezier82Path.close()
        strokeColor.setStroke()
        bezier82Path.lineWidth = 1
        bezier82Path.stroke()

        context.restoreGState()


        //// Bezier 83 Drawing
        context.saveGState()
        context.setAlpha(0.49)

        let bezier83Path = UIBezierPath()
        bezier83Path.move(to: CGPoint(x: 96.53, y: 98.66))
        bezier83Path.addCurve(to: CGPoint(x: 150.57, y: 75.61), controlPoint1: CGPoint(x: 260.69, y: 113.78), controlPoint2: CGPoint(x: 47.87, y: 204.56))
        bezier83Path.addCurve(to: CGPoint(x: 205.09, y: 97.52), controlPoint1: CGPoint(x: 255.96, y: 202.38), controlPoint2: CGPoint(x: 41.28, y: 116.08))
        bezier83Path.addCurve(to: CGPoint(x: 228.14, y: 151.57), controlPoint1: CGPoint(x: 189.96, y: 261.68), controlPoint2: CGPoint(x: 99.19, y: 48.86))
        bezier83Path.addCurve(to: CGPoint(x: 206.22, y: 206.08), controlPoint1: CGPoint(x: 101.37, y: 256.95), controlPoint2: CGPoint(x: 187.67, y: 42.27))
        bezier83Path.addCurve(to: CGPoint(x: 152.18, y: 229.13), controlPoint1: CGPoint(x: 42.06, y: 190.96), controlPoint2: CGPoint(x: 254.89, y: 100.18))
        bezier83Path.addCurve(to: CGPoint(x: 97.67, y: 207.22), controlPoint1: CGPoint(x: 46.8, y: 102.36), controlPoint2: CGPoint(x: 261.47, y: 188.66))
        bezier83Path.addCurve(to: CGPoint(x: 74.61, y: 153.17), controlPoint1: CGPoint(x: 112.79, y: 43.06), controlPoint2: CGPoint(x: 203.57, y: 255.88))
        bezier83Path.addCurve(to: CGPoint(x: 96.53, y: 98.66), controlPoint1: CGPoint(x: 201.39, y: 47.79), controlPoint2: CGPoint(x: 115.09, y: 262.47))
        bezier83Path.close()
        strokeColor.setStroke()
        bezier83Path.lineWidth = 1
        bezier83Path.stroke()

        context.restoreGState()


        //// Bezier 84 Drawing
        context.saveGState()
        context.setAlpha(0.5)

        let bezier84Path = UIBezierPath()
        bezier84Path.move(to: CGPoint(x: 96.39, y: 97.35))
        bezier84Path.addCurve(to: CGPoint(x: 151.39, y: 74.57), controlPoint1: CGPoint(x: 262.56, y: 114.42), controlPoint2: CGPoint(x: 45.96, y: 204.13))
        bezier84Path.addCurve(to: CGPoint(x: 206.4, y: 97.35), controlPoint1: CGPoint(x: 256.82, y: 204.13), controlPoint2: CGPoint(x: 40.23, y: 114.42))
        bezier84Path.addCurve(to: CGPoint(x: 229.18, y: 152.35), controlPoint1: CGPoint(x: 189.33, y: 263.52), controlPoint2: CGPoint(x: 99.61, y: 46.92))
        bezier84Path.addCurve(to: CGPoint(x: 206.4, y: 207.35), controlPoint1: CGPoint(x: 99.61, y: 257.78), controlPoint2: CGPoint(x: 189.33, y: 41.19))
        bezier84Path.addCurve(to: CGPoint(x: 151.39, y: 230.14), controlPoint1: CGPoint(x: 40.23, y: 190.29), controlPoint2: CGPoint(x: 256.82, y: 100.57))
        bezier84Path.addCurve(to: CGPoint(x: 96.39, y: 207.35), controlPoint1: CGPoint(x: 45.96, y: 100.57), controlPoint2: CGPoint(x: 262.56, y: 190.29))
        bezier84Path.addCurve(to: CGPoint(x: 73.61, y: 152.35), controlPoint1: CGPoint(x: 113.46, y: 41.19), controlPoint2: CGPoint(x: 203.17, y: 257.78))
        bezier84Path.addCurve(to: CGPoint(x: 96.39, y: 97.35), controlPoint1: CGPoint(x: 203.18, y: 46.92), controlPoint2: CGPoint(x: 113.46, y: 263.52))
        bezier84Path.close()
        strokeColor.setStroke()
        bezier84Path.lineWidth = 1
        bezier84Path.stroke()

        context.restoreGState()


        //// Bezier 85 Drawing
        context.saveGState()
        context.setAlpha(0.5)

        let bezier85Path = UIBezierPath()
        bezier85Path.move(to: CGPoint(x: 96.28, y: 96.04))
        bezier85Path.addCurve(to: CGPoint(x: 152.24, y: 73.54), controlPoint1: CGPoint(x: 264.43, y: 115.09), controlPoint2: CGPoint(x: 44.06, y: 203.67))
        bezier85Path.addCurve(to: CGPoint(x: 207.71, y: 97.2), controlPoint1: CGPoint(x: 257.67, y: 205.91), controlPoint2: CGPoint(x: 39.2, y: 112.73))
        bezier85Path.addCurve(to: CGPoint(x: 230.21, y: 153.16), controlPoint1: CGPoint(x: 188.66, y: 265.35), controlPoint2: CGPoint(x: 100.08, y: 44.98))
        bezier85Path.addCurve(to: CGPoint(x: 206.55, y: 208.64), controlPoint1: CGPoint(x: 97.84, y: 258.59), controlPoint2: CGPoint(x: 191.02, y: 40.13))
        bezier85Path.addCurve(to: CGPoint(x: 150.59, y: 231.13), controlPoint1: CGPoint(x: 38.4, y: 189.59), controlPoint2: CGPoint(x: 258.76, y: 101))
        bezier85Path.addCurve(to: CGPoint(x: 95.11, y: 207.47), controlPoint1: CGPoint(x: 45.16, y: 98.76), controlPoint2: CGPoint(x: 263.62, y: 191.95))
        bezier85Path.addCurve(to: CGPoint(x: 72.62, y: 151.51), controlPoint1: CGPoint(x: 114.16, y: 39.32), controlPoint2: CGPoint(x: 202.75, y: 259.69))
        bezier85Path.addCurve(to: CGPoint(x: 96.28, y: 96.04), controlPoint1: CGPoint(x: 204.99, y: 46.08), controlPoint2: CGPoint(x: 111.8, y: 264.54))
        bezier85Path.close()
        strokeColor.setStroke()
        bezier85Path.lineWidth = 1
        bezier85Path.stroke()

        context.restoreGState()


        //// Bezier 86 Drawing
        context.saveGState()
        context.setAlpha(0.51)

        let bezier86Path = UIBezierPath()
        bezier86Path.move(to: CGPoint(x: 96.19, y: 94.71))
        bezier86Path.addCurve(to: CGPoint(x: 153.1, y: 72.52), controlPoint1: CGPoint(x: 266.29, y: 115.79), controlPoint2: CGPoint(x: 42.16, y: 203.18))
        bezier86Path.addCurve(to: CGPoint(x: 209.04, y: 97.08), controlPoint1: CGPoint(x: 258.48, y: 207.71), controlPoint2: CGPoint(x: 38.2, y: 111.01))
        bezier86Path.addCurve(to: CGPoint(x: 231.23, y: 153.99), controlPoint1: CGPoint(x: 187.96, y: 267.18), controlPoint2: CGPoint(x: 100.57, y: 43.05))
        bezier86Path.addCurve(to: CGPoint(x: 206.68, y: 209.93), controlPoint1: CGPoint(x: 96.04, y: 259.37), controlPoint2: CGPoint(x: 192.74, y: 39.09))
        bezier86Path.addCurve(to: CGPoint(x: 149.76, y: 232.12), controlPoint1: CGPoint(x: 36.57, y: 188.85), controlPoint2: CGPoint(x: 260.71, y: 101.46))
        bezier86Path.addCurve(to: CGPoint(x: 93.82, y: 207.56), controlPoint1: CGPoint(x: 44.38, y: 96.93), controlPoint2: CGPoint(x: 264.66, y: 193.63))
        bezier86Path.addCurve(to: CGPoint(x: 71.63, y: 150.65), controlPoint1: CGPoint(x: 114.9, y: 37.46), controlPoint2: CGPoint(x: 202.29, y: 261.6))
        bezier86Path.addCurve(to: CGPoint(x: 96.19, y: 94.71), controlPoint1: CGPoint(x: 206.82, y: 45.27), controlPoint2: CGPoint(x: 110.12, y: 265.55))
        bezier86Path.close()
        strokeColor.setStroke()
        bezier86Path.lineWidth = 1
        bezier86Path.stroke()

        context.restoreGState()


        //// Bezier 87 Drawing
        context.saveGState()
        context.setAlpha(0.52)

        let bezier87Path = UIBezierPath()
        bezier87Path.move(to: CGPoint(x: 96.12, y: 93.38))
        bezier87Path.addCurve(to: CGPoint(x: 153.99, y: 71.51), controlPoint1: CGPoint(x: 268.15, y: 116.53), controlPoint2: CGPoint(x: 40.25, y: 202.65))
        bezier87Path.addCurve(to: CGPoint(x: 210.37, y: 96.97), controlPoint1: CGPoint(x: 259.27, y: 209.53), controlPoint2: CGPoint(x: 37.22, y: 109.27))
        bezier87Path.addCurve(to: CGPoint(x: 232.24, y: 154.84), controlPoint1: CGPoint(x: 187.23, y: 269.01), controlPoint2: CGPoint(x: 101.11, y: 41.1))
        bezier87Path.addCurve(to: CGPoint(x: 206.78, y: 211.23), controlPoint1: CGPoint(x: 94.22, y: 260.12), controlPoint2: CGPoint(x: 194.48, y: 38.08))
        bezier87Path.addCurve(to: CGPoint(x: 148.91, y: 233.1), controlPoint1: CGPoint(x: 34.75, y: 188.08), controlPoint2: CGPoint(x: 262.65, y: 101.96))
        bezier87Path.addCurve(to: CGPoint(x: 92.53, y: 207.64), controlPoint1: CGPoint(x: 43.63, y: 95.08), controlPoint2: CGPoint(x: 265.68, y: 195.34))
        bezier87Path.addCurve(to: CGPoint(x: 70.66, y: 149.77), controlPoint1: CGPoint(x: 115.67, y: 35.6), controlPoint2: CGPoint(x: 201.79, y: 263.5))
        bezier87Path.addCurve(to: CGPoint(x: 96.12, y: 93.38), controlPoint1: CGPoint(x: 208.68, y: 44.49), controlPoint2: CGPoint(x: 108.42, y: 266.53))
        bezier87Path.close()
        strokeColor.setStroke()
        bezier87Path.lineWidth = 1
        bezier87Path.stroke()

        context.restoreGState()


        //// Bezier 88 Drawing
        context.saveGState()
        context.setAlpha(0.52)

        let bezier88Path = UIBezierPath()
        bezier88Path.move(to: CGPoint(x: 96.07, y: 92.04))
        bezier88Path.addCurve(to: CGPoint(x: 154.9, y: 70.51), controlPoint1: CGPoint(x: 270.01, y: 117.3), controlPoint2: CGPoint(x: 38.34, y: 202.08))
        bezier88Path.addCurve(to: CGPoint(x: 211.72, y: 96.89), controlPoint1: CGPoint(x: 260.03, y: 211.38), controlPoint2: CGPoint(x: 36.27, y: 107.51))
        bezier88Path.addCurve(to: CGPoint(x: 233.25, y: 155.72), controlPoint1: CGPoint(x: 186.45, y: 270.84), controlPoint2: CGPoint(x: 101.68, y: 39.16))
        bezier88Path.addCurve(to: CGPoint(x: 206.87, y: 212.54), controlPoint1: CGPoint(x: 92.38, y: 260.85), controlPoint2: CGPoint(x: 196.25, y: 37.09))
        bezier88Path.addCurve(to: CGPoint(x: 148.04, y: 234.07), controlPoint1: CGPoint(x: 32.92, y: 187.28), controlPoint2: CGPoint(x: 264.59, y: 102.5))
        bezier88Path.addCurve(to: CGPoint(x: 91.22, y: 207.69), controlPoint1: CGPoint(x: 42.91, y: 93.21), controlPoint2: CGPoint(x: 266.67, y: 197.07))
        bezier88Path.addCurve(to: CGPoint(x: 69.69, y: 148.86), controlPoint1: CGPoint(x: 116.48, y: 33.75), controlPoint2: CGPoint(x: 201.26, y: 265.42))
        bezier88Path.addCurve(to: CGPoint(x: 96.07, y: 92.04), controlPoint1: CGPoint(x: 210.55, y: 43.73), controlPoint2: CGPoint(x: 106.69, y: 267.49))
        bezier88Path.close()
        strokeColor.setStroke()
        bezier88Path.lineWidth = 1
        bezier88Path.stroke()

        context.restoreGState()


        //// Bezier 89 Drawing
        context.saveGState()
        context.setAlpha(0.53)

        let bezier89Path = UIBezierPath()
        bezier89Path.move(to: CGPoint(x: 96.04, y: 90.7))
        bezier89Path.addCurve(to: CGPoint(x: 155.82, y: 69.52), controlPoint1: CGPoint(x: 271.87, y: 118.11), controlPoint2: CGPoint(x: 36.44, y: 201.49))
        bezier89Path.addCurve(to: CGPoint(x: 213.07, y: 96.83), controlPoint1: CGPoint(x: 260.77, y: 213.24), controlPoint2: CGPoint(x: 35.34, y: 105.72))
        bezier89Path.addCurve(to: CGPoint(x: 234.24, y: 156.61), controlPoint1: CGPoint(x: 185.65, y: 272.66), controlPoint2: CGPoint(x: 102.28, y: 37.22))
        bezier89Path.addCurve(to: CGPoint(x: 206.94, y: 213.86), controlPoint1: CGPoint(x: 90.52, y: 261.55), controlPoint2: CGPoint(x: 198.05, y: 36.12))
        bezier89Path.addCurve(to: CGPoint(x: 147.15, y: 235.03), controlPoint1: CGPoint(x: 31.11, y: 186.44), controlPoint2: CGPoint(x: 266.54, y: 103.07))
        bezier89Path.addCurve(to: CGPoint(x: 89.91, y: 207.72), controlPoint1: CGPoint(x: 42.21, y: 91.31), controlPoint2: CGPoint(x: 267.64, y: 198.83))
        bezier89Path.addCurve(to: CGPoint(x: 68.74, y: 147.94), controlPoint1: CGPoint(x: 117.33, y: 31.89), controlPoint2: CGPoint(x: 200.7, y: 267.33))
        bezier89Path.addCurve(to: CGPoint(x: 96.04, y: 90.7), controlPoint1: CGPoint(x: 212.45, y: 43), controlPoint2: CGPoint(x: 104.93, y: 268.43))
        bezier89Path.close()
        strokeColor.setStroke()
        bezier89Path.lineWidth = 1
        bezier89Path.stroke()

        context.restoreGState()


        //// Bezier 90 Drawing
        context.saveGState()
        context.setAlpha(0.54)

        let bezier90Path = UIBezierPath()
        bezier90Path.move(to: CGPoint(x: 96.03, y: 89.34))
        bezier90Path.addCurve(to: CGPoint(x: 156.77, y: 68.55), controlPoint1: CGPoint(x: 273.72, y: 118.96), controlPoint2: CGPoint(x: 34.53, y: 200.85))
        bezier90Path.addCurve(to: CGPoint(x: 214.43, y: 96.79), controlPoint1: CGPoint(x: 261.47, y: 215.13), controlPoint2: CGPoint(x: 34.43, y: 103.91))
        bezier90Path.addCurve(to: CGPoint(x: 235.22, y: 157.53), controlPoint1: CGPoint(x: 184.81, y: 274.48), controlPoint2: CGPoint(x: 102.92, y: 35.28))
        bezier90Path.addCurve(to: CGPoint(x: 206.98, y: 215.18), controlPoint1: CGPoint(x: 88.64, y: 262.23), controlPoint2: CGPoint(x: 199.86, y: 35.19))
        bezier90Path.addCurve(to: CGPoint(x: 146.24, y: 235.98), controlPoint1: CGPoint(x: 29.29, y: 185.57), controlPoint2: CGPoint(x: 268.49, y: 103.67))
        bezier90Path.addCurve(to: CGPoint(x: 88.59, y: 207.73), controlPoint1: CGPoint(x: 41.54, y: 89.39), controlPoint2: CGPoint(x: 268.58, y: 200.62))
        bezier90Path.addCurve(to: CGPoint(x: 67.79, y: 147), controlPoint1: CGPoint(x: 118.2, y: 30.05), controlPoint2: CGPoint(x: 200.1, y: 269.24))
        bezier90Path.addCurve(to: CGPoint(x: 96.03, y: 89.34), controlPoint1: CGPoint(x: 214.38, y: 42.3), controlPoint2: CGPoint(x: 103.15, y: 269.34))
        bezier90Path.close()
        strokeColor.setStroke()
        bezier90Path.lineWidth = 1
        bezier90Path.stroke()

        context.restoreGState()


        //// Bezier 91 Drawing
        context.saveGState()
        context.setAlpha(0.54)

        let bezier91Path = UIBezierPath()
        bezier91Path.move(to: CGPoint(x: 96.05, y: 87.98))
        bezier91Path.addCurve(to: CGPoint(x: 157.74, y: 67.58), controlPoint1: CGPoint(x: 275.57, y: 119.84), controlPoint2: CGPoint(x: 32.62, y: 200.19))
        bezier91Path.addCurve(to: CGPoint(x: 215.79, y: 96.77), controlPoint1: CGPoint(x: 262.15, y: 217.04), controlPoint2: CGPoint(x: 33.55, y: 102.07))
        bezier91Path.addCurve(to: CGPoint(x: 236.2, y: 158.47), controlPoint1: CGPoint(x: 183.94, y: 276.29), controlPoint2: CGPoint(x: 103.59, y: 33.34))
        bezier91Path.addCurve(to: CGPoint(x: 207, y: 216.52), controlPoint1: CGPoint(x: 86.73, y: 262.88), controlPoint2: CGPoint(x: 201.71, y: 34.27))
        bezier91Path.addCurve(to: CGPoint(x: 145.31, y: 236.92), controlPoint1: CGPoint(x: 27.49, y: 184.66), controlPoint2: CGPoint(x: 270.43, y: 104.31))
        bezier91Path.addCurve(to: CGPoint(x: 87.26, y: 207.72), controlPoint1: CGPoint(x: 40.9, y: 87.46), controlPoint2: CGPoint(x: 269.5, y: 202.43))
        bezier91Path.addCurve(to: CGPoint(x: 66.86, y: 146.03), controlPoint1: CGPoint(x: 119.12, y: 28.21), controlPoint2: CGPoint(x: 199.46, y: 271.15))
        bezier91Path.addCurve(to: CGPoint(x: 96.05, y: 87.98), controlPoint1: CGPoint(x: 216.32, y: 41.62), controlPoint2: CGPoint(x: 101.34, y: 270.23))
        bezier91Path.close()
        strokeColor.setStroke()
        bezier91Path.lineWidth = 1
        bezier91Path.stroke()

        context.restoreGState()


        //// Bezier 92 Drawing
        context.saveGState()
        context.setAlpha(0.55)

        let bezier92Path = UIBezierPath()
        bezier92Path.move(to: CGPoint(x: 96.09, y: 86.62))
        bezier92Path.addCurve(to: CGPoint(x: 158.73, y: 66.62), controlPoint1: CGPoint(x: 277.41, y: 120.76), controlPoint2: CGPoint(x: 30.71, y: 199.49))
        bezier92Path.addCurve(to: CGPoint(x: 217.17, y: 96.78), controlPoint1: CGPoint(x: 262.8, y: 218.98), controlPoint2: CGPoint(x: 32.7, y: 100.21))
        bezier92Path.addCurve(to: CGPoint(x: 237.16, y: 159.43), controlPoint1: CGPoint(x: 183.03, y: 278.1), controlPoint2: CGPoint(x: 104.3, y: 31.41))
        bezier92Path.addCurve(to: CGPoint(x: 207, y: 217.86), controlPoint1: CGPoint(x: 84.81, y: 263.5), controlPoint2: CGPoint(x: 203.58, y: 33.39))
        bezier92Path.addCurve(to: CGPoint(x: 144.36, y: 237.85), controlPoint1: CGPoint(x: 25.68, y: 183.72), controlPoint2: CGPoint(x: 272.38, y: 104.99))
        bezier92Path.addCurve(to: CGPoint(x: 85.92, y: 207.69), controlPoint1: CGPoint(x: 40.29, y: 85.5), controlPoint2: CGPoint(x: 270.4, y: 204.27))
        bezier92Path.addCurve(to: CGPoint(x: 65.93, y: 145.05), controlPoint1: CGPoint(x: 120.06, y: 26.37), controlPoint2: CGPoint(x: 198.79, y: 273.07))
        bezier92Path.addCurve(to: CGPoint(x: 96.09, y: 86.62), controlPoint1: CGPoint(x: 218.28, y: 40.98), controlPoint2: CGPoint(x: 99.52, y: 271.09))
        bezier92Path.close()
        strokeColor.setStroke()
        bezier92Path.lineWidth = 1
        bezier92Path.stroke()

        context.restoreGState()


        //// Bezier 93 Drawing
        context.saveGState()
        context.setAlpha(0.56)

        let bezier93Path = UIBezierPath()
        bezier93Path.move(to: CGPoint(x: 96.15, y: 85.24))
        bezier93Path.addCurve(to: CGPoint(x: 159.75, y: 65.68), controlPoint1: CGPoint(x: 279.24, y: 121.71), controlPoint2: CGPoint(x: 28.81, y: 198.75))
        bezier93Path.addCurve(to: CGPoint(x: 218.55, y: 96.81), controlPoint1: CGPoint(x: 263.43, y: 220.93), controlPoint2: CGPoint(x: 31.87, y: 98.32))
        bezier93Path.addCurve(to: CGPoint(x: 238.11, y: 160.41), controlPoint1: CGPoint(x: 182.08, y: 279.9), controlPoint2: CGPoint(x: 105.04, y: 29.47))
        bezier93Path.addCurve(to: CGPoint(x: 206.98, y: 219.21), controlPoint1: CGPoint(x: 82.86, y: 264.09), controlPoint2: CGPoint(x: 205.47, y: 32.53))
        bezier93Path.addCurve(to: CGPoint(x: 143.38, y: 238.77), controlPoint1: CGPoint(x: 23.89, y: 182.74), controlPoint2: CGPoint(x: 274.32, y: 105.7))
        bezier93Path.addCurve(to: CGPoint(x: 84.58, y: 207.64), controlPoint1: CGPoint(x: 39.7, y: 83.52), controlPoint2: CGPoint(x: 271.26, y: 206.13))
        bezier93Path.addCurve(to: CGPoint(x: 65.02, y: 144.04), controlPoint1: CGPoint(x: 121.05, y: 24.55), controlPoint2: CGPoint(x: 198.09, y: 274.98))
        bezier93Path.addCurve(to: CGPoint(x: 96.15, y: 85.24), controlPoint1: CGPoint(x: 220.27, y: 40.36), controlPoint2: CGPoint(x: 97.66, y: 271.92))
        bezier93Path.close()
        strokeColor.setStroke()
        bezier93Path.lineWidth = 1
        bezier93Path.stroke()

        context.restoreGState()


        //// Bezier 94 Drawing
        context.saveGState()
        context.setAlpha(0.56)

        let bezier94Path = UIBezierPath()
        bezier94Path.move(to: CGPoint(x: 96.24, y: 83.87))
        bezier94Path.addCurve(to: CGPoint(x: 160.78, y: 64.75), controlPoint1: CGPoint(x: 281.07, y: 122.69), controlPoint2: CGPoint(x: 26.91, y: 197.98))
        bezier94Path.addCurve(to: CGPoint(x: 219.93, y: 96.87), controlPoint1: CGPoint(x: 264.02, y: 222.9), controlPoint2: CGPoint(x: 31.06, y: 96.42))
        bezier94Path.addCurve(to: CGPoint(x: 239.05, y: 161.41), controlPoint1: CGPoint(x: 181.11, y: 281.7), controlPoint2: CGPoint(x: 105.82, y: 27.54))
        bezier94Path.addCurve(to: CGPoint(x: 206.93, y: 220.56), controlPoint1: CGPoint(x: 80.9, y: 264.65), controlPoint2: CGPoint(x: 207.38, y: 31.69))
        bezier94Path.addCurve(to: CGPoint(x: 142.39, y: 239.68), controlPoint1: CGPoint(x: 22.1, y: 181.73), controlPoint2: CGPoint(x: 276.26, y: 106.45))
        bezier94Path.addCurve(to: CGPoint(x: 83.24, y: 207.56), controlPoint1: CGPoint(x: 39.15, y: 81.53), controlPoint2: CGPoint(x: 272.11, y: 208.01))
        bezier94Path.addCurve(to: CGPoint(x: 64.12, y: 143.02), controlPoint1: CGPoint(x: 122.06, y: 22.73), controlPoint2: CGPoint(x: 197.35, y: 276.89))
        bezier94Path.addCurve(to: CGPoint(x: 96.24, y: 83.87), controlPoint1: CGPoint(x: 222.27, y: 39.78), controlPoint2: CGPoint(x: 95.79, y: 272.73))
        bezier94Path.close()
        strokeColor.setStroke()
        bezier94Path.lineWidth = 1
        bezier94Path.stroke()

        context.restoreGState()


        //// Bezier 95 Drawing
        context.saveGState()
        context.setAlpha(0.57)

        let bezier95Path = UIBezierPath()
        bezier95Path.move(to: CGPoint(x: 96.34, y: 82.48))
        bezier95Path.addCurve(to: CGPoint(x: 161.83, y: 63.83), controlPoint1: CGPoint(x: 282.89, y: 123.71), controlPoint2: CGPoint(x: 25.01, y: 197.17))
        bezier95Path.addCurve(to: CGPoint(x: 221.33, y: 96.94), controlPoint1: CGPoint(x: 264.58, y: 224.89), controlPoint2: CGPoint(x: 30.29, y: 94.49))
        bezier95Path.addCurve(to: CGPoint(x: 239.98, y: 162.43), controlPoint1: CGPoint(x: 180.09, y: 283.49), controlPoint2: CGPoint(x: 106.63, y: 25.61))
        bezier95Path.addCurve(to: CGPoint(x: 206.86, y: 221.92), controlPoint1: CGPoint(x: 78.91, y: 265.18), controlPoint2: CGPoint(x: 209.32, y: 30.89))
        bezier95Path.addCurve(to: CGPoint(x: 141.38, y: 240.58), controlPoint1: CGPoint(x: 20.31, y: 180.69), controlPoint2: CGPoint(x: 278.2, y: 107.23))
        bezier95Path.addCurve(to: CGPoint(x: 81.88, y: 207.46), controlPoint1: CGPoint(x: 38.62, y: 79.51), controlPoint2: CGPoint(x: 272.92, y: 209.92))
        bezier95Path.addCurve(to: CGPoint(x: 63.23, y: 141.98), controlPoint1: CGPoint(x: 123.12, y: 20.91), controlPoint2: CGPoint(x: 196.58, y: 278.8))
        bezier95Path.addCurve(to: CGPoint(x: 96.34, y: 82.48), controlPoint1: CGPoint(x: 224.3, y: 39.22), controlPoint2: CGPoint(x: 93.89, y: 273.52))
        bezier95Path.close()
        strokeColor.setStroke()
        bezier95Path.lineWidth = 1
        bezier95Path.stroke()

        context.restoreGState()


        //// Bezier 96 Drawing
        context.saveGState()
        context.setAlpha(0.58)

        let bezier96Path = UIBezierPath()
        bezier96Path.move(to: CGPoint(x: 96.47, y: 81.09))
        bezier96Path.addCurve(to: CGPoint(x: 162.9, y: 62.92), controlPoint1: CGPoint(x: 284.71, y: 124.77), controlPoint2: CGPoint(x: 23.11, y: 196.33))
        bezier96Path.addCurve(to: CGPoint(x: 222.72, y: 97.04), controlPoint1: CGPoint(x: 265.12, y: 226.91), controlPoint2: CGPoint(x: 29.54, y: 92.54))
        bezier96Path.addCurve(to: CGPoint(x: 240.9, y: 163.47), controlPoint1: CGPoint(x: 179.05, y: 285.28), controlPoint2: CGPoint(x: 107.48, y: 23.68))
        bezier96Path.addCurve(to: CGPoint(x: 206.77, y: 223.29), controlPoint1: CGPoint(x: 76.91, y: 265.69), controlPoint2: CGPoint(x: 211.28, y: 30.11))
        bezier96Path.addCurve(to: CGPoint(x: 140.35, y: 241.46), controlPoint1: CGPoint(x: 18.54, y: 179.61), controlPoint2: CGPoint(x: 280.13, y: 108.05))
        bezier96Path.addCurve(to: CGPoint(x: 80.52, y: 207.34), controlPoint1: CGPoint(x: 38.13, y: 77.48), controlPoint2: CGPoint(x: 273.71, y: 211.85))
        bezier96Path.addCurve(to: CGPoint(x: 62.35, y: 140.91), controlPoint1: CGPoint(x: 124.2, y: 19.11), controlPoint2: CGPoint(x: 195.77, y: 280.7))
        bezier96Path.addCurve(to: CGPoint(x: 96.47, y: 81.09), controlPoint1: CGPoint(x: 226.34, y: 38.7), controlPoint2: CGPoint(x: 91.97, y: 274.28))
        bezier96Path.close()
        strokeColor.setStroke()
        bezier96Path.lineWidth = 1
        bezier96Path.stroke()

        context.restoreGState()


        //// Bezier 97 Drawing
        context.saveGState()
        context.setAlpha(0.58)

        let bezier97Path = UIBezierPath()
        bezier97Path.move(to: CGPoint(x: 96.63, y: 79.7))
        bezier97Path.addCurve(to: CGPoint(x: 163.99, y: 62.03), controlPoint1: CGPoint(x: 286.52, y: 125.86), controlPoint2: CGPoint(x: 21.22, y: 195.46))
        bezier97Path.addCurve(to: CGPoint(x: 224.13, y: 97.17), controlPoint1: CGPoint(x: 265.62, y: 228.94), controlPoint2: CGPoint(x: 28.82, y: 90.56))
        bezier97Path.addCurve(to: CGPoint(x: 241.8, y: 164.53), controlPoint1: CGPoint(x: 177.96, y: 287.05), controlPoint2: CGPoint(x: 108.37, y: 21.76))
        bezier97Path.addCurve(to: CGPoint(x: 206.66, y: 224.67), controlPoint1: CGPoint(x: 74.89, y: 266.16), controlPoint2: CGPoint(x: 213.26, y: 29.36))
        bezier97Path.addCurve(to: CGPoint(x: 139.29, y: 242.34), controlPoint1: CGPoint(x: 16.77, y: 178.5), controlPoint2: CGPoint(x: 282.07, y: 108.91))
        bezier97Path.addCurve(to: CGPoint(x: 79.16, y: 207.2), controlPoint1: CGPoint(x: 37.66, y: 75.43), controlPoint2: CGPoint(x: 274.47, y: 213.8))
        bezier97Path.addCurve(to: CGPoint(x: 61.49, y: 139.83), controlPoint1: CGPoint(x: 125.32, y: 17.31), controlPoint2: CGPoint(x: 194.92, y: 282.61))
        bezier97Path.addCurve(to: CGPoint(x: 96.63, y: 79.7), controlPoint1: CGPoint(x: 228.4, y: 38.2), controlPoint2: CGPoint(x: 90.02, y: 275.01))
        bezier97Path.close()
        strokeColor.setStroke()
        bezier97Path.lineWidth = 1
        bezier97Path.stroke()

        context.restoreGState()


        //// Bezier 98 Drawing
        context.saveGState()
        context.setAlpha(0.59)

        let bezier98Path = UIBezierPath()
        bezier98Path.move(to: CGPoint(x: 96.8, y: 78.3))
        bezier98Path.addCurve(to: CGPoint(x: 165.11, y: 61.15), controlPoint1: CGPoint(x: 288.31, y: 126.99), controlPoint2: CGPoint(x: 19.33, y: 194.55))
        bezier98Path.addCurve(to: CGPoint(x: 225.53, y: 97.31), controlPoint1: CGPoint(x: 266.1, y: 230.99), controlPoint2: CGPoint(x: 28.13, y: 88.57))
        bezier98Path.addCurve(to: CGPoint(x: 242.69, y: 165.62), controlPoint1: CGPoint(x: 176.85, y: 288.82), controlPoint2: CGPoint(x: 109.29, y: 19.84))
        bezier98Path.addCurve(to: CGPoint(x: 206.52, y: 226.04), controlPoint1: CGPoint(x: 72.85, y: 266.61), controlPoint2: CGPoint(x: 215.27, y: 28.64))
        bezier98Path.addCurve(to: CGPoint(x: 138.22, y: 243.2), controlPoint1: CGPoint(x: 15.01, y: 177.36), controlPoint2: CGPoint(x: 283.99, y: 109.8))
        bezier98Path.addCurve(to: CGPoint(x: 77.79, y: 207.03), controlPoint1: CGPoint(x: 37.23, y: 73.36), controlPoint2: CGPoint(x: 275.2, y: 215.78))
        bezier98Path.addCurve(to: CGPoint(x: 60.64, y: 138.73), controlPoint1: CGPoint(x: 126.48, y: 15.52), controlPoint2: CGPoint(x: 194.04, y: 284.5))
        bezier98Path.addCurve(to: CGPoint(x: 96.8, y: 78.3), controlPoint1: CGPoint(x: 230.48, y: 37.74), controlPoint2: CGPoint(x: 88.06, y: 275.71))
        bezier98Path.close()
        strokeColor.setStroke()
        bezier98Path.lineWidth = 1
        bezier98Path.stroke()

        context.restoreGState()


        //// Bezier 99 Drawing
        context.saveGState()
        context.setAlpha(0.6)

        let bezier99Path = UIBezierPath()
        bezier99Path.move(to: CGPoint(x: 97, y: 76.9))
        bezier99Path.addCurve(to: CGPoint(x: 166.24, y: 60.28), controlPoint1: CGPoint(x: 290.1, y: 128.15), controlPoint2: CGPoint(x: 17.45, y: 193.61))
        bezier99Path.addCurve(to: CGPoint(x: 226.95, y: 97.48), controlPoint1: CGPoint(x: 266.54, y: 233.06), controlPoint2: CGPoint(x: 27.46, y: 86.55))
        bezier99Path.addCurve(to: CGPoint(x: 243.57, y: 166.72), controlPoint1: CGPoint(x: 175.7, y: 290.58), controlPoint2: CGPoint(x: 110.24, y: 17.93))
        bezier99Path.addCurve(to: CGPoint(x: 206.37, y: 227.43), controlPoint1: CGPoint(x: 70.79, y: 267.02), controlPoint2: CGPoint(x: 217.3, y: 27.94))
        bezier99Path.addCurve(to: CGPoint(x: 137.13, y: 244.05), controlPoint1: CGPoint(x: 13.27, y: 176.18), controlPoint2: CGPoint(x: 285.92, y: 110.72))
        bezier99Path.addCurve(to: CGPoint(x: 76.42, y: 206.85), controlPoint1: CGPoint(x: 36.83, y: 71.27), controlPoint2: CGPoint(x: 275.91, y: 217.78))
        bezier99Path.addCurve(to: CGPoint(x: 59.8, y: 137.61), controlPoint1: CGPoint(x: 127.67, y: 13.75), controlPoint2: CGPoint(x: 193.13, y: 286.4))
        bezier99Path.addCurve(to: CGPoint(x: 97, y: 76.9), controlPoint1: CGPoint(x: 232.58, y: 37.31), controlPoint2: CGPoint(x: 86.07, y: 276.39))
        bezier99Path.close()
        strokeColor.setStroke()
        bezier99Path.lineWidth = 1
        bezier99Path.stroke()

        context.restoreGState()


        //// Bezier 100 Drawing
        context.saveGState()
        context.setAlpha(0.6)

        let bezier100Path = UIBezierPath()
        bezier100Path.move(to: CGPoint(x: 97.22, y: 75.5))
        bezier100Path.addCurve(to: CGPoint(x: 167.39, y: 59.43), controlPoint1: CGPoint(x: 291.88, y: 129.35), controlPoint2: CGPoint(x: 15.57, y: 192.63))
        bezier100Path.addCurve(to: CGPoint(x: 228.36, y: 97.68), controlPoint1: CGPoint(x: 266.95, y: 235.15), controlPoint2: CGPoint(x: 26.83, y: 84.51))
        bezier100Path.addCurve(to: CGPoint(x: 244.43, y: 167.84), controlPoint1: CGPoint(x: 174.51, y: 292.33), controlPoint2: CGPoint(x: 111.23, y: 16.02))
        bezier100Path.addCurve(to: CGPoint(x: 206.18, y: 228.82), controlPoint1: CGPoint(x: 68.71, y: 267.41), controlPoint2: CGPoint(x: 219.35, y: 27.28))
        bezier100Path.addCurve(to: CGPoint(x: 136.02, y: 244.89), controlPoint1: CGPoint(x: 11.53, y: 174.97), controlPoint2: CGPoint(x: 287.84, y: 111.68))
        bezier100Path.addCurve(to: CGPoint(x: 75.04, y: 206.64), controlPoint1: CGPoint(x: 36.45, y: 69.17), controlPoint2: CGPoint(x: 276.58, y: 219.8))
        bezier100Path.addCurve(to: CGPoint(x: 58.97, y: 136.47), controlPoint1: CGPoint(x: 128.89, y: 11.98), controlPoint2: CGPoint(x: 192.18, y: 288.29))
        bezier100Path.addCurve(to: CGPoint(x: 97.22, y: 75.5), controlPoint1: CGPoint(x: 234.69, y: 36.91), controlPoint2: CGPoint(x: 84.06, y: 277.04))
        bezier100Path.close()
        strokeColor.setStroke()
        bezier100Path.lineWidth = 1
        bezier100Path.stroke()

        context.restoreGState()


        //// Bezier 101 Drawing
        context.saveGState()
        context.setAlpha(0.61)

        let bezier101Path = UIBezierPath()
        bezier101Path.move(to: CGPoint(x: 97.47, y: 74.09))
        bezier101Path.addCurve(to: CGPoint(x: 168.56, y: 58.59), controlPoint1: CGPoint(x: 293.65, y: 130.58), controlPoint2: CGPoint(x: 13.7, y: 191.62))
        bezier101Path.addCurve(to: CGPoint(x: 229.79, y: 97.9), controlPoint1: CGPoint(x: 267.33, y: 237.25), controlPoint2: CGPoint(x: 26.22, y: 82.46))
        bezier101Path.addCurve(to: CGPoint(x: 245.29, y: 168.98), controlPoint1: CGPoint(x: 173.3, y: 294.08), controlPoint2: CGPoint(x: 112.26, y: 14.12))
        bezier101Path.addCurve(to: CGPoint(x: 205.98, y: 230.21), controlPoint1: CGPoint(x: 66.62, y: 267.76), controlPoint2: CGPoint(x: 221.41, y: 26.64))
        bezier101Path.addCurve(to: CGPoint(x: 134.89, y: 245.71), controlPoint1: CGPoint(x: 9.8, y: 173.72), controlPoint2: CGPoint(x: 289.75, y: 112.68))
        bezier101Path.addCurve(to: CGPoint(x: 73.66, y: 206.4), controlPoint1: CGPoint(x: 36.11, y: 67.05), controlPoint2: CGPoint(x: 277.23, y: 221.84))
        bezier101Path.addCurve(to: CGPoint(x: 58.16, y: 135.32), controlPoint1: CGPoint(x: 130.15, y: 10.22), controlPoint2: CGPoint(x: 191.19, y: 290.17))
        bezier101Path.addCurve(to: CGPoint(x: 97.47, y: 74.09), controlPoint1: CGPoint(x: 236.83, y: 36.54), controlPoint2: CGPoint(x: 82.03, y: 277.65))
        bezier101Path.close()
        strokeColor.setStroke()
        bezier101Path.lineWidth = 1
        bezier101Path.stroke()

        context.restoreGState()


        //// Bezier 102 Drawing
        context.saveGState()
        context.setAlpha(0.62)

        let bezier102Path = UIBezierPath()
        bezier102Path.move(to: CGPoint(x: 97.74, y: 72.68))
        bezier102Path.addCurve(to: CGPoint(x: 169.75, y: 57.76), controlPoint1: CGPoint(x: 295.41, y: 131.84), controlPoint2: CGPoint(x: 11.83, y: 190.57))
        bezier102Path.addCurve(to: CGPoint(x: 231.21, y: 98.14), controlPoint1: CGPoint(x: 267.68, y: 239.37), controlPoint2: CGPoint(x: 25.64, y: 80.38))
        bezier102Path.addCurve(to: CGPoint(x: 246.12, y: 170.15), controlPoint1: CGPoint(x: 172.04, y: 295.81), controlPoint2: CGPoint(x: 113.32, y: 12.23))
        bezier102Path.addCurve(to: CGPoint(x: 205.75, y: 231.61), controlPoint1: CGPoint(x: 64.51, y: 268.08), controlPoint2: CGPoint(x: 223.5, y: 26.04))
        bezier102Path.addCurve(to: CGPoint(x: 133.74, y: 246.52), controlPoint1: CGPoint(x: 8.08, y: 172.44), controlPoint2: CGPoint(x: 291.65, y: 113.72))
        bezier102Path.addCurve(to: CGPoint(x: 72.28, y: 206.15), controlPoint1: CGPoint(x: 35.8, y: 64.91), controlPoint2: CGPoint(x: 277.85, y: 223.9))
        bezier102Path.addCurve(to: CGPoint(x: 57.37, y: 134.14), controlPoint1: CGPoint(x: 131.44, y: 8.48), controlPoint2: CGPoint(x: 190.17, y: 292.05))
        bezier102Path.addCurve(to: CGPoint(x: 97.74, y: 72.68), controlPoint1: CGPoint(x: 238.98, y: 36.2), controlPoint2: CGPoint(x: 79.98, y: 278.25))
        bezier102Path.close()
        strokeColor.setStroke()
        bezier102Path.lineWidth = 1
        bezier102Path.stroke()

        context.restoreGState()


        //// Bezier 103 Drawing
        context.saveGState()
        context.setAlpha(0.62)

        let bezier103Path = UIBezierPath()
        bezier103Path.move(to: CGPoint(x: 98.03, y: 71.26))
        bezier103Path.addCurve(to: CGPoint(x: 170.96, y: 56.95), controlPoint1: CGPoint(x: 297.16, y: 133.14), controlPoint2: CGPoint(x: 9.97, y: 189.49))
        bezier103Path.addCurve(to: CGPoint(x: 232.64, y: 98.4), controlPoint1: CGPoint(x: 268, y: 241.51), controlPoint2: CGPoint(x: 25.09, y: 78.29))
        bezier103Path.addCurve(to: CGPoint(x: 246.95, y: 171.33), controlPoint1: CGPoint(x: 170.76, y: 297.53), controlPoint2: CGPoint(x: 114.41, y: 10.35))
        bezier103Path.addCurve(to: CGPoint(x: 205.5, y: 233.01), controlPoint1: CGPoint(x: 62.39, y: 268.37), controlPoint2: CGPoint(x: 225.61, y: 25.47))
        bezier103Path.addCurve(to: CGPoint(x: 132.57, y: 247.32), controlPoint1: CGPoint(x: 6.37, y: 171.13), controlPoint2: CGPoint(x: 293.55, y: 114.79))
        bezier103Path.addCurve(to: CGPoint(x: 70.89, y: 205.87), controlPoint1: CGPoint(x: 35.53, y: 62.76), controlPoint2: CGPoint(x: 278.43, y: 225.99))
        bezier103Path.addCurve(to: CGPoint(x: 56.58, y: 132.94), controlPoint1: CGPoint(x: 132.77, y: 6.75), controlPoint2: CGPoint(x: 189.11, y: 293.93))
        bezier103Path.addCurve(to: CGPoint(x: 98.03, y: 71.26), controlPoint1: CGPoint(x: 241.14, y: 35.9), controlPoint2: CGPoint(x: 77.91, y: 278.81))
        bezier103Path.close()
        strokeColor.setStroke()
        bezier103Path.lineWidth = 1
        bezier103Path.stroke()

        context.restoreGState()


        //// Bezier 104 Drawing
        context.saveGState()
        context.setAlpha(0.63)

        let bezier104Path = UIBezierPath()
        bezier104Path.move(to: CGPoint(x: 98.35, y: 69.85))
        bezier104Path.addCurve(to: CGPoint(x: 172.18, y: 56.16), controlPoint1: CGPoint(x: 298.89, y: 134.48), controlPoint2: CGPoint(x: 8.12, y: 188.37))
        bezier104Path.addCurve(to: CGPoint(x: 234.07, y: 98.69), controlPoint1: CGPoint(x: 268.29, y: 243.67), controlPoint2: CGPoint(x: 24.58, y: 76.17))
        bezier104Path.addCurve(to: CGPoint(x: 247.75, y: 172.53), controlPoint1: CGPoint(x: 169.44, y: 299.24), controlPoint2: CGPoint(x: 115.55, y: 8.47))
        bezier104Path.addCurve(to: CGPoint(x: 205.22, y: 234.42), controlPoint1: CGPoint(x: 60.25, y: 268.63), controlPoint2: CGPoint(x: 227.74, y: 24.92))
        bezier104Path.addCurve(to: CGPoint(x: 131.39, y: 248.1), controlPoint1: CGPoint(x: 4.68, y: 169.78), controlPoint2: CGPoint(x: 295.45, y: 115.89))
        bezier104Path.addCurve(to: CGPoint(x: 69.5, y: 205.57), controlPoint1: CGPoint(x: 35.28, y: 60.59), controlPoint2: CGPoint(x: 278.99, y: 228.09))
        bezier104Path.addCurve(to: CGPoint(x: 55.81, y: 131.73), controlPoint1: CGPoint(x: 134.13, y: 5.02), controlPoint2: CGPoint(x: 188.02, y: 295.79))
        bezier104Path.addCurve(to: CGPoint(x: 98.35, y: 69.85), controlPoint1: CGPoint(x: 243.32, y: 35.63), controlPoint2: CGPoint(x: 75.82, y: 279.34))
        bezier104Path.close()
        strokeColor.setStroke()
        bezier104Path.lineWidth = 1
        bezier104Path.stroke()

        context.restoreGState()


        //// Bezier 105 Drawing
        context.saveGState()
        context.setAlpha(0.64)

        let bezier105Path = UIBezierPath()
        bezier105Path.move(to: CGPoint(x: 98.69, y: 68.43))
        bezier105Path.addCurve(to: CGPoint(x: 173.43, y: 55.38), controlPoint1: CGPoint(x: 300.61, y: 135.85), controlPoint2: CGPoint(x: 6.28, y: 187.22))
        bezier105Path.addCurve(to: CGPoint(x: 235.5, y: 99.01), controlPoint1: CGPoint(x: 268.54, y: 245.84), controlPoint2: CGPoint(x: 24.09, y: 74.04))
        bezier105Path.addCurve(to: CGPoint(x: 248.55, y: 173.75), controlPoint1: CGPoint(x: 168.08, y: 300.93), controlPoint2: CGPoint(x: 116.71, y: 6.6))
        bezier105Path.addCurve(to: CGPoint(x: 204.92, y: 235.82), controlPoint1: CGPoint(x: 58.09, y: 268.86), controlPoint2: CGPoint(x: 229.89, y: 24.41))
        bezier105Path.addCurve(to: CGPoint(x: 130.18, y: 248.87), controlPoint1: CGPoint(x: 3, y: 168.4), controlPoint2: CGPoint(x: 297.33, y: 117.03))
        bezier105Path.addCurve(to: CGPoint(x: 68.11, y: 205.24), controlPoint1: CGPoint(x: 35.07, y: 58.41), controlPoint2: CGPoint(x: 279.52, y: 230.21))
        bezier105Path.addCurve(to: CGPoint(x: 55.06, y: 130.5), controlPoint1: CGPoint(x: 135.53, y: 3.32), controlPoint2: CGPoint(x: 186.9, y: 297.65))
        bezier105Path.addCurve(to: CGPoint(x: 98.69, y: 68.43), controlPoint1: CGPoint(x: 245.52, y: 35.39), controlPoint2: CGPoint(x: 73.72, y: 279.84))
        bezier105Path.close()
        strokeColor.setStroke()
        bezier105Path.lineWidth = 1
        bezier105Path.stroke()

        context.restoreGState()


        //// Bezier 106 Drawing
        context.saveGState()
        context.setAlpha(0.64)

        let bezier106Path = UIBezierPath()
        bezier106Path.move(to: CGPoint(x: 99.05, y: 67.01))
        bezier106Path.addCurve(to: CGPoint(x: 174.69, y: 54.62), controlPoint1: CGPoint(x: 302.32, y: 137.25), controlPoint2: CGPoint(x: 4.44, y: 186.03))
        bezier106Path.addCurve(to: CGPoint(x: 236.94, y: 99.35), controlPoint1: CGPoint(x: 268.76, y: 248.02), controlPoint2: CGPoint(x: 23.63, y: 71.88))
        bezier106Path.addCurve(to: CGPoint(x: 249.33, y: 174.99), controlPoint1: CGPoint(x: 166.69, y: 302.62), controlPoint2: CGPoint(x: 117.92, y: 4.74))
        bezier106Path.addCurve(to: CGPoint(x: 204.6, y: 237.23), controlPoint1: CGPoint(x: 55.92, y: 269.05), controlPoint2: CGPoint(x: 232.06, y: 23.93))
        bezier106Path.addCurve(to: CGPoint(x: 128.96, y: 249.62), controlPoint1: CGPoint(x: 1.33, y: 166.99), controlPoint2: CGPoint(x: 299.21, y: 118.21))
        bezier106Path.addCurve(to: CGPoint(x: 66.71, y: 204.89), controlPoint1: CGPoint(x: 34.89, y: 56.22), controlPoint2: CGPoint(x: 280.02, y: 232.36))
        bezier106Path.addCurve(to: CGPoint(x: 54.32, y: 129.25), controlPoint1: CGPoint(x: 136.95, y: 1.62), controlPoint2: CGPoint(x: 185.73, y: 299.5))
        bezier106Path.addCurve(to: CGPoint(x: 99.05, y: 67.01), controlPoint1: CGPoint(x: 247.73, y: 35.19), controlPoint2: CGPoint(x: 71.59, y: 280.31))
        bezier106Path.close()
        strokeColor.setStroke()
        bezier106Path.lineWidth = 1
        bezier106Path.stroke()

        context.restoreGState()


        //// Bezier 107 Drawing
        context.saveGState()
        context.setAlpha(0.65)

        let bezier107Path = UIBezierPath()
        bezier107Path.move(to: CGPoint(x: 99.44, y: 65.58))
        bezier107Path.addCurve(to: CGPoint(x: 175.98, y: 53.87), controlPoint1: CGPoint(x: 304.02, y: 138.69), controlPoint2: CGPoint(x: 2.62, y: 184.81))
        bezier107Path.addCurve(to: CGPoint(x: 238.38, y: 99.71), controlPoint1: CGPoint(x: 268.94, y: 250.23), controlPoint2: CGPoint(x: 23.21, y: 69.71))
        bezier107Path.addCurve(to: CGPoint(x: 250.09, y: 176.25), controlPoint1: CGPoint(x: 165.27, y: 304.29), controlPoint2: CGPoint(x: 119.15, y: 2.89))
        bezier107Path.addCurve(to: CGPoint(x: 204.25, y: 238.65), controlPoint1: CGPoint(x: 53.74, y: 269.22), controlPoint2: CGPoint(x: 234.25, y: 23.48))
        bezier107Path.addCurve(to: CGPoint(x: 127.71, y: 250.36), controlPoint1: CGPoint(x: -0.33, y: 165.55), controlPoint2: CGPoint(x: 301.07, y: 119.42))
        bezier107Path.addCurve(to: CGPoint(x: 65.31, y: 204.52), controlPoint1: CGPoint(x: 34.75, y: 54.01), controlPoint2: CGPoint(x: 280.48, y: 234.52))
        bezier107Path.addCurve(to: CGPoint(x: 53.6, y: 127.99), controlPoint1: CGPoint(x: 138.42, y: -0.06), controlPoint2: CGPoint(x: 184.54, y: 301.34))
        bezier107Path.addCurve(to: CGPoint(x: 99.44, y: 65.58), controlPoint1: CGPoint(x: 249.95, y: 35.02), controlPoint2: CGPoint(x: 69.44, y: 280.75))
        bezier107Path.close()
        strokeColor.setStroke()
        bezier107Path.lineWidth = 1
        bezier107Path.stroke()

        context.restoreGState()


        //// Bezier 108 Drawing
        context.saveGState()
        context.setAlpha(0.65)

        let bezier108Path = UIBezierPath()
        bezier108Path.move(to: CGPoint(x: 99.85, y: 64.16))
        bezier108Path.addCurve(to: CGPoint(x: 177.28, y: 53.14), controlPoint1: CGPoint(x: 305.7, y: 140.16), controlPoint2: CGPoint(x: 0.8, y: 183.55))
        bezier108Path.addCurve(to: CGPoint(x: 239.82, y: 100.1), controlPoint1: CGPoint(x: 269.1, y: 252.44), controlPoint2: CGPoint(x: 22.81, y: 67.53))
        bezier108Path.addCurve(to: CGPoint(x: 250.84, y: 177.52), controlPoint1: CGPoint(x: 163.82, y: 305.95), controlPoint2: CGPoint(x: 120.42, y: 1.05))
        bezier108Path.addCurve(to: CGPoint(x: 203.88, y: 240.06), controlPoint1: CGPoint(x: 51.54, y: 269.35), controlPoint2: CGPoint(x: 236.45, y: 23.06))
        bezier108Path.addCurve(to: CGPoint(x: 126.45, y: 251.08), controlPoint1: CGPoint(x: -1.97, y: 164.07), controlPoint2: CGPoint(x: 302.93, y: 120.67))
        bezier108Path.addCurve(to: CGPoint(x: 63.91, y: 204.13), controlPoint1: CGPoint(x: 34.63, y: 51.79), controlPoint2: CGPoint(x: 280.92, y: 236.7))
        bezier108Path.addCurve(to: CGPoint(x: 52.9, y: 126.7), controlPoint1: CGPoint(x: 139.91, y: -1.72), controlPoint2: CGPoint(x: 183.31, y: 303.18))
        bezier108Path.addCurve(to: CGPoint(x: 99.85, y: 64.16), controlPoint1: CGPoint(x: 252.19, y: 34.88), controlPoint2: CGPoint(x: 67.28, y: 281.16))
        bezier108Path.close()
        strokeColor.setStroke()
        bezier108Path.lineWidth = 1
        bezier108Path.stroke()

        context.restoreGState()


        //// Bezier 109 Drawing
        context.saveGState()
        context.setAlpha(0.66)

        let bezier109Path = UIBezierPath()
        bezier109Path.move(to: CGPoint(x: 100.29, y: 62.74))
        bezier109Path.addCurve(to: CGPoint(x: 178.59, y: 52.43), controlPoint1: CGPoint(x: 307.37, y: 141.67), controlPoint2: CGPoint(x: -1.01, y: 182.27))
        bezier109Path.addCurve(to: CGPoint(x: 241.26, y: 100.51), controlPoint1: CGPoint(x: 269.22, y: 254.67), controlPoint2: CGPoint(x: 22.45, y: 65.32))
        bezier109Path.addCurve(to: CGPoint(x: 251.57, y: 178.82), controlPoint1: CGPoint(x: 162.33, y: 307.6), controlPoint2: CGPoint(x: 121.73, y: -0.78))
        bezier109Path.addCurve(to: CGPoint(x: 203.48, y: 241.48), controlPoint1: CGPoint(x: 49.33, y: 269.44), controlPoint2: CGPoint(x: 238.67, y: 22.68))
        bezier109Path.addCurve(to: CGPoint(x: 125.18, y: 251.79), controlPoint1: CGPoint(x: -3.6, y: 162.55), controlPoint2: CGPoint(x: 304.78, y: 121.96))
        bezier109Path.addCurve(to: CGPoint(x: 62.51, y: 203.71), controlPoint1: CGPoint(x: 34.56, y: 49.55), controlPoint2: CGPoint(x: 281.32, y: 238.9))
        bezier109Path.addCurve(to: CGPoint(x: 52.21, y: 125.4), controlPoint1: CGPoint(x: 141.44, y: -3.38), controlPoint2: CGPoint(x: 182.04, y: 305))
        bezier109Path.addCurve(to: CGPoint(x: 100.29, y: 62.74), controlPoint1: CGPoint(x: 254.45, y: 34.78), controlPoint2: CGPoint(x: 65.1, y: 281.54))
        bezier109Path.close()
        strokeColor.setStroke()
        bezier109Path.lineWidth = 1
        bezier109Path.stroke()

        context.restoreGState()


        //// Bezier 110 Drawing
        context.saveGState()
        context.setAlpha(0.67)

        let bezier110Path = UIBezierPath()
        bezier110Path.move(to: CGPoint(x: 100.75, y: 61.32))
        bezier110Path.addCurve(to: CGPoint(x: 179.93, y: 51.73), controlPoint1: CGPoint(x: 309.03, y: 143.21), controlPoint2: CGPoint(x: -2.8, y: 180.94))
        bezier110Path.addCurve(to: CGPoint(x: 242.7, y: 100.95), controlPoint1: CGPoint(x: 269.3, y: 256.91), controlPoint2: CGPoint(x: 22.12, y: 63.1))
        bezier110Path.addCurve(to: CGPoint(x: 252.28, y: 180.13), controlPoint1: CGPoint(x: 160.81, y: 309.23), controlPoint2: CGPoint(x: 123.07, y: -2.6))
        bezier110Path.addCurve(to: CGPoint(x: 203.06, y: 242.9), controlPoint1: CGPoint(x: 47.1, y: 269.5), controlPoint2: CGPoint(x: 240.91, y: 22.32))
        bezier110Path.addCurve(to: CGPoint(x: 123.88, y: 252.48), controlPoint1: CGPoint(x: -5.21, y: 161.01), controlPoint2: CGPoint(x: 306.61, y: 123.27))
        bezier110Path.addCurve(to: CGPoint(x: 61.11, y: 203.27), controlPoint1: CGPoint(x: 34.51, y: 47.3), controlPoint2: CGPoint(x: 281.69, y: 241.12))
        bezier110Path.addCurve(to: CGPoint(x: 51.53, y: 124.08), controlPoint1: CGPoint(x: 143, y: -5.01), controlPoint2: CGPoint(x: 180.74, y: 306.82))
        bezier110Path.addCurve(to: CGPoint(x: 100.75, y: 61.32), controlPoint1: CGPoint(x: 256.71, y: 34.71), controlPoint2: CGPoint(x: 62.9, y: 281.89))
        bezier110Path.close()
        strokeColor.setStroke()
        bezier110Path.lineWidth = 1
        bezier110Path.stroke()

        context.restoreGState()


        //// Bezier 111 Drawing
        context.saveGState()
        context.setAlpha(0.67)

        let bezier111Path = UIBezierPath()
        bezier111Path.move(to: CGPoint(x: 101.23, y: 59.89))
        bezier111Path.addCurve(to: CGPoint(x: 181.28, y: 51.06), controlPoint1: CGPoint(x: 310.66, y: 144.78), controlPoint2: CGPoint(x: -4.59, y: 179.58))
        bezier111Path.addCurve(to: CGPoint(x: 244.14, y: 101.41), controlPoint1: CGPoint(x: 269.35, y: 259.17), controlPoint2: CGPoint(x: 21.83, y: 60.86))
        bezier111Path.addCurve(to: CGPoint(x: 252.98, y: 181.46), controlPoint1: CGPoint(x: 159.25, y: 310.84), controlPoint2: CGPoint(x: 124.45, y: -4.41))
        bezier111Path.addCurve(to: CGPoint(x: 202.62, y: 244.32), controlPoint1: CGPoint(x: 44.86, y: 269.53), controlPoint2: CGPoint(x: 243.17, y: 22.01))
        bezier111Path.addCurve(to: CGPoint(x: 122.57, y: 253.16), controlPoint1: CGPoint(x: -6.81, y: 159.43), controlPoint2: CGPoint(x: 308.44, y: 124.63))
        bezier111Path.addCurve(to: CGPoint(x: 59.71, y: 202.8), controlPoint1: CGPoint(x: 34.5, y: 45.04), controlPoint2: CGPoint(x: 282.03, y: 243.35))
        bezier111Path.addCurve(to: CGPoint(x: 50.87, y: 122.75), controlPoint1: CGPoint(x: 144.6, y: -6.63), controlPoint2: CGPoint(x: 179.4, y: 308.62))
        bezier111Path.addCurve(to: CGPoint(x: 101.23, y: 59.89), controlPoint1: CGPoint(x: 258.99, y: 34.68), controlPoint2: CGPoint(x: 60.68, y: 282.21))
        bezier111Path.close()
        strokeColor.setStroke()
        bezier111Path.lineWidth = 1
        bezier111Path.stroke()

        context.restoreGState()


        //// Bezier 112 Drawing
        context.saveGState()
        context.setAlpha(0.68)

        let bezier112Path = UIBezierPath()
        bezier112Path.move(to: CGPoint(x: 101.74, y: 58.47))
        bezier112Path.addCurve(to: CGPoint(x: 182.65, y: 50.39), controlPoint1: CGPoint(x: 312.29, y: 146.39), controlPoint2: CGPoint(x: -6.36, y: 178.19))
        bezier112Path.addCurve(to: CGPoint(x: 245.58, y: 101.9), controlPoint1: CGPoint(x: 269.37, y: 261.44), controlPoint2: CGPoint(x: 21.56, y: 58.61))
        bezier112Path.addCurve(to: CGPoint(x: 253.66, y: 182.81), controlPoint1: CGPoint(x: 157.67, y: 312.45), controlPoint2: CGPoint(x: 125.86, y: -6.2))
        bezier112Path.addCurve(to: CGPoint(x: 202.15, y: 245.74), controlPoint1: CGPoint(x: 42.61, y: 269.53), controlPoint2: CGPoint(x: 245.44, y: 21.72))
        bezier112Path.addCurve(to: CGPoint(x: 121.24, y: 253.82), controlPoint1: CGPoint(x: -8.39, y: 157.82), controlPoint2: CGPoint(x: 310.25, y: 126.02))
        bezier112Path.addCurve(to: CGPoint(x: 58.31, y: 202.31), controlPoint1: CGPoint(x: 34.52, y: 42.77), controlPoint2: CGPoint(x: 282.33, y: 245.6))
        bezier112Path.addCurve(to: CGPoint(x: 50.23, y: 121.4), controlPoint1: CGPoint(x: 146.23, y: -8.23), controlPoint2: CGPoint(x: 178.03, y: 310.41))
        bezier112Path.addCurve(to: CGPoint(x: 101.74, y: 58.47), controlPoint1: CGPoint(x: 261.28, y: 34.68), controlPoint2: CGPoint(x: 58.45, y: 282.49))
        bezier112Path.close()
        strokeColor.setStroke()
        bezier112Path.lineWidth = 1
        bezier112Path.stroke()

        context.restoreGState()


        //// Bezier 113 Drawing
        context.saveGState()
        context.setAlpha(0.69)

        let bezier113Path = UIBezierPath()
        bezier113Path.move(to: CGPoint(x: 102.27, y: 57.05))
        bezier113Path.addCurve(to: CGPoint(x: 184.04, y: 49.75), controlPoint1: CGPoint(x: 313.89, y: 148.03), controlPoint2: CGPoint(x: -8.12, y: 176.77))
        bezier113Path.addCurve(to: CGPoint(x: 247.02, y: 102.41), controlPoint1: CGPoint(x: 269.35, y: 263.72), controlPoint2: CGPoint(x: 21.33, y: 56.34))
        bezier113Path.addCurve(to: CGPoint(x: 254.32, y: 184.18), controlPoint1: CGPoint(x: 156.04, y: 314.03), controlPoint2: CGPoint(x: 127.31, y: -7.98))
        bezier113Path.addCurve(to: CGPoint(x: 201.66, y: 247.16), controlPoint1: CGPoint(x: 40.35, y: 269.49), controlPoint2: CGPoint(x: 247.73, y: 21.47))
        bezier113Path.addCurve(to: CGPoint(x: 119.89, y: 254.46), controlPoint1: CGPoint(x: -9.96, y: 156.18), controlPoint2: CGPoint(x: 312.06, y: 127.44))
        bezier113Path.addCurve(to: CGPoint(x: 56.91, y: 201.8), controlPoint1: CGPoint(x: 34.58, y: 40.49), controlPoint2: CGPoint(x: 282.6, y: 247.87))
        bezier113Path.addCurve(to: CGPoint(x: 49.61, y: 120.03), controlPoint1: CGPoint(x: 147.89, y: -9.82), controlPoint2: CGPoint(x: 176.63, y: 312.19))
        bezier113Path.addCurve(to: CGPoint(x: 102.27, y: 57.05), controlPoint1: CGPoint(x: 263.58, y: 34.72), controlPoint2: CGPoint(x: 56.2, y: 282.74))
        bezier113Path.close()
        strokeColor.setStroke()
        bezier113Path.lineWidth = 1
        bezier113Path.stroke()

        context.restoreGState()


        //// Bezier 114 Drawing
        context.saveGState()
        context.setAlpha(0.69)

        let bezier114Path = UIBezierPath()
        bezier114Path.move(to: CGPoint(x: 102.83, y: 55.63))
        bezier114Path.addCurve(to: CGPoint(x: 185.45, y: 49.13), controlPoint1: CGPoint(x: 315.48, y: 149.7), controlPoint2: CGPoint(x: -9.87, y: 175.31))
        bezier114Path.addCurve(to: CGPoint(x: 248.46, y: 102.95), controlPoint1: CGPoint(x: 269.3, y: 266.01), controlPoint2: CGPoint(x: 21.13, y: 54.06))
        bezier114Path.addCurve(to: CGPoint(x: 254.97, y: 185.57), controlPoint1: CGPoint(x: 154.39, y: 315.6), controlPoint2: CGPoint(x: 128.79, y: -9.75))
        bezier114Path.addCurve(to: CGPoint(x: 201.14, y: 248.58), controlPoint1: CGPoint(x: 38.08, y: 269.41), controlPoint2: CGPoint(x: 250.03, y: 21.25))
        bezier114Path.addCurve(to: CGPoint(x: 118.53, y: 255.09), controlPoint1: CGPoint(x: -11.51, y: 154.51), controlPoint2: CGPoint(x: 313.84, y: 128.9))
        bezier114Path.addCurve(to: CGPoint(x: 55.51, y: 201.26), controlPoint1: CGPoint(x: 34.68, y: 38.2), controlPoint2: CGPoint(x: 282.84, y: 250.15))
        bezier114Path.addCurve(to: CGPoint(x: 49.01, y: 118.65), controlPoint1: CGPoint(x: 149.58, y: -11.39), controlPoint2: CGPoint(x: 175.19, y: 313.96))
        bezier114Path.addCurve(to: CGPoint(x: 102.83, y: 55.63), controlPoint1: CGPoint(x: 265.89, y: 34.8), controlPoint2: CGPoint(x: 53.94, y: 282.96))
        bezier114Path.close()
        strokeColor.setStroke()
        bezier114Path.lineWidth = 1
        bezier114Path.stroke()

        context.restoreGState()


        //// Bezier 115 Drawing
        context.saveGState()
        context.setAlpha(0.7)

        let bezier115Path = UIBezierPath()
        bezier115Path.move(to: CGPoint(x: 103.41, y: 54.21))
        bezier115Path.addCurve(to: CGPoint(x: 186.87, y: 48.52), controlPoint1: CGPoint(x: 317.05, y: 151.41), controlPoint2: CGPoint(x: -11.61, y: 173.81))
        bezier115Path.addCurve(to: CGPoint(x: 249.9, y: 103.51), controlPoint1: CGPoint(x: 269.21, y: 268.32), controlPoint2: CGPoint(x: 20.97, y: 51.76))
        bezier115Path.addCurve(to: CGPoint(x: 255.59, y: 186.97), controlPoint1: CGPoint(x: 152.71, y: 317.15), controlPoint2: CGPoint(x: 130.3, y: -11.51))
        bezier115Path.addCurve(to: CGPoint(x: 200.6, y: 250), controlPoint1: CGPoint(x: 35.8, y: 269.31), controlPoint2: CGPoint(x: 252.35, y: 21.06))
        bezier115Path.addCurve(to: CGPoint(x: 117.15, y: 255.69), controlPoint1: CGPoint(x: -13.04, y: 152.81), controlPoint2: CGPoint(x: 315.62, y: 130.4))
        bezier115Path.addCurve(to: CGPoint(x: 54.11, y: 200.7), controlPoint1: CGPoint(x: 34.81, y: 35.9), controlPoint2: CGPoint(x: 283.05, y: 252.45))
        bezier115Path.addCurve(to: CGPoint(x: 48.42, y: 117.25), controlPoint1: CGPoint(x: 151.31, y: -12.94), controlPoint2: CGPoint(x: 173.71, y: 315.72))
        bezier115Path.addCurve(to: CGPoint(x: 103.41, y: 54.21), controlPoint1: CGPoint(x: 268.22, y: 34.91), controlPoint2: CGPoint(x: 51.66, y: 283.15))
        bezier115Path.close()
        strokeColor.setStroke()
        bezier115Path.lineWidth = 1
        bezier115Path.stroke()

        context.restoreGState()


        //// Bezier 116 Drawing
        context.saveGState()
        context.setAlpha(0.71)

        let bezier116Path = UIBezierPath()
        bezier116Path.move(to: CGPoint(x: 104.01, y: 52.79))
        bezier116Path.addCurve(to: CGPoint(x: 188.3, y: 47.93), controlPoint1: CGPoint(x: 318.61, y: 153.15), controlPoint2: CGPoint(x: -13.33, y: 172.29))
        bezier116Path.addCurve(to: CGPoint(x: 251.34, y: 104.1), controlPoint1: CGPoint(x: 269.08, y: 270.63), controlPoint2: CGPoint(x: 20.83, y: 49.45))
        bezier116Path.addCurve(to: CGPoint(x: 256.2, y: 188.39), controlPoint1: CGPoint(x: 150.99, y: 318.69), controlPoint2: CGPoint(x: 131.85, y: -13.25))
        bezier116Path.addCurve(to: CGPoint(x: 200.04, y: 251.42), controlPoint1: CGPoint(x: 33.5, y: 269.16), controlPoint2: CGPoint(x: 254.68, y: 20.91))
        bezier116Path.addCurve(to: CGPoint(x: 115.75, y: 256.28), controlPoint1: CGPoint(x: -14.55, y: 151.07), controlPoint2: CGPoint(x: 317.38, y: 131.93))
        bezier116Path.addCurve(to: CGPoint(x: 52.71, y: 200.12), controlPoint1: CGPoint(x: 34.97, y: 33.58), controlPoint2: CGPoint(x: 283.22, y: 254.76))
        bezier116Path.addCurve(to: CGPoint(x: 47.85, y: 115.83), controlPoint1: CGPoint(x: 153.06, y: -14.47), controlPoint2: CGPoint(x: 172.2, y: 317.46))
        bezier116Path.addCurve(to: CGPoint(x: 104.01, y: 52.79), controlPoint1: CGPoint(x: 270.55, y: 35.05), controlPoint2: CGPoint(x: 49.37, y: 283.3))
        bezier116Path.close()
        strokeColor.setStroke()
        bezier116Path.lineWidth = 1
        bezier116Path.stroke()

        context.restoreGState()


        //// Bezier 117 Drawing
        context.saveGState()
        context.setAlpha(0.71)

        let bezier117Path = UIBezierPath()
        bezier117Path.move(to: CGPoint(x: 104.64, y: 51.38))
        bezier117Path.addCurve(to: CGPoint(x: 189.76, y: 47.36), controlPoint1: CGPoint(x: 320.14, y: 154.92), controlPoint2: CGPoint(x: -15.04, y: 170.72))
        bezier117Path.addCurve(to: CGPoint(x: 252.78, y: 104.71), controlPoint1: CGPoint(x: 268.92, y: 272.96), controlPoint2: CGPoint(x: 20.74, y: 47.13))
        bezier117Path.addCurve(to: CGPoint(x: 256.79, y: 189.82), controlPoint1: CGPoint(x: 149.24, y: 320.2), controlPoint2: CGPoint(x: 133.43, y: -14.97))
        bezier117Path.addCurve(to: CGPoint(x: 199.45, y: 252.84), controlPoint1: CGPoint(x: 31.2, y: 268.98), controlPoint2: CGPoint(x: 257.03, y: 20.8))
        bezier117Path.addCurve(to: CGPoint(x: 114.33, y: 256.86), controlPoint1: CGPoint(x: -16.05, y: 149.3), controlPoint2: CGPoint(x: 319.13, y: 133.49))
        bezier117Path.addCurve(to: CGPoint(x: 51.31, y: 199.51), controlPoint1: CGPoint(x: 35.17, y: 31.26), controlPoint2: CGPoint(x: 283.36, y: 257.09))
        bezier117Path.addCurve(to: CGPoint(x: 47.3, y: 114.4), controlPoint1: CGPoint(x: 154.85, y: -15.99), controlPoint2: CGPoint(x: 170.66, y: 319.19))
        bezier117Path.addCurve(to: CGPoint(x: 104.64, y: 51.38), controlPoint1: CGPoint(x: 272.89, y: 35.23), controlPoint2: CGPoint(x: 47.06, y: 283.42))
        bezier117Path.close()
        strokeColor.setStroke()
        bezier117Path.lineWidth = 1
        bezier117Path.stroke()

        context.restoreGState()


        //// Bezier 118 Drawing
        context.saveGState()
        context.setAlpha(0.72)

        let bezier118Path = UIBezierPath()
        bezier118Path.move(to: CGPoint(x: 105.3, y: 49.96))
        bezier118Path.addCurve(to: CGPoint(x: 191.23, y: 46.81), controlPoint1: CGPoint(x: 321.66, y: 156.72), controlPoint2: CGPoint(x: -16.73, y: 169.13))
        bezier118Path.addCurve(to: CGPoint(x: 254.21, y: 105.34), controlPoint1: CGPoint(x: 268.72, y: 275.29), controlPoint2: CGPoint(x: 20.67, y: 44.79))
        bezier118Path.addCurve(to: CGPoint(x: 257.37, y: 191.27), controlPoint1: CGPoint(x: 147.46, y: 321.7), controlPoint2: CGPoint(x: 135.05, y: -16.69))
        bezier118Path.addCurve(to: CGPoint(x: 198.83, y: 254.26), controlPoint1: CGPoint(x: 28.89, y: 268.77), controlPoint2: CGPoint(x: 259.39, y: 20.72))
        bezier118Path.addCurve(to: CGPoint(x: 112.91, y: 257.41), controlPoint1: CGPoint(x: -17.52, y: 147.5), controlPoint2: CGPoint(x: 320.86, y: 135.09))
        bezier118Path.addCurve(to: CGPoint(x: 49.92, y: 198.88), controlPoint1: CGPoint(x: 35.41, y: 28.93), controlPoint2: CGPoint(x: 283.46, y: 259.44))
        bezier118Path.addCurve(to: CGPoint(x: 46.77, y: 112.95), controlPoint1: CGPoint(x: 156.68, y: -17.48), controlPoint2: CGPoint(x: 169.08, y: 320.91))
        bezier118Path.addCurve(to: CGPoint(x: 105.3, y: 49.96), controlPoint1: CGPoint(x: 275.24, y: 35.45), controlPoint2: CGPoint(x: 44.74, y: 283.5))
        bezier118Path.close()
        strokeColor.setStroke()
        bezier118Path.lineWidth = 1
        bezier118Path.stroke()

        context.restoreGState()


        //// Bezier 119 Drawing
        context.saveGState()
        context.setAlpha(0.73)

        let bezier119Path = UIBezierPath()
        bezier119Path.move(to: CGPoint(x: 105.98, y: 48.55))
        bezier119Path.addCurve(to: CGPoint(x: 192.71, y: 46.28), controlPoint1: CGPoint(x: 323.15, y: 158.56), controlPoint2: CGPoint(x: -18.41, y: 167.5))
        bezier119Path.addCurve(to: CGPoint(x: 255.65, y: 106.01), controlPoint1: CGPoint(x: 268.49, y: 277.63), controlPoint2: CGPoint(x: 20.65, y: 42.44))
        bezier119Path.addCurve(to: CGPoint(x: 257.92, y: 192.74), controlPoint1: CGPoint(x: 145.64, y: 323.18), controlPoint2: CGPoint(x: 136.7, y: -18.38))
        bezier119Path.addCurve(to: CGPoint(x: 198.19, y: 255.68), controlPoint1: CGPoint(x: 26.57, y: 268.52), controlPoint2: CGPoint(x: 261.76, y: 20.68))
        bezier119Path.addCurve(to: CGPoint(x: 111.46, y: 257.95), controlPoint1: CGPoint(x: -18.98, y: 145.67), controlPoint2: CGPoint(x: 322.58, y: 136.73))
        bezier119Path.addCurve(to: CGPoint(x: 48.52, y: 198.22), controlPoint1: CGPoint(x: 35.68, y: 26.6), controlPoint2: CGPoint(x: 283.52, y: 261.79))
        bezier119Path.addCurve(to: CGPoint(x: 46.25, y: 111.49), controlPoint1: CGPoint(x: 158.53, y: -18.95), controlPoint2: CGPoint(x: 167.47, y: 322.61))
        bezier119Path.addCurve(to: CGPoint(x: 105.98, y: 48.55), controlPoint1: CGPoint(x: 277.6, y: 35.71), controlPoint2: CGPoint(x: 42.41, y: 283.55))
        bezier119Path.close()
        strokeColor.setStroke()
        bezier119Path.lineWidth = 1
        bezier119Path.stroke()

        context.restoreGState()


        //// Bezier 120 Drawing
        context.saveGState()
        context.setAlpha(0.73)

        let bezier120Path = UIBezierPath()
        bezier120Path.move(to: CGPoint(x: 106.68, y: 47.15))
        bezier120Path.addCurve(to: CGPoint(x: 194.21, y: 45.77), controlPoint1: CGPoint(x: 324.63, y: 160.43), controlPoint2: CGPoint(x: -20.07, y: 165.84))
        bezier120Path.addCurve(to: CGPoint(x: 257.08, y: 106.69), controlPoint1: CGPoint(x: 268.22, y: 279.99), controlPoint2: CGPoint(x: 20.65, y: 40.07))
        bezier120Path.addCurve(to: CGPoint(x: 258.45, y: 194.22), controlPoint1: CGPoint(x: 143.8, y: 324.64), controlPoint2: CGPoint(x: 138.38, y: -20.06))
        bezier120Path.addCurve(to: CGPoint(x: 197.53, y: 257.09), controlPoint1: CGPoint(x: 24.24, y: 268.24), controlPoint2: CGPoint(x: 264.15, y: 20.67))
        bezier120Path.addCurve(to: CGPoint(x: 110, y: 258.47), controlPoint1: CGPoint(x: -20.42, y: 143.81), controlPoint2: CGPoint(x: 324.28, y: 138.39))
        bezier120Path.addCurve(to: CGPoint(x: 47.13, y: 197.54), controlPoint1: CGPoint(x: 35.99, y: 24.25), controlPoint2: CGPoint(x: 283.56, y: 264.16))
        bezier120Path.addCurve(to: CGPoint(x: 45.76, y: 110.01), controlPoint1: CGPoint(x: 160.41, y: -20.4), controlPoint2: CGPoint(x: 165.83, y: 324.3))
        bezier120Path.addCurve(to: CGPoint(x: 106.68, y: 47.15), controlPoint1: CGPoint(x: 279.97, y: 36), controlPoint2: CGPoint(x: 40.06, y: 283.57))
        bezier120Path.close()
        strokeColor.setStroke()
        bezier120Path.lineWidth = 1
        bezier120Path.stroke()

        context.restoreGState()


        //// Bezier 121 Drawing
        context.saveGState()
        context.setAlpha(0.74)

        let bezier121Path = UIBezierPath()
        bezier121Path.move(to: CGPoint(x: 107.41, y: 45.74))
        bezier121Path.addCurve(to: CGPoint(x: 195.73, y: 45.28), controlPoint1: CGPoint(x: 326.08, y: 162.33), controlPoint2: CGPoint(x: -21.72, y: 164.15))
        bezier121Path.addCurve(to: CGPoint(x: 258.5, y: 107.41), controlPoint1: CGPoint(x: 267.92, y: 282.35), controlPoint2: CGPoint(x: 20.7, y: 37.7))
        bezier121Path.addCurve(to: CGPoint(x: 258.97, y: 195.72), controlPoint1: CGPoint(x: 141.92, y: 326.08), controlPoint2: CGPoint(x: 140.1, y: -21.72))
        bezier121Path.addCurve(to: CGPoint(x: 196.84, y: 258.5), controlPoint1: CGPoint(x: 21.9, y: 267.91), controlPoint2: CGPoint(x: 266.55, y: 20.69))
        bezier121Path.addCurve(to: CGPoint(x: 108.52, y: 258.96), controlPoint1: CGPoint(x: -21.83, y: 141.92), controlPoint2: CGPoint(x: 325.97, y: 140.1))
        bezier121Path.addCurve(to: CGPoint(x: 45.75, y: 196.84), controlPoint1: CGPoint(x: 36.33, y: 21.9), controlPoint2: CGPoint(x: 283.55, y: 266.54))
        bezier121Path.addCurve(to: CGPoint(x: 45.28, y: 108.52), controlPoint1: CGPoint(x: 162.33, y: -21.84), controlPoint2: CGPoint(x: 164.15, y: 325.97))
        bezier121Path.addCurve(to: CGPoint(x: 107.41, y: 45.74), controlPoint1: CGPoint(x: 282.35, y: 36.33), controlPoint2: CGPoint(x: 37.7, y: 283.55))
        bezier121Path.close()
        strokeColor.setStroke()
        bezier121Path.lineWidth = 1
        bezier121Path.stroke()

        context.restoreGState()


        //// Bezier 122 Drawing
        context.saveGState()
        context.setAlpha(0.75)

        let bezier122Path = UIBezierPath()
        bezier122Path.move(to: CGPoint(x: 108.16, y: 44.34))
        bezier122Path.addCurve(to: CGPoint(x: 197.26, y: 44.81), controlPoint1: CGPoint(x: 327.52, y: 164.26), controlPoint2: CGPoint(x: -23.35, y: 162.42))
        bezier122Path.addCurve(to: CGPoint(x: 259.93, y: 108.14), controlPoint1: CGPoint(x: 267.57, y: 284.71), controlPoint2: CGPoint(x: 20.77, y: 35.32))
        bezier122Path.addCurve(to: CGPoint(x: 259.46, y: 197.24), controlPoint1: CGPoint(x: 140.01, y: 327.5), controlPoint2: CGPoint(x: 141.85, y: -23.36))
        bezier122Path.addCurve(to: CGPoint(x: 196.13, y: 259.91), controlPoint1: CGPoint(x: 19.56, y: 267.56), controlPoint2: CGPoint(x: 268.96, y: 20.76))
        bezier122Path.addCurve(to: CGPoint(x: 107.03, y: 259.44), controlPoint1: CGPoint(x: -23.23, y: 140), controlPoint2: CGPoint(x: 327.64, y: 141.83))
        bezier122Path.addCurve(to: CGPoint(x: 44.36, y: 196.11), controlPoint1: CGPoint(x: 36.71, y: 19.54), controlPoint2: CGPoint(x: 283.51, y: 268.94))
        bezier122Path.addCurve(to: CGPoint(x: 44.83, y: 107.02), controlPoint1: CGPoint(x: 164.28, y: -23.25), controlPoint2: CGPoint(x: 162.44, y: 327.62))
        bezier122Path.addCurve(to: CGPoint(x: 108.16, y: 44.34), controlPoint1: CGPoint(x: 284.73, y: 36.7), controlPoint2: CGPoint(x: 35.33, y: 283.5))
        bezier122Path.close()
        strokeColor.setStroke()
        bezier122Path.lineWidth = 1
        bezier122Path.stroke()

        context.restoreGState()


        //// Bezier 123 Drawing
        context.saveGState()
        context.setAlpha(0.75)

        let bezier123Path = UIBezierPath()
        bezier123Path.move(to: CGPoint(x: 108.93, y: 42.95))
        bezier123Path.addCurve(to: CGPoint(x: 198.8, y: 44.36), controlPoint1: CGPoint(x: 328.93, y: 166.22), controlPoint2: CGPoint(x: -24.96, y: 160.66))
        bezier123Path.addCurve(to: CGPoint(x: 261.35, y: 108.9), controlPoint1: CGPoint(x: 267.19, y: 287.09), controlPoint2: CGPoint(x: 20.89, y: 32.92))
        bezier123Path.addCurve(to: CGPoint(x: 259.93, y: 198.77), controlPoint1: CGPoint(x: 138.07, y: 328.9), controlPoint2: CGPoint(x: 143.63, y: -24.99))
        bezier123Path.addCurve(to: CGPoint(x: 195.39, y: 261.32), controlPoint1: CGPoint(x: 17.21, y: 267.16), controlPoint2: CGPoint(x: 271.38, y: 20.86))
        bezier123Path.addCurve(to: CGPoint(x: 105.53, y: 259.9), controlPoint1: CGPoint(x: -24.6, y: 138.04), controlPoint2: CGPoint(x: 329.29, y: 143.6))
        bezier123Path.addCurve(to: CGPoint(x: 42.98, y: 195.36), controlPoint1: CGPoint(x: 37.13, y: 17.18), controlPoint2: CGPoint(x: 283.44, y: 271.35))
        bezier123Path.addCurve(to: CGPoint(x: 44.39, y: 105.5), controlPoint1: CGPoint(x: 166.25, y: -24.63), controlPoint2: CGPoint(x: 160.69, y: 329.26))
        bezier123Path.addCurve(to: CGPoint(x: 108.93, y: 42.95), controlPoint1: CGPoint(x: 287.12, y: 37.1), controlPoint2: CGPoint(x: 32.95, y: 283.41))
        bezier123Path.close()
        strokeColor.setStroke()
        bezier123Path.lineWidth = 1
        bezier123Path.stroke()

        context.restoreGState()


        //// Bezier 124 Drawing
        context.saveGState()
        context.setAlpha(0.76)

        let bezier124Path = UIBezierPath()
        bezier124Path.move(to: CGPoint(x: 109.74, y: 41.56))
        bezier124Path.addCurve(to: CGPoint(x: 200.36, y: 43.93), controlPoint1: CGPoint(x: 330.32, y: 168.22), controlPoint2: CGPoint(x: -26.55, y: 158.87))
        bezier124Path.addCurve(to: CGPoint(x: 262.76, y: 109.69), controlPoint1: CGPoint(x: 266.78, y: 289.47), controlPoint2: CGPoint(x: 21.04, y: 30.51))
        bezier124Path.addCurve(to: CGPoint(x: 260.39, y: 200.31), controlPoint1: CGPoint(x: 136.1, y: 330.28), controlPoint2: CGPoint(x: 145.45, y: -26.6))
        bezier124Path.addCurve(to: CGPoint(x: 194.63, y: 262.72), controlPoint1: CGPoint(x: 14.85, y: 266.73), controlPoint2: CGPoint(x: 273.81, y: 20.99))
        bezier124Path.addCurve(to: CGPoint(x: 104.01, y: 260.34), controlPoint1: CGPoint(x: -25.96, y: 136.06), controlPoint2: CGPoint(x: 330.92, y: 145.41))
        bezier124Path.addCurve(to: CGPoint(x: 41.6, y: 194.59), controlPoint1: CGPoint(x: 37.59, y: 14.81), controlPoint2: CGPoint(x: 283.33, y: 273.76))
        bezier124Path.addCurve(to: CGPoint(x: 43.98, y: 103.96), controlPoint1: CGPoint(x: 168.26, y: -26), controlPoint2: CGPoint(x: 158.91, y: 330.88))
        bezier124Path.addCurve(to: CGPoint(x: 109.74, y: 41.56), controlPoint1: CGPoint(x: 289.51, y: 37.54), controlPoint2: CGPoint(x: 30.56, y: 283.29))
        bezier124Path.close()
        strokeColor.setStroke()
        bezier124Path.lineWidth = 1
        bezier124Path.stroke()

        context.restoreGState()


        //// Bezier 125 Drawing
        context.saveGState()
        context.setAlpha(0.77)

        let bezier125Path = UIBezierPath()
        bezier125Path.move(to: CGPoint(x: 110.56, y: 40.18))
        bezier125Path.addCurve(to: CGPoint(x: 201.93, y: 43.53), controlPoint1: CGPoint(x: 331.69, y: 170.24), controlPoint2: CGPoint(x: -28.13, y: 157.05))
        bezier125Path.addCurve(to: CGPoint(x: 264.17, y: 110.5), controlPoint1: CGPoint(x: 266.32, y: 291.86), controlPoint2: CGPoint(x: 21.22, y: 28.1))
        bezier125Path.addCurve(to: CGPoint(x: 260.82, y: 201.88), controlPoint1: CGPoint(x: 134.1, y: 331.63), controlPoint2: CGPoint(x: 147.3, y: -28.19))
        bezier125Path.addCurve(to: CGPoint(x: 193.84, y: 264.11), controlPoint1: CGPoint(x: 12.49, y: 266.27), controlPoint2: CGPoint(x: 276.25, y: 21.16))
        bezier125Path.addCurve(to: CGPoint(x: 102.47, y: 260.76), controlPoint1: CGPoint(x: -27.29, y: 134.05), controlPoint2: CGPoint(x: 332.53, y: 147.24))
        bezier125Path.addCurve(to: CGPoint(x: 40.23, y: 193.79), controlPoint1: CGPoint(x: 38.08, y: 12.43), controlPoint2: CGPoint(x: 283.18, y: 276.19))
        bezier125Path.addCurve(to: CGPoint(x: 43.58, y: 102.42), controlPoint1: CGPoint(x: 170.3, y: -27.34), controlPoint2: CGPoint(x: 157.1, y: 332.48))
        bezier125Path.addCurve(to: CGPoint(x: 110.56, y: 40.18), controlPoint1: CGPoint(x: 291.91, y: 38.02), controlPoint2: CGPoint(x: 28.15, y: 283.13))
        bezier125Path.close()
        strokeColor.setStroke()
        bezier125Path.lineWidth = 1
        bezier125Path.stroke()

        context.restoreGState()


        //// Bezier 126 Drawing
        context.saveGState()
        context.setAlpha(0.77)

        let bezier126Path = UIBezierPath()
        bezier126Path.move(to: CGPoint(x: 111.41, y: 38.8))
        bezier126Path.addCurve(to: CGPoint(x: 203.52, y: 43.14), controlPoint1: CGPoint(x: 333.03, y: 172.3), controlPoint2: CGPoint(x: -29.69, y: 155.19))
        bezier126Path.addCurve(to: CGPoint(x: 265.58, y: 111.34), controlPoint1: CGPoint(x: 265.83, y: 294.25), controlPoint2: CGPoint(x: 21.44, y: 25.67))
        bezier126Path.addCurve(to: CGPoint(x: 261.23, y: 203.45), controlPoint1: CGPoint(x: 132.07, y: 332.97), controlPoint2: CGPoint(x: 149.18, y: -29.76))
        bezier126Path.addCurve(to: CGPoint(x: 193.03, y: 265.51), controlPoint1: CGPoint(x: 10.12, y: 265.76), controlPoint2: CGPoint(x: 278.7, y: 21.37))
        bezier126Path.addCurve(to: CGPoint(x: 100.92, y: 261.16), controlPoint1: CGPoint(x: -28.6, y: 132.01), controlPoint2: CGPoint(x: 334.13, y: 149.11))
        bezier126Path.addCurve(to: CGPoint(x: 38.86, y: 192.96), controlPoint1: CGPoint(x: 38.61, y: 10.05), controlPoint2: CGPoint(x: 283, y: 278.63))
        bezier126Path.addCurve(to: CGPoint(x: 43.21, y: 100.86), controlPoint1: CGPoint(x: 172.36, y: -28.66), controlPoint2: CGPoint(x: 155.26, y: 334.06))
        bezier126Path.addCurve(to: CGPoint(x: 111.41, y: 38.8), controlPoint1: CGPoint(x: 294.32, y: 38.54), controlPoint2: CGPoint(x: 25.74, y: 282.93))
        bezier126Path.close()
        strokeColor.setStroke()
        bezier126Path.lineWidth = 1
        bezier126Path.stroke()

        context.restoreGState()


        //// Bezier 127 Drawing
        context.saveGState()
        context.setAlpha(0.78)

        let bezier127Path = UIBezierPath()
        bezier127Path.move(to: CGPoint(x: 112.28, y: 37.42))
        bezier127Path.addCurve(to: CGPoint(x: 205.12, y: 42.78), controlPoint1: CGPoint(x: 334.36, y: 174.38), controlPoint2: CGPoint(x: -31.23, y: 153.3))
        bezier127Path.addCurve(to: CGPoint(x: 266.97, y: 112.2), controlPoint1: CGPoint(x: 265.3, y: 296.65), controlPoint2: CGPoint(x: 21.7, y: 23.24))
        bezier127Path.addCurve(to: CGPoint(x: 261.62, y: 205.04), controlPoint1: CGPoint(x: 130.01, y: 334.28), controlPoint2: CGPoint(x: 151.09, y: -31.3))
        bezier127Path.addCurve(to: CGPoint(x: 192.19, y: 266.9), controlPoint1: CGPoint(x: 7.75, y: 265.22), controlPoint2: CGPoint(x: 281.16, y: 21.62))
        bezier127Path.addCurve(to: CGPoint(x: 99.36, y: 261.54), controlPoint1: CGPoint(x: -29.88, y: 129.94), controlPoint2: CGPoint(x: 335.7, y: 151.02))
        bezier127Path.addCurve(to: CGPoint(x: 37.5, y: 192.12), controlPoint1: CGPoint(x: 39.18, y: 7.67), controlPoint2: CGPoint(x: 282.78, y: 281.08))
        bezier127Path.addCurve(to: CGPoint(x: 42.85, y: 99.28), controlPoint1: CGPoint(x: 174.46, y: -29.96), controlPoint2: CGPoint(x: 153.38, y: 335.63))
        bezier127Path.addCurve(to: CGPoint(x: 112.28, y: 37.42), controlPoint1: CGPoint(x: 296.73, y: 39.1), controlPoint2: CGPoint(x: 23.32, y: 282.7))
        bezier127Path.close()
        strokeColor.setStroke()
        bezier127Path.lineWidth = 1
        bezier127Path.stroke()

        context.restoreGState()


        //// Bezier 128 Drawing
        context.saveGState()
        context.setAlpha(0.78)

        let bezier128Path = UIBezierPath()
        bezier128Path.move(to: CGPoint(x: 113.18, y: 36.06))
        bezier128Path.addCurve(to: CGPoint(x: 206.73, y: 42.43), controlPoint1: CGPoint(x: 335.65, y: 176.5), controlPoint2: CGPoint(x: -32.75, y: 151.38))
        bezier128Path.addCurve(to: CGPoint(x: 268.37, y: 113.09), controlPoint1: CGPoint(x: 264.73, y: 299.05), controlPoint2: CGPoint(x: 21.99, y: 20.8))
        bezier128Path.addCurve(to: CGPoint(x: 261.99, y: 206.64), controlPoint1: CGPoint(x: 127.93, y: 335.57), controlPoint2: CGPoint(x: 153.04, y: -32.83))
        bezier128Path.addCurve(to: CGPoint(x: 191.33, y: 268.28), controlPoint1: CGPoint(x: 5.37, y: 264.65), controlPoint2: CGPoint(x: 283.63, y: 21.91))
        bezier128Path.addCurve(to: CGPoint(x: 97.78, y: 261.9), controlPoint1: CGPoint(x: -31.14, y: 127.84), controlPoint2: CGPoint(x: 337.26, y: 152.95))
        bezier128Path.addCurve(to: CGPoint(x: 36.14, y: 191.25), controlPoint1: CGPoint(x: 39.78, y: 5.28), controlPoint2: CGPoint(x: 282.52, y: 283.54))
        bezier128Path.addCurve(to: CGPoint(x: 42.52, y: 97.7), controlPoint1: CGPoint(x: 176.59, y: -31.23), controlPoint2: CGPoint(x: 151.47, y: 337.17))
        bezier128Path.addCurve(to: CGPoint(x: 113.18, y: 36.06), controlPoint1: CGPoint(x: 299.14, y: 39.69), controlPoint2: CGPoint(x: 20.89, y: 282.43))
        bezier128Path.close()
        strokeColor.setStroke()
        bezier128Path.lineWidth = 1
        bezier128Path.stroke()

        context.restoreGState()


        //// Bezier 129 Drawing
        context.saveGState()
        context.setAlpha(0.79)

        let bezier129Path = UIBezierPath()
        bezier129Path.move(to: CGPoint(x: 114.1, y: 34.7))
        bezier129Path.addCurve(to: CGPoint(x: 208.36, y: 42.11), controlPoint1: CGPoint(x: 336.93, y: 178.65), controlPoint2: CGPoint(x: -34.24, y: 149.43))
        bezier129Path.addCurve(to: CGPoint(x: 269.76, y: 114.01), controlPoint1: CGPoint(x: 264.13, y: 301.46), controlPoint2: CGPoint(x: 22.33, y: 18.35))
        bezier129Path.addCurve(to: CGPoint(x: 262.34, y: 208.26), controlPoint1: CGPoint(x: 125.81, y: 336.83), controlPoint2: CGPoint(x: 155.02, y: -34.34))
        bezier129Path.addCurve(to: CGPoint(x: 190.45, y: 269.66), controlPoint1: CGPoint(x: 2.99, y: 264.03), controlPoint2: CGPoint(x: 286.1, y: 22.23))
        bezier129Path.addCurve(to: CGPoint(x: 96.19, y: 262.24), controlPoint1: CGPoint(x: -32.38, y: 125.71), controlPoint2: CGPoint(x: 338.79, y: 154.92))
        bezier129Path.addCurve(to: CGPoint(x: 34.79, y: 190.35), controlPoint1: CGPoint(x: 40.42, y: 2.89), controlPoint2: CGPoint(x: 282.22, y: 286.01))
        bezier129Path.addCurve(to: CGPoint(x: 42.21, y: 96.1), controlPoint1: CGPoint(x: 178.74, y: -32.47), controlPoint2: CGPoint(x: 149.53, y: 338.7))
        bezier129Path.addCurve(to: CGPoint(x: 114.1, y: 34.7), controlPoint1: CGPoint(x: 301.56, y: 40.32), controlPoint2: CGPoint(x: 18.45, y: 282.13))
        bezier129Path.close()
        strokeColor.setStroke()
        bezier129Path.lineWidth = 1
        bezier129Path.stroke()

        context.restoreGState()


        //// Bezier 130 Drawing
        context.saveGState()
        context.setAlpha(0.8)

        let bezier130Path = UIBezierPath()
        bezier130Path.move(to: CGPoint(x: 115.05, y: 33.34))
        bezier130Path.addCurve(to: CGPoint(x: 209.99, y: 41.82), controlPoint1: CGPoint(x: 338.17, y: 180.82), controlPoint2: CGPoint(x: -35.72, y: 147.45))
        bezier130Path.addCurve(to: CGPoint(x: 271.14, y: 114.94), controlPoint1: CGPoint(x: 263.48, y: 303.87), controlPoint2: CGPoint(x: 22.69, y: 15.89))
        bezier130Path.addCurve(to: CGPoint(x: 262.66, y: 209.89), controlPoint1: CGPoint(x: 123.66, y: 338.07), controlPoint2: CGPoint(x: 157.03, y: -35.83))
        bezier130Path.addCurve(to: CGPoint(x: 189.54, y: 271.03), controlPoint1: CGPoint(x: 0.61, y: 263.38), controlPoint2: CGPoint(x: 288.59, y: 22.59))
        bezier130Path.addCurve(to: CGPoint(x: 94.59, y: 262.56), controlPoint1: CGPoint(x: -33.59, y: 123.55), controlPoint2: CGPoint(x: 340.31, y: 156.92))
        bezier130Path.addCurve(to: CGPoint(x: 33.45, y: 189.43), controlPoint1: CGPoint(x: 41.1, y: 0.5), controlPoint2: CGPoint(x: 281.89, y: 288.48))
        bezier130Path.addCurve(to: CGPoint(x: 41.92, y: 94.49), controlPoint1: CGPoint(x: 180.93, y: -33.69), controlPoint2: CGPoint(x: 147.56, y: 340.2))
        bezier130Path.addCurve(to: CGPoint(x: 115.05, y: 33.34), controlPoint1: CGPoint(x: 303.98, y: 41), controlPoint2: CGPoint(x: 16, y: 281.79))
        bezier130Path.close()
        strokeColor.setStroke()
        bezier130Path.lineWidth = 1
        bezier130Path.stroke()

        context.restoreGState()


        //// Bezier 131 Drawing
        context.saveGState()
        context.setAlpha(0.8)

        let bezier131Path = UIBezierPath()
        bezier131Path.move(to: CGPoint(x: 116.02, y: 32))
        bezier131Path.addCurve(to: CGPoint(x: 211.64, y: 41.54), controlPoint1: CGPoint(x: 339.4, y: 183.03), controlPoint2: CGPoint(x: -37.18, y: 145.44))
        bezier131Path.addCurve(to: CGPoint(x: 272.51, y: 115.91), controlPoint1: CGPoint(x: 262.8, y: 306.29), controlPoint2: CGPoint(x: 23.1, y: 13.43))
        bezier131Path.addCurve(to: CGPoint(x: 262.97, y: 211.53), controlPoint1: CGPoint(x: 121.48, y: 339.28), controlPoint2: CGPoint(x: 159.07, y: -37.29))
        bezier131Path.addCurve(to: CGPoint(x: 188.6, y: 272.4), controlPoint1: CGPoint(x: -1.78, y: 262.69), controlPoint2: CGPoint(x: 291.08, y: 22.99))
        bezier131Path.addCurve(to: CGPoint(x: 92.98, y: 262.85), controlPoint1: CGPoint(x: -34.78, y: 121.37), controlPoint2: CGPoint(x: 341.8, y: 158.96))
        bezier131Path.addCurve(to: CGPoint(x: 32.11, y: 188.49), controlPoint1: CGPoint(x: 41.82, y: -1.89), controlPoint2: CGPoint(x: 281.52, y: 290.97))
        bezier131Path.addCurve(to: CGPoint(x: 41.65, y: 92.86), controlPoint1: CGPoint(x: 183.14, y: -34.89), controlPoint2: CGPoint(x: 145.55, y: 341.69))
        bezier131Path.addCurve(to: CGPoint(x: 116.02, y: 32), controlPoint1: CGPoint(x: 306.4, y: 41.71), controlPoint2: CGPoint(x: 13.54, y: 281.41))
        bezier131Path.close()
        strokeColor.setStroke()
        bezier131Path.lineWidth = 1
        bezier131Path.stroke()

        context.restoreGState()


        //// Bezier 132 Drawing
        context.saveGState()
        context.setAlpha(0.81)

        let bezier132Path = UIBezierPath()
        bezier132Path.move(to: CGPoint(x: 117.01, y: 30.66))
        bezier132Path.addCurve(to: CGPoint(x: 213.31, y: 41.29), controlPoint1: CGPoint(x: 340.59, y: 185.26), controlPoint2: CGPoint(x: -38.61, y: 143.39))
        bezier132Path.addCurve(to: CGPoint(x: 273.88, y: 116.89), controlPoint1: CGPoint(x: 262.08, y: 308.7), controlPoint2: CGPoint(x: 23.54, y: 10.96))
        bezier132Path.addCurve(to: CGPoint(x: 263.25, y: 213.19), controlPoint1: CGPoint(x: 119.28, y: 340.47), controlPoint2: CGPoint(x: 161.14, y: -38.73))
        bezier132Path.addCurve(to: CGPoint(x: 187.64, y: 273.76), controlPoint1: CGPoint(x: -4.17, y: 261.96), controlPoint2: CGPoint(x: 293.58, y: 23.42))
        bezier132Path.addCurve(to: CGPoint(x: 91.35, y: 263.13), controlPoint1: CGPoint(x: -35.94, y: 119.16), controlPoint2: CGPoint(x: 343.27, y: 161.02))
        bezier132Path.addCurve(to: CGPoint(x: 30.78, y: 187.52), controlPoint1: CGPoint(x: 42.57, y: -4.29), controlPoint2: CGPoint(x: 281.11, y: 293.46))
        bezier132Path.addCurve(to: CGPoint(x: 41.41, y: 91.23), controlPoint1: CGPoint(x: 185.38, y: -36.06), controlPoint2: CGPoint(x: 143.51, y: 343.15))
        bezier132Path.addCurve(to: CGPoint(x: 117.01, y: 30.66), controlPoint1: CGPoint(x: 308.82, y: 42.46), controlPoint2: CGPoint(x: 11.08, y: 280.99))
        bezier132Path.close()
        strokeColor.setStroke()
        bezier132Path.lineWidth = 1
        bezier132Path.stroke()

        context.restoreGState()


        //// Bezier 133 Drawing
        context.saveGState()
        context.setAlpha(0.82)

        let bezier133Path = UIBezierPath()
        bezier133Path.move(to: CGPoint(x: 118.03, y: 29.33))
        bezier133Path.addCurve(to: CGPoint(x: 214.98, y: 41.06), controlPoint1: CGPoint(x: 341.76, y: 187.52), controlPoint2: CGPoint(x: -40.03, y: 141.32))
        bezier133Path.addCurve(to: CGPoint(x: 275.24, y: 117.91), controlPoint1: CGPoint(x: 261.32, y: 311.12), controlPoint2: CGPoint(x: 24.03, y: 8.49))
        bezier133Path.addCurve(to: CGPoint(x: 263.51, y: 214.86), controlPoint1: CGPoint(x: 117.04, y: 341.64), controlPoint2: CGPoint(x: 163.24, y: -40.15))
        bezier133Path.addCurve(to: CGPoint(x: 186.66, y: 275.11), controlPoint1: CGPoint(x: -6.56, y: 261.2), controlPoint2: CGPoint(x: 296.08, y: 23.9))
        bezier133Path.addCurve(to: CGPoint(x: 89.71, y: 263.38), controlPoint1: CGPoint(x: -37.07, y: 116.92), controlPoint2: CGPoint(x: 344.72, y: 163.12))
        bezier133Path.addCurve(to: CGPoint(x: 29.45, y: 186.53), controlPoint1: CGPoint(x: 43.37, y: -6.68), controlPoint2: CGPoint(x: 280.67, y: 295.95))
        bezier133Path.addCurve(to: CGPoint(x: 41.18, y: 89.58), controlPoint1: CGPoint(x: 187.65, y: -37.2), controlPoint2: CGPoint(x: 141.45, y: 344.59))
        bezier133Path.addCurve(to: CGPoint(x: 118.03, y: 29.33), controlPoint1: CGPoint(x: 311.25, y: 43.24), controlPoint2: CGPoint(x: 8.61, y: 280.54))
        bezier133Path.close()
        strokeColor.setStroke()
        bezier133Path.lineWidth = 1
        bezier133Path.stroke()

        context.restoreGState()


        //// Bezier 134 Drawing
        context.saveGState()
        context.setAlpha(0.82)

        let bezier134Path = UIBezierPath()
        bezier134Path.move(to: CGPoint(x: 119.08, y: 28))
        bezier134Path.addCurve(to: CGPoint(x: 216.67, y: 40.85), controlPoint1: CGPoint(x: 342.91, y: 189.81), controlPoint2: CGPoint(x: -41.42, y: 139.22))
        bezier134Path.addCurve(to: CGPoint(x: 276.59, y: 118.94), controlPoint1: CGPoint(x: 260.52, y: 313.54), controlPoint2: CGPoint(x: 24.54, y: 6.01))
        bezier134Path.addCurve(to: CGPoint(x: 263.74, y: 216.54), controlPoint1: CGPoint(x: 114.78, y: 342.78), controlPoint2: CGPoint(x: 165.38, y: -41.55))
        bezier134Path.addCurve(to: CGPoint(x: 185.65, y: 276.46), controlPoint1: CGPoint(x: -8.95, y: 260.39), controlPoint2: CGPoint(x: 298.59, y: 24.41))
        bezier134Path.addCurve(to: CGPoint(x: 88.06, y: 263.61), controlPoint1: CGPoint(x: -38.18, y: 114.65), controlPoint2: CGPoint(x: 346.14, y: 165.25))
        bezier134Path.addCurve(to: CGPoint(x: 28.13, y: 185.52), controlPoint1: CGPoint(x: 44.2, y: -9.08), controlPoint2: CGPoint(x: 280.18, y: 298.46))
        bezier134Path.addCurve(to: CGPoint(x: 40.98, y: 87.93), controlPoint1: CGPoint(x: 189.94, y: -38.31), controlPoint2: CGPoint(x: 139.35, y: 346.01))
        bezier134Path.addCurve(to: CGPoint(x: 119.08, y: 28), controlPoint1: CGPoint(x: 313.67, y: 44.07), controlPoint2: CGPoint(x: 6.14, y: 280.05))
        bezier134Path.close()
        strokeColor.setStroke()
        bezier134Path.lineWidth = 1
        bezier134Path.stroke()

        context.restoreGState()


        //// Bezier 135 Drawing
        context.saveGState()
        context.setAlpha(0.83)

        let bezier135Path = UIBezierPath()
        bezier135Path.move(to: CGPoint(x: 120.14, y: 26.69))
        bezier135Path.addCurve(to: CGPoint(x: 218.36, y: 40.67), controlPoint1: CGPoint(x: 344.02, y: 192.13), controlPoint2: CGPoint(x: -42.78, y: 137.08))
        bezier135Path.addCurve(to: CGPoint(x: 277.93, y: 120.01), controlPoint1: CGPoint(x: 259.69, y: 315.96), controlPoint2: CGPoint(x: 25.1, y: 3.52))
        bezier135Path.addCurve(to: CGPoint(x: 263.95, y: 218.23), controlPoint1: CGPoint(x: 112.49, y: 343.89), controlPoint2: CGPoint(x: 167.54, y: -42.92))
        bezier135Path.addCurve(to: CGPoint(x: 184.62, y: 277.8), controlPoint1: CGPoint(x: -11.34, y: 259.55), controlPoint2: CGPoint(x: 301.1, y: 24.97))
        bezier135Path.addCurve(to: CGPoint(x: 86.39, y: 263.82), controlPoint1: CGPoint(x: -39.26, y: 112.36), controlPoint2: CGPoint(x: 347.54, y: 167.41))
        bezier135Path.addCurve(to: CGPoint(x: 26.82, y: 184.48), controlPoint1: CGPoint(x: 45.07, y: -11.47), controlPoint2: CGPoint(x: 279.66, y: 300.97))
        bezier135Path.addCurve(to: CGPoint(x: 40.8, y: 86.26), controlPoint1: CGPoint(x: 192.27, y: -39.4), controlPoint2: CGPoint(x: 137.22, y: 347.41))
        bezier135Path.addCurve(to: CGPoint(x: 120.14, y: 26.69), controlPoint1: CGPoint(x: 316.1, y: 44.94), controlPoint2: CGPoint(x: 3.66, y: 279.52))
        bezier135Path.close()
        strokeColor.setStroke()
        bezier135Path.lineWidth = 1
        bezier135Path.stroke()

        context.restoreGState()


        //// Bezier 136 Drawing
        context.saveGState()
        context.setAlpha(0.84)

        let bezier136Path = UIBezierPath()
        bezier136Path.move(to: CGPoint(x: 121.23, y: 25.38))
        bezier136Path.addCurve(to: CGPoint(x: 220.07, y: 40.51), controlPoint1: CGPoint(x: 345.11, y: 194.48), controlPoint2: CGPoint(x: -44.13, y: 134.92))
        bezier136Path.addCurve(to: CGPoint(x: 279.27, y: 121.09), controlPoint1: CGPoint(x: 258.81, y: 318.38), controlPoint2: CGPoint(x: 25.7, y: 1.03))
        bezier136Path.addCurve(to: CGPoint(x: 264.14, y: 219.93), controlPoint1: CGPoint(x: 110.18, y: 344.97), controlPoint2: CGPoint(x: 169.74, y: -44.26))
        bezier136Path.addCurve(to: CGPoint(x: 183.56, y: 279.13), controlPoint1: CGPoint(x: -13.73, y: 258.67), controlPoint2: CGPoint(x: 303.62, y: 25.56))
        bezier136Path.addCurve(to: CGPoint(x: 84.72, y: 264), controlPoint1: CGPoint(x: -40.32, y: 110.04), controlPoint2: CGPoint(x: 348.92, y: 169.6))
        bezier136Path.addCurve(to: CGPoint(x: 25.52, y: 183.42), controlPoint1: CGPoint(x: 45.98, y: -13.87), controlPoint2: CGPoint(x: 279.1, y: 303.48))
        bezier136Path.addCurve(to: CGPoint(x: 40.65, y: 84.58), controlPoint1: CGPoint(x: 194.62, y: -40.46), controlPoint2: CGPoint(x: 135.05, y: 348.78))
        bezier136Path.addCurve(to: CGPoint(x: 121.23, y: 25.38), controlPoint1: CGPoint(x: 318.52, y: 45.84), controlPoint2: CGPoint(x: 1.17, y: 278.96))
        bezier136Path.close()
        strokeColor.setStroke()
        bezier136Path.lineWidth = 1
        bezier136Path.stroke()

        context.restoreGState()


        //// Bezier 137 Drawing
        context.saveGState()
        context.setAlpha(0.84)

        let bezier137Path = UIBezierPath()
        bezier137Path.move(to: CGPoint(x: 122.35, y: 24.09))
        bezier137Path.addCurve(to: CGPoint(x: 221.79, y: 40.37), controlPoint1: CGPoint(x: 346.17, y: 196.85), controlPoint2: CGPoint(x: -45.44, y: 132.72))
        bezier137Path.addCurve(to: CGPoint(x: 280.59, y: 122.21), controlPoint1: CGPoint(x: 257.9, y: 320.8), controlPoint2: CGPoint(x: 26.33, y: -1.46))
        bezier137Path.addCurve(to: CGPoint(x: 264.31, y: 221.65), controlPoint1: CGPoint(x: 107.83, y: 346.03), controlPoint2: CGPoint(x: 171.96, y: -45.59))
        bezier137Path.addCurve(to: CGPoint(x: 182.48, y: 280.45), controlPoint1: CGPoint(x: -16.12, y: 257.75), controlPoint2: CGPoint(x: 306.14, y: 26.19))
        bezier137Path.addCurve(to: CGPoint(x: 83.03, y: 264.17), controlPoint1: CGPoint(x: -41.35, y: 107.69), controlPoint2: CGPoint(x: 350.27, y: 171.82))
        bezier137Path.addCurve(to: CGPoint(x: 24.23, y: 182.33), controlPoint1: CGPoint(x: 46.93, y: -16.26), controlPoint2: CGPoint(x: 278.49, y: 306))
        bezier137Path.addCurve(to: CGPoint(x: 40.51, y: 82.89), controlPoint1: CGPoint(x: 196.99, y: -41.49), controlPoint2: CGPoint(x: 132.86, y: 350.13))
        bezier137Path.addCurve(to: CGPoint(x: 122.35, y: 24.09), controlPoint1: CGPoint(x: 320.94, y: 46.79), controlPoint2: CGPoint(x: -1.32, y: 278.35))
        bezier137Path.close()
        strokeColor.setStroke()
        bezier137Path.lineWidth = 1
        bezier137Path.stroke()

        context.restoreGState()


        //// Bezier 138 Drawing
        context.saveGState()
        context.setAlpha(0.85)

        let bezier138Path = UIBezierPath()
        bezier138Path.move(to: CGPoint(x: 123.49, y: 22.8))
        bezier138Path.addCurve(to: CGPoint(x: 223.52, y: 40.26), controlPoint1: CGPoint(x: 347.2, y: 199.25), controlPoint2: CGPoint(x: -46.74, y: 130.5))
        bezier138Path.addCurve(to: CGPoint(x: 281.91, y: 123.34), controlPoint1: CGPoint(x: 256.94, y: 323.22), controlPoint2: CGPoint(x: 27, y: -3.95))
        bezier138Path.addCurve(to: CGPoint(x: 264.45, y: 223.38), controlPoint1: CGPoint(x: 105.46, y: 347.06), controlPoint2: CGPoint(x: 174.21, y: -46.88))
        bezier138Path.addCurve(to: CGPoint(x: 181.37, y: 281.77), controlPoint1: CGPoint(x: -18.51, y: 256.8), controlPoint2: CGPoint(x: 308.67, y: 26.86))
        bezier138Path.addCurve(to: CGPoint(x: 81.34, y: 264.31), controlPoint1: CGPoint(x: -42.34, y: 105.32), controlPoint2: CGPoint(x: 351.6, y: 174.07))
        bezier138Path.addCurve(to: CGPoint(x: 22.95, y: 181.23), controlPoint1: CGPoint(x: 47.91, y: -18.65), controlPoint2: CGPoint(x: 277.85, y: 308.52))
        bezier138Path.addCurve(to: CGPoint(x: 40.41, y: 81.19), controlPoint1: CGPoint(x: 199.39, y: -42.49), controlPoint2: CGPoint(x: 130.64, y: 351.45))
        bezier138Path.addCurve(to: CGPoint(x: 123.49, y: 22.8), controlPoint1: CGPoint(x: 323.36, y: 47.77), controlPoint2: CGPoint(x: -3.81, y: 277.71))
        bezier138Path.close()
        strokeColor.setStroke()
        bezier138Path.lineWidth = 1
        bezier138Path.stroke()

        context.restoreGState()


        //// Bezier 139 Drawing
        context.saveGState()
        context.setAlpha(0.86)

        let bezier139Path = UIBezierPath()
        bezier139Path.move(to: CGPoint(x: 124.65, y: 21.53))
        bezier139Path.addCurve(to: CGPoint(x: 225.26, y: 40.17), controlPoint1: CGPoint(x: 348.2, y: 201.68), controlPoint2: CGPoint(x: -48.01, y: 128.24))
        bezier139Path.addCurve(to: CGPoint(x: 283.22, y: 124.5), controlPoint1: CGPoint(x: 255.95, y: 325.64), controlPoint2: CGPoint(x: 27.71, y: -6.45))
        bezier139Path.addCurve(to: CGPoint(x: 264.57, y: 225.11), controlPoint1: CGPoint(x: 103.06, y: 348.06), controlPoint2: CGPoint(x: 176.5, y: -48.15))
        bezier139Path.addCurve(to: CGPoint(x: 180.24, y: 283.07), controlPoint1: CGPoint(x: -20.89, y: 255.8), controlPoint2: CGPoint(x: 311.19, y: 27.57))
        bezier139Path.addCurve(to: CGPoint(x: 79.63, y: 264.42), controlPoint1: CGPoint(x: -43.31, y: 102.92), controlPoint2: CGPoint(x: 352.9, y: 176.35))
        bezier139Path.addCurve(to: CGPoint(x: 21.67, y: 180.1), controlPoint1: CGPoint(x: 48.94, y: -21.04), controlPoint2: CGPoint(x: 277.18, y: 311.05))
        bezier139Path.addCurve(to: CGPoint(x: 40.32, y: 79.48), controlPoint1: CGPoint(x: 201.82, y: -43.46), controlPoint2: CGPoint(x: 128.39, y: 352.75))
        bezier139Path.addCurve(to: CGPoint(x: 124.65, y: 21.53), controlPoint1: CGPoint(x: 325.78, y: 48.79), controlPoint2: CGPoint(x: -6.31, y: 277.03))
        bezier139Path.close()
        strokeColor.setStroke()
        bezier139Path.lineWidth = 1
        bezier139Path.stroke()

        context.restoreGState()


        //// Bezier 140 Drawing
        context.saveGState()
        context.setAlpha(0.86)

        let bezier140Path = UIBezierPath()
        bezier140Path.move(to: CGPoint(x: 125.83, y: 20.26))
        bezier140Path.addCurve(to: CGPoint(x: 227.01, y: 40.11), controlPoint1: CGPoint(x: 349.17, y: 204.13), controlPoint2: CGPoint(x: -49.25, y: 125.96))
        bezier140Path.addCurve(to: CGPoint(x: 284.51, y: 125.69), controlPoint1: CGPoint(x: 254.92, y: 328.05), controlPoint2: CGPoint(x: 28.46, y: -8.95))
        bezier140Path.addCurve(to: CGPoint(x: 264.66, y: 226.86), controlPoint1: CGPoint(x: 100.64, y: 349.03), controlPoint2: CGPoint(x: 178.81, y: -49.4))
        bezier140Path.addCurve(to: CGPoint(x: 179.09, y: 284.37), controlPoint1: CGPoint(x: -23.28, y: 254.77), controlPoint2: CGPoint(x: 313.72, y: 28.32))
        bezier140Path.addCurve(to: CGPoint(x: 77.91, y: 264.52), controlPoint1: CGPoint(x: -44.26, y: 100.5), controlPoint2: CGPoint(x: 354.17, y: 178.67))
        bezier140Path.addCurve(to: CGPoint(x: 20.41, y: 178.94), controlPoint1: CGPoint(x: 50, y: -23.42), controlPoint2: CGPoint(x: 276.46, y: 313.58))
        bezier140Path.addCurve(to: CGPoint(x: 40.26, y: 77.77), controlPoint1: CGPoint(x: 204.28, y: -44.4), controlPoint2: CGPoint(x: 126.11, y: 354.03))
        bezier140Path.addCurve(to: CGPoint(x: 125.83, y: 20.26), controlPoint1: CGPoint(x: 328.2, y: 49.86), controlPoint2: CGPoint(x: -8.81, y: 276.31))
        bezier140Path.close()
        strokeColor.setStroke()
        bezier140Path.lineWidth = 1
        bezier140Path.stroke()

        context.restoreGState()


        //// Bezier 141 Drawing
        context.saveGState()
        context.setAlpha(0.87)

        let bezier141Path = UIBezierPath()
        bezier141Path.move(to: CGPoint(x: 127.04, y: 19.01))
        bezier141Path.addCurve(to: CGPoint(x: 228.76, y: 40.07), controlPoint1: CGPoint(x: 350.12, y: 206.61), controlPoint2: CGPoint(x: -50.47, y: 123.65))
        bezier141Path.addCurve(to: CGPoint(x: 285.8, y: 126.9), controlPoint1: CGPoint(x: 253.85, y: 330.47), controlPoint2: CGPoint(x: 29.25, y: -11.45))
        bezier141Path.addCurve(to: CGPoint(x: 264.73, y: 228.62), controlPoint1: CGPoint(x: 98.19, y: 349.97), controlPoint2: CGPoint(x: 181.15, y: -50.61))
        bezier141Path.addCurve(to: CGPoint(x: 177.91, y: 285.65), controlPoint1: CGPoint(x: -25.66, y: 253.7), controlPoint2: CGPoint(x: 316.26, y: 29.1))
        bezier141Path.addCurve(to: CGPoint(x: 76.19, y: 264.59), controlPoint1: CGPoint(x: -45.17, y: 98.05), controlPoint2: CGPoint(x: 355.42, y: 181.01))
        bezier141Path.addCurve(to: CGPoint(x: 19.15, y: 177.76), controlPoint1: CGPoint(x: 51.1, y: -25.81), controlPoint2: CGPoint(x: 275.7, y: 316.11))
        bezier141Path.addCurve(to: CGPoint(x: 40.22, y: 76.04), controlPoint1: CGPoint(x: 206.76, y: -45.31), controlPoint2: CGPoint(x: 123.8, y: 355.27))
        bezier141Path.addCurve(to: CGPoint(x: 127.04, y: 19.01), controlPoint1: CGPoint(x: 330.61, y: 50.96), controlPoint2: CGPoint(x: -11.31, y: 275.56))
        bezier141Path.close()
        strokeColor.setStroke()
        bezier141Path.lineWidth = 1
        bezier141Path.stroke()

        context.restoreGState()


        //// Bezier 142 Drawing
        context.saveGState()
        context.setAlpha(0.88)

        let bezier142Path = UIBezierPath()
        bezier142Path.move(to: CGPoint(x: 128.27, y: 17.76))
        bezier142Path.addCurve(to: CGPoint(x: 230.53, y: 40.06), controlPoint1: CGPoint(x: 351.03, y: 209.12), controlPoint2: CGPoint(x: -51.66, y: 121.32))
        bezier142Path.addCurve(to: CGPoint(x: 287.07, y: 128.13), controlPoint1: CGPoint(x: 252.74, y: 332.88), controlPoint2: CGPoint(x: 30.08, y: -13.95))
        bezier142Path.addCurve(to: CGPoint(x: 264.78, y: 230.39), controlPoint1: CGPoint(x: 95.72, y: 350.89), controlPoint2: CGPoint(x: 183.52, y: -51.8))
        bezier142Path.addCurve(to: CGPoint(x: 176.7, y: 286.93), controlPoint1: CGPoint(x: -28.04, y: 252.59), controlPoint2: CGPoint(x: 318.79, y: 29.93))
        bezier142Path.addCurve(to: CGPoint(x: 74.45, y: 264.63), controlPoint1: CGPoint(x: -46.05, y: 95.58), controlPoint2: CGPoint(x: 356.64, y: 183.38))
        bezier142Path.addCurve(to: CGPoint(x: 17.91, y: 176.56), controlPoint1: CGPoint(x: 52.24, y: -28.18), controlPoint2: CGPoint(x: 274.9, y: 318.64))
        bezier142Path.addCurve(to: CGPoint(x: 40.2, y: 74.31), controlPoint1: CGPoint(x: 209.26, y: -46.19), controlPoint2: CGPoint(x: 121.46, y: 356.5))
        bezier142Path.addCurve(to: CGPoint(x: 128.27, y: 17.76), controlPoint1: CGPoint(x: 333.02, y: 52.1), controlPoint2: CGPoint(x: -13.81, y: 274.76))
        bezier142Path.close()
        strokeColor.setStroke()
        bezier142Path.lineWidth = 1
        bezier142Path.stroke()

        context.restoreGState()


        //// Bezier 143 Drawing
        context.saveGState()
        context.setAlpha(0.88)

        let bezier143Path = UIBezierPath()
        bezier143Path.move(to: CGPoint(x: 129.53, y: 16.53))
        bezier143Path.addCurve(to: CGPoint(x: 232.31, y: 40.07), controlPoint1: CGPoint(x: 351.91, y: 211.65), controlPoint2: CGPoint(x: -52.83, y: 118.95))
        bezier143Path.addCurve(to: CGPoint(x: 288.34, y: 129.39), controlPoint1: CGPoint(x: 251.59, y: 335.28), controlPoint2: CGPoint(x: 30.94, y: -16.45))
        bezier143Path.addCurve(to: CGPoint(x: 264.8, y: 232.17), controlPoint1: CGPoint(x: 93.22, y: 351.77), controlPoint2: CGPoint(x: 185.92, y: -52.97))
        bezier143Path.addCurve(to: CGPoint(x: 175.48, y: 288.19), controlPoint1: CGPoint(x: -30.42, y: 251.44), controlPoint2: CGPoint(x: 321.32, y: 30.8))
        bezier143Path.addCurve(to: CGPoint(x: 72.7, y: 264.66), controlPoint1: CGPoint(x: -46.9, y: 93.08), controlPoint2: CGPoint(x: 357.83, y: 185.78))
        bezier143Path.addCurve(to: CGPoint(x: 16.67, y: 175.34), controlPoint1: CGPoint(x: 53.42, y: -30.56), controlPoint2: CGPoint(x: 274.07, y: 321.18))
        bezier143Path.addCurve(to: CGPoint(x: 40.21, y: 72.56), controlPoint1: CGPoint(x: 211.79, y: -47.04), controlPoint2: CGPoint(x: 119.09, y: 357.69))
        bezier143Path.addCurve(to: CGPoint(x: 129.53, y: 16.53), controlPoint1: CGPoint(x: 335.42, y: 53.28), controlPoint2: CGPoint(x: -16.31, y: 273.93))
        bezier143Path.close()
        strokeColor.setStroke()
        bezier143Path.lineWidth = 1
        bezier143Path.stroke()

        context.restoreGState()


        //// Bezier 144 Drawing
        context.saveGState()
        context.setAlpha(0.89)

        let bezier144Path = UIBezierPath()
        bezier144Path.move(to: CGPoint(x: 130.81, y: 15.31))
        bezier144Path.addCurve(to: CGPoint(x: 234.09, y: 40.11), controlPoint1: CGPoint(x: 352.76, y: 214.2), controlPoint2: CGPoint(x: -53.96, y: 116.56))
        bezier144Path.addCurve(to: CGPoint(x: 289.59, y: 130.67), controlPoint1: CGPoint(x: 250.4, y: 337.69), controlPoint2: CGPoint(x: 31.85, y: -18.96))
        bezier144Path.addCurve(to: CGPoint(x: 264.79, y: 233.95), controlPoint1: CGPoint(x: 90.7, y: 352.62), controlPoint2: CGPoint(x: 188.34, y: -54.1))
        bezier144Path.addCurve(to: CGPoint(x: 174.23, y: 289.45), controlPoint1: CGPoint(x: -32.79, y: 250.26), controlPoint2: CGPoint(x: 323.85, y: 31.71))
        bezier144Path.addCurve(to: CGPoint(x: 70.95, y: 264.65), controlPoint1: CGPoint(x: -47.72, y: 90.56), controlPoint2: CGPoint(x: 359, y: 188.2))
        bezier144Path.addCurve(to: CGPoint(x: 15.45, y: 174.09), controlPoint1: CGPoint(x: 54.64, y: -32.92), controlPoint2: CGPoint(x: 273.19, y: 323.72))
        bezier144Path.addCurve(to: CGPoint(x: 40.25, y: 70.81), controlPoint1: CGPoint(x: 214.34, y: -47.86), controlPoint2: CGPoint(x: 116.69, y: 358.86))
        bezier144Path.addCurve(to: CGPoint(x: 130.81, y: 15.31), controlPoint1: CGPoint(x: 337.82, y: 54.5), controlPoint2: CGPoint(x: -18.82, y: 273.05))
        bezier144Path.close()
        strokeColor.setStroke()
        bezier144Path.lineWidth = 1
        bezier144Path.stroke()

        context.restoreGState()


        //// Bezier 145 Drawing
        context.saveGState()
        context.setAlpha(0.9)

        let bezier145Path = UIBezierPath()
        bezier145Path.move(to: CGPoint(x: 132.11, y: 14.11))
        bezier145Path.addCurve(to: CGPoint(x: 235.88, y: 40.17), controlPoint1: CGPoint(x: 353.58, y: 216.78), controlPoint2: CGPoint(x: -55.07, y: 114.14))
        bezier145Path.addCurve(to: CGPoint(x: 290.83, y: 131.98), controlPoint1: CGPoint(x: 249.17, y: 340.08), controlPoint2: CGPoint(x: 32.79, y: -21.46))
        bezier145Path.addCurve(to: CGPoint(x: 264.76, y: 235.75), controlPoint1: CGPoint(x: 88.15, y: 353.44), controlPoint2: CGPoint(x: 190.8, y: -55.21))
        bezier145Path.addCurve(to: CGPoint(x: 172.95, y: 290.69), controlPoint1: CGPoint(x: -35.15, y: 249.03), controlPoint2: CGPoint(x: 326.39, y: 32.66))
        bezier145Path.addCurve(to: CGPoint(x: 69.18, y: 264.63), controlPoint1: CGPoint(x: -48.51, y: 88.02), controlPoint2: CGPoint(x: 360.14, y: 190.66))
        bezier145Path.addCurve(to: CGPoint(x: 14.24, y: 172.82), controlPoint1: CGPoint(x: 55.9, y: -35.29), controlPoint2: CGPoint(x: 272.28, y: 326.25))
        bezier145Path.addCurve(to: CGPoint(x: 40.3, y: 69.05), controlPoint1: CGPoint(x: 216.91, y: -48.65), controlPoint2: CGPoint(x: 114.27, y: 360))
        bezier145Path.addCurve(to: CGPoint(x: 132.11, y: 14.11), controlPoint1: CGPoint(x: 340.22, y: 55.76), controlPoint2: CGPoint(x: -21.32, y: 272.14))
        bezier145Path.close()
        strokeColor.setStroke()
        bezier145Path.lineWidth = 1
        bezier145Path.stroke()

        context.restoreGState()


        //// Bezier 146 Drawing
        context.saveGState()
        context.setAlpha(0.9)

        let bezier146Path = UIBezierPath()
        bezier146Path.move(to: CGPoint(x: 133.44, y: 12.91))
        bezier146Path.addCurve(to: CGPoint(x: 237.68, y: 40.26), controlPoint1: CGPoint(x: 354.36, y: 219.38), controlPoint2: CGPoint(x: -56.15, y: 111.69))
        bezier146Path.addCurve(to: CGPoint(x: 292.05, y: 133.31), controlPoint1: CGPoint(x: 247.9, y: 342.48), controlPoint2: CGPoint(x: 33.77, y: -23.95))
        bezier146Path.addCurve(to: CGPoint(x: 264.71, y: 237.55), controlPoint1: CGPoint(x: 85.58, y: 354.23), controlPoint2: CGPoint(x: 193.27, y: -56.28))
        bezier146Path.addCurve(to: CGPoint(x: 171.66, y: 291.92), controlPoint1: CGPoint(x: -37.51, y: 247.77), controlPoint2: CGPoint(x: 328.92, y: 33.64))
        bezier146Path.addCurve(to: CGPoint(x: 67.41, y: 264.58), controlPoint1: CGPoint(x: -49.27, y: 85.45), controlPoint2: CGPoint(x: 361.25, y: 193.15))
        bezier146Path.addCurve(to: CGPoint(x: 13.04, y: 171.53), controlPoint1: CGPoint(x: 57.19, y: -37.64), controlPoint2: CGPoint(x: 271.32, y: 328.79))
        bezier146Path.addCurve(to: CGPoint(x: 40.39, y: 67.28), controlPoint1: CGPoint(x: 219.51, y: -49.4), controlPoint2: CGPoint(x: 111.82, y: 361.12))
        bezier146Path.addCurve(to: CGPoint(x: 133.44, y: 12.91), controlPoint1: CGPoint(x: 342.6, y: 57.07), controlPoint2: CGPoint(x: -23.83, y: 271.19))
        bezier146Path.close()
        strokeColor.setStroke()
        bezier146Path.lineWidth = 1
        bezier146Path.stroke()

        context.restoreGState()


        //// Bezier 147 Drawing
        context.saveGState()
        context.setAlpha(0.91)

        let bezier147Path = UIBezierPath()
        bezier147Path.move(to: CGPoint(x: 134.78, y: 11.73))
        bezier147Path.addCurve(to: CGPoint(x: 239.49, y: 40.37), controlPoint1: CGPoint(x: 355.11, y: 222.01), controlPoint2: CGPoint(x: -57.21, y: 109.21))
        bezier147Path.addCurve(to: CGPoint(x: 293.27, y: 134.66), controlPoint1: CGPoint(x: 246.59, y: 344.86), controlPoint2: CGPoint(x: 34.8, y: -26.45))
        bezier147Path.addCurve(to: CGPoint(x: 264.62, y: 239.36), controlPoint1: CGPoint(x: 82.98, y: 354.99), controlPoint2: CGPoint(x: 195.78, y: -57.33))
        bezier147Path.addCurve(to: CGPoint(x: 170.34, y: 293.14), controlPoint1: CGPoint(x: -39.87, y: 246.47), controlPoint2: CGPoint(x: 331.45, y: 34.67))
        bezier147Path.addCurve(to: CGPoint(x: 65.63, y: 264.5), controlPoint1: CGPoint(x: -50, y: 82.86), controlPoint2: CGPoint(x: 362.32, y: 195.66))
        bezier147Path.addCurve(to: CGPoint(x: 11.85, y: 170.21), controlPoint1: CGPoint(x: 58.53, y: -39.99), controlPoint2: CGPoint(x: 270.32, y: 331.32))
        bezier147Path.addCurve(to: CGPoint(x: 40.49, y: 65.51), controlPoint1: CGPoint(x: 222.14, y: -50.12), controlPoint2: CGPoint(x: 109.34, y: 362.2))
        bezier147Path.addCurve(to: CGPoint(x: 134.78, y: 11.73), controlPoint1: CGPoint(x: 344.99, y: 58.41), controlPoint2: CGPoint(x: -26.33, y: 270.2))
        bezier147Path.close()
        strokeColor.setStroke()
        bezier147Path.lineWidth = 1
        bezier147Path.stroke()

        context.restoreGState()


        //// Bezier 148 Drawing
        context.saveGState()
        context.setAlpha(0.91)

        let bezier148Path = UIBezierPath()
        bezier148Path.move(to: CGPoint(x: 136.15, y: 10.56))
        bezier148Path.addCurve(to: CGPoint(x: 241.3, y: 40.51), controlPoint1: CGPoint(x: 355.83, y: 224.66), controlPoint2: CGPoint(x: -58.23, y: 106.71))
        bezier148Path.addCurve(to: CGPoint(x: 294.47, y: 136.04), controlPoint1: CGPoint(x: 245.24, y: 347.24), controlPoint2: CGPoint(x: 35.86, y: -28.95))
        bezier148Path.addCurve(to: CGPoint(x: 264.52, y: 241.18), controlPoint1: CGPoint(x: 80.36, y: 355.72), controlPoint2: CGPoint(x: 198.31, y: -58.34))
        bezier148Path.addCurve(to: CGPoint(x: 168.99, y: 294.35), controlPoint1: CGPoint(x: -42.21, y: 245.13), controlPoint2: CGPoint(x: 333.98, y: 35.74))
        bezier148Path.addCurve(to: CGPoint(x: 63.85, y: 264.4), controlPoint1: CGPoint(x: -50.69, y: 80.25), controlPoint2: CGPoint(x: 363.37, y: 198.2))
        bezier148Path.addCurve(to: CGPoint(x: 10.68, y: 168.87), controlPoint1: CGPoint(x: 59.9, y: -42.33), controlPoint2: CGPoint(x: 269.29, y: 333.86))
        bezier148Path.addCurve(to: CGPoint(x: 40.63, y: 63.73), controlPoint1: CGPoint(x: 224.78, y: -50.81), controlPoint2: CGPoint(x: 106.83, y: 363.26))
        bezier148Path.addCurve(to: CGPoint(x: 136.15, y: 10.56), controlPoint1: CGPoint(x: 347.36, y: 59.79), controlPoint2: CGPoint(x: -28.83, y: 269.17))
        bezier148Path.close()
        strokeColor.setStroke()
        bezier148Path.lineWidth = 1
        bezier148Path.stroke()

        context.restoreGState()


        //// Bezier 149 Drawing
        context.saveGState()
        context.setAlpha(0.92)

        let bezier149Path = UIBezierPath()
        bezier149Path.move(to: CGPoint(x: 137.55, y: 9.4))
        bezier149Path.addCurve(to: CGPoint(x: 243.12, y: 40.68), controlPoint1: CGPoint(x: 356.52, y: 227.34), controlPoint2: CGPoint(x: -59.22, y: 104.19))
        bezier149Path.addCurve(to: CGPoint(x: 295.66, y: 137.44), controlPoint1: CGPoint(x: 243.85, y: 349.61), controlPoint2: CGPoint(x: 36.96, y: -31.44))
        bezier149Path.addCurve(to: CGPoint(x: 264.38, y: 243.01), controlPoint1: CGPoint(x: 77.72, y: 356.41), controlPoint2: CGPoint(x: 200.87, y: -59.33))
        bezier149Path.addCurve(to: CGPoint(x: 167.62, y: 295.55), controlPoint1: CGPoint(x: -44.55, y: 243.75), controlPoint2: CGPoint(x: 336.5, y: 36.85))
        bezier149Path.addCurve(to: CGPoint(x: 62.05, y: 264.28), controlPoint1: CGPoint(x: -51.35, y: 77.62), controlPoint2: CGPoint(x: 364.39, y: 200.76))
        bezier149Path.addCurve(to: CGPoint(x: 9.51, y: 167.51), controlPoint1: CGPoint(x: 61.32, y: -44.66), controlPoint2: CGPoint(x: 268.21, y: 336.39))
        bezier149Path.addCurve(to: CGPoint(x: 40.79, y: 61.94), controlPoint1: CGPoint(x: 227.45, y: -51.46), controlPoint2: CGPoint(x: 104.3, y: 364.28))
        bezier149Path.addCurve(to: CGPoint(x: 137.55, y: 9.4), controlPoint1: CGPoint(x: 349.72, y: 61.21), controlPoint2: CGPoint(x: -31.33, y: 268.1))
        bezier149Path.close()
        strokeColor.setStroke()
        bezier149Path.lineWidth = 1
        bezier149Path.stroke()

        context.restoreGState()


        //// Bezier 150 Drawing
        context.saveGState()
        context.setAlpha(0.93)

        let bezier150Path = UIBezierPath()
        bezier150Path.move(to: CGPoint(x: 138.96, y: 8.26))
        bezier150Path.addCurve(to: CGPoint(x: 244.94, y: 40.87), controlPoint1: CGPoint(x: 357.17, y: 230.03), controlPoint2: CGPoint(x: -60.19, y: 101.64))
        bezier150Path.addCurve(to: CGPoint(x: 296.83, y: 138.86), controlPoint1: CGPoint(x: 242.43, y: 351.98), controlPoint2: CGPoint(x: 38.1, y: -33.93))
        bezier150Path.addCurve(to: CGPoint(x: 264.23, y: 244.84), controlPoint1: CGPoint(x: 75.06, y: 357.07), controlPoint2: CGPoint(x: 203.46, y: -60.29))
        bezier150Path.addCurve(to: CGPoint(x: 166.23, y: 296.73), controlPoint1: CGPoint(x: -46.89, y: 242.33), controlPoint2: CGPoint(x: 339.02, y: 38))
        bezier150Path.addCurve(to: CGPoint(x: 60.25, y: 264.13), controlPoint1: CGPoint(x: -51.98, y: 74.96), controlPoint2: CGPoint(x: 365.38, y: 203.36))
        bezier150Path.addCurve(to: CGPoint(x: 8.36, y: 166.13), controlPoint1: CGPoint(x: 62.77, y: -46.99), controlPoint2: CGPoint(x: 267.09, y: 338.92))
        bezier150Path.addCurve(to: CGPoint(x: 40.97, y: 60.15), controlPoint1: CGPoint(x: 230.13, y: -52.08), controlPoint2: CGPoint(x: 101.74, y: 365.28))
        bezier150Path.addCurve(to: CGPoint(x: 138.96, y: 8.26), controlPoint1: CGPoint(x: 352.08, y: 62.67), controlPoint2: CGPoint(x: -33.83, y: 266.99))
        bezier150Path.close()
        strokeColor.setStroke()
        bezier150Path.lineWidth = 1
        bezier150Path.stroke()

        context.restoreGState()


        //// Bezier 151 Drawing
        context.saveGState()
        context.setAlpha(0.93)

        let bezier151Path = UIBezierPath()
        bezier151Path.move(to: CGPoint(x: 140.4, y: 7.14))
        bezier151Path.addCurve(to: CGPoint(x: 246.78, y: 41.09), controlPoint1: CGPoint(x: 357.79, y: 232.75), controlPoint2: CGPoint(x: -61.12, y: 99.06))
        bezier151Path.addCurve(to: CGPoint(x: 297.99, y: 140.31), controlPoint1: CGPoint(x: 240.96, y: 354.34), controlPoint2: CGPoint(x: 39.28, y: -36.41))
        bezier151Path.addCurve(to: CGPoint(x: 264.04, y: 246.69), controlPoint1: CGPoint(x: 72.38, y: 357.7), controlPoint2: CGPoint(x: 206.07, y: -61.21))
        bezier151Path.addCurve(to: CGPoint(x: 164.82, y: 297.9), controlPoint1: CGPoint(x: -49.21, y: 240.87), controlPoint2: CGPoint(x: 341.54, y: 39.19))
        bezier151Path.addCurve(to: CGPoint(x: 58.44, y: 263.95), controlPoint1: CGPoint(x: -52.57, y: 72.28), controlPoint2: CGPoint(x: 366.34, y: 205.98))
        bezier151Path.addCurve(to: CGPoint(x: 7.23, y: 164.73), controlPoint1: CGPoint(x: 64.26, y: -49.3), controlPoint2: CGPoint(x: 265.94, y: 341.45))
        bezier151Path.addCurve(to: CGPoint(x: 41.18, y: 58.35), controlPoint1: CGPoint(x: 232.84, y: -52.66), controlPoint2: CGPoint(x: 99.15, y: 366.25))
        bezier151Path.addCurve(to: CGPoint(x: 140.4, y: 7.14), controlPoint1: CGPoint(x: 354.43, y: 64.17), controlPoint2: CGPoint(x: -36.32, y: 265.85))
        bezier151Path.close()
        strokeColor.setStroke()
        bezier151Path.lineWidth = 1
        bezier151Path.stroke()

        context.restoreGState()


        //// Bezier 152 Drawing
        context.saveGState()
        context.setAlpha(0.94)

        let bezier152Path = UIBezierPath()
        bezier152Path.move(to: CGPoint(x: 141.86, y: 6.03))
        bezier152Path.addCurve(to: CGPoint(x: 248.61, y: 41.33), controlPoint1: CGPoint(x: 358.38, y: 235.49), controlPoint2: CGPoint(x: -62.02, y: 96.46))
        bezier152Path.addCurve(to: CGPoint(x: 299.14, y: 141.78), controlPoint1: CGPoint(x: 239.46, y: 356.69), controlPoint2: CGPoint(x: 40.5, y: -38.89))
        bezier152Path.addCurve(to: CGPoint(x: 263.83, y: 248.53), controlPoint1: CGPoint(x: 69.67, y: 358.29), controlPoint2: CGPoint(x: 208.7, y: -62.1))
        bezier152Path.addCurve(to: CGPoint(x: 163.38, y: 299.05), controlPoint1: CGPoint(x: -51.53, y: 239.37), controlPoint2: CGPoint(x: 344.05, y: 40.42))
        bezier152Path.addCurve(to: CGPoint(x: 56.63, y: 263.75), controlPoint1: CGPoint(x: -53.13, y: 69.59), controlPoint2: CGPoint(x: 367.26, y: 208.62))
        bezier152Path.addCurve(to: CGPoint(x: 6.11, y: 163.3), controlPoint1: CGPoint(x: 65.79, y: -51.61), controlPoint2: CGPoint(x: 264.74, y: 343.97))
        bezier152Path.addCurve(to: CGPoint(x: 41.41, y: 56.55), controlPoint1: CGPoint(x: 235.57, y: -53.21), controlPoint2: CGPoint(x: 96.54, y: 367.18))
        bezier152Path.addCurve(to: CGPoint(x: 141.86, y: 6.03), controlPoint1: CGPoint(x: 356.77, y: 65.7), controlPoint2: CGPoint(x: -38.81, y: 264.66))
        bezier152Path.close()
        strokeColor.setStroke()
        bezier152Path.lineWidth = 1
        bezier152Path.stroke()

        context.restoreGState()


        //// Bezier 153 Drawing
        context.saveGState()
        context.setAlpha(0.95)

        let bezier153Path = UIBezierPath()
        bezier153Path.move(to: CGPoint(x: 143.34, y: 4.93))
        bezier153Path.addCurve(to: CGPoint(x: 250.46, y: 41.6), controlPoint1: CGPoint(x: 358.92, y: 238.25), controlPoint2: CGPoint(x: -62.89, y: 93.83))
        bezier153Path.addCurve(to: CGPoint(x: 300.27, y: 143.27), controlPoint1: CGPoint(x: 237.91, y: 359.03), controlPoint2: CGPoint(x: 41.76, y: -41.36))
        bezier153Path.addCurve(to: CGPoint(x: 263.59, y: 250.39), controlPoint1: CGPoint(x: 66.94, y: 358.85), controlPoint2: CGPoint(x: 211.36, y: -62.96))
        bezier153Path.addCurve(to: CGPoint(x: 161.92, y: 300.2), controlPoint1: CGPoint(x: -53.83, y: 237.84), controlPoint2: CGPoint(x: 346.56, y: 41.69))
        bezier153Path.addCurve(to: CGPoint(x: 54.81, y: 263.52), controlPoint1: CGPoint(x: -53.66, y: 66.87), controlPoint2: CGPoint(x: 368.16, y: 211.29))
        bezier153Path.addCurve(to: CGPoint(x: 5, y: 161.85), controlPoint1: CGPoint(x: 67.35, y: -53.9), controlPoint2: CGPoint(x: 263.5, y: 346.49))
        bezier153Path.addCurve(to: CGPoint(x: 41.67, y: 54.74), controlPoint1: CGPoint(x: 238.32, y: -53.73), controlPoint2: CGPoint(x: 93.9, y: 368.09))
        bezier153Path.addCurve(to: CGPoint(x: 143.34, y: 4.93), controlPoint1: CGPoint(x: 359.09, y: 67.28), controlPoint2: CGPoint(x: -41.29, y: 263.43))
        bezier153Path.close()
        strokeColor.setStroke()
        bezier153Path.lineWidth = 1
        bezier153Path.stroke()

        context.restoreGState()


        //// Bezier 154 Drawing
        context.saveGState()
        context.setAlpha(0.95)

        let bezier154Path = UIBezierPath()
        bezier154Path.move(to: CGPoint(x: 144.85, y: 3.85))
        bezier154Path.addCurve(to: CGPoint(x: 252.3, y: 41.9), controlPoint1: CGPoint(x: 359.44, y: 241.03), controlPoint2: CGPoint(x: -63.73, y: 91.18))
        bezier154Path.addCurve(to: CGPoint(x: 301.38, y: 144.79), controlPoint1: CGPoint(x: 236.33, y: 361.35), controlPoint2: CGPoint(x: 43.06, y: -43.83))
        bezier154Path.addCurve(to: CGPoint(x: 263.33, y: 252.25), controlPoint1: CGPoint(x: 64.19, y: 359.38), controlPoint2: CGPoint(x: 214.04, y: -63.79))
        bezier154Path.addCurve(to: CGPoint(x: 160.44, y: 301.32), controlPoint1: CGPoint(x: -56.13, y: 236.27), controlPoint2: CGPoint(x: 349.06, y: 43))
        bezier154Path.addCurve(to: CGPoint(x: 52.98, y: 263.27), controlPoint1: CGPoint(x: -54.15, y: 64.13), controlPoint2: CGPoint(x: 369.02, y: 213.99))
        bezier154Path.addCurve(to: CGPoint(x: 3.9, y: 160.38), controlPoint1: CGPoint(x: 68.96, y: -56.19), controlPoint2: CGPoint(x: 262.22, y: 349))
        bezier154Path.addCurve(to: CGPoint(x: 41.96, y: 52.92), controlPoint1: CGPoint(x: 241.09, y: -54.21), controlPoint2: CGPoint(x: 91.24, y: 368.96))
        bezier154Path.addCurve(to: CGPoint(x: 144.85, y: 3.85), controlPoint1: CGPoint(x: 361.41, y: 68.9), controlPoint2: CGPoint(x: -43.77, y: 262.17))
        bezier154Path.close()
        strokeColor.setStroke()
        bezier154Path.lineWidth = 1
        bezier154Path.stroke()

        context.restoreGState()


        //// Bezier 155 Drawing
        context.saveGState()
        context.setAlpha(0.96)

        let bezier155Path = UIBezierPath()
        bezier155Path.move(to: CGPoint(x: 146.37, y: 2.78))
        bezier155Path.addCurve(to: CGPoint(x: 254.16, y: 42.22), controlPoint1: CGPoint(x: 359.92, y: 243.84), controlPoint2: CGPoint(x: -64.54, y: 88.51))
        bezier155Path.addCurve(to: CGPoint(x: 302.48, y: 146.33), controlPoint1: CGPoint(x: 234.7, y: 363.67), controlPoint2: CGPoint(x: 44.4, y: -46.29))
        bezier155Path.addCurve(to: CGPoint(x: 263.04, y: 254.11), controlPoint1: CGPoint(x: 61.42, y: 359.87), controlPoint2: CGPoint(x: 216.75, y: -64.58))
        bezier155Path.addCurve(to: CGPoint(x: 158.93, y: 302.44), controlPoint1: CGPoint(x: -58.41, y: 234.66), controlPoint2: CGPoint(x: 351.55, y: 44.36))
        bezier155Path.addCurve(to: CGPoint(x: 51.15, y: 262.99), controlPoint1: CGPoint(x: -54.61, y: 61.38), controlPoint2: CGPoint(x: 369.84, y: 216.71))
        bezier155Path.addCurve(to: CGPoint(x: 2.83, y: 158.89), controlPoint1: CGPoint(x: 70.6, y: -58.46), controlPoint2: CGPoint(x: 260.9, y: 351.51))
        bezier155Path.addCurve(to: CGPoint(x: 42.27, y: 51.1), controlPoint1: CGPoint(x: 243.88, y: -54.65), controlPoint2: CGPoint(x: 88.55, y: 369.8))
        bezier155Path.addCurve(to: CGPoint(x: 146.37, y: 2.78), controlPoint1: CGPoint(x: 363.72, y: 70.56), controlPoint2: CGPoint(x: -46.25, y: 260.86))
        bezier155Path.close()
        strokeColor.setStroke()
        bezier155Path.lineWidth = 1
        bezier155Path.stroke()

        context.restoreGState()


        //// Bezier 156 Drawing
        context.saveGState()
        context.setAlpha(0.97)

        let bezier156Path = UIBezierPath()
        bezier156Path.move(to: CGPoint(x: 147.92, y: 1.73))
        bezier156Path.addCurve(to: CGPoint(x: 256.01, y: 42.58), controlPoint1: CGPoint(x: 360.36, y: 246.66), controlPoint2: CGPoint(x: -65.31, y: 85.81))
        bezier156Path.addCurve(to: CGPoint(x: 303.56, y: 147.89), controlPoint1: CGPoint(x: 233.04, y: 365.98), controlPoint2: CGPoint(x: 45.78, y: -48.75))
        bezier156Path.addCurve(to: CGPoint(x: 262.72, y: 255.98), controlPoint1: CGPoint(x: 58.63, y: 360.33), controlPoint2: CGPoint(x: 219.48, y: -65.34))
        bezier156Path.addCurve(to: CGPoint(x: 157.4, y: 303.53), controlPoint1: CGPoint(x: -60.69, y: 233.01), controlPoint2: CGPoint(x: 354.04, y: 45.75))
        bezier156Path.addCurve(to: CGPoint(x: 49.31, y: 262.69), controlPoint1: CGPoint(x: -55.03, y: 58.6), controlPoint2: CGPoint(x: 370.64, y: 219.45))
        bezier156Path.addCurve(to: CGPoint(x: 1.76, y: 157.37), controlPoint1: CGPoint(x: 72.29, y: -60.72), controlPoint2: CGPoint(x: 259.55, y: 354.01))
        bezier156Path.addCurve(to: CGPoint(x: 42.61, y: 49.28), controlPoint1: CGPoint(x: 246.69, y: -55.06), controlPoint2: CGPoint(x: 85.84, y: 370.61))
        bezier156Path.addCurve(to: CGPoint(x: 147.92, y: 1.73), controlPoint1: CGPoint(x: 366.01, y: 72.26), controlPoint2: CGPoint(x: -48.72, y: 259.52))
        bezier156Path.close()
        strokeColor.setStroke()
        bezier156Path.lineWidth = 1
        bezier156Path.stroke()

        context.restoreGState()


        //// Bezier 157 Drawing
        context.saveGState()
        context.setAlpha(0.97)

        let bezier157Path = UIBezierPath()
        bezier157Path.move(to: CGPoint(x: 149.49, y: 0.7))
        bezier157Path.addCurve(to: CGPoint(x: 257.87, y: 42.95), controlPoint1: CGPoint(x: 360.76, y: 249.5), controlPoint2: CGPoint(x: -66.05, y: 83.09))
        bezier157Path.addCurve(to: CGPoint(x: 304.63, y: 149.47), controlPoint1: CGPoint(x: 231.33, y: 368.28), controlPoint2: CGPoint(x: 47.2, y: -51.2))
        bezier157Path.addCurve(to: CGPoint(x: 262.37, y: 257.86), controlPoint1: CGPoint(x: 55.83, y: 360.75), controlPoint2: CGPoint(x: 222.24, y: -66.07))
        bezier157Path.addCurve(to: CGPoint(x: 155.85, y: 304.61), controlPoint1: CGPoint(x: -62.95, y: 231.32), controlPoint2: CGPoint(x: 356.52, y: 47.18))
        bezier157Path.addCurve(to: CGPoint(x: 47.47, y: 262.36), controlPoint1: CGPoint(x: -55.42, y: 55.81), controlPoint2: CGPoint(x: 371.4, y: 222.22))
        bezier157Path.addCurve(to: CGPoint(x: 0.71, y: 155.84), controlPoint1: CGPoint(x: 74.01, y: -62.97), controlPoint2: CGPoint(x: 258.15, y: 356.51))
        bezier157Path.addCurve(to: CGPoint(x: 42.97, y: 47.46), controlPoint1: CGPoint(x: 249.52, y: -55.43), controlPoint2: CGPoint(x: 83.11, y: 371.38))
        bezier157Path.addCurve(to: CGPoint(x: 149.49, y: 0.7), controlPoint1: CGPoint(x: 368.29, y: 73.99), controlPoint2: CGPoint(x: -51.18, y: 258.13))
        bezier157Path.close()
        strokeColor.setStroke()
        bezier157Path.lineWidth = 1
        bezier157Path.stroke()

        context.restoreGState()


        //// Bezier 158 Drawing
        context.saveGState()
        context.setAlpha(0.98)

        let bezier158Path = UIBezierPath()
        bezier158Path.move(to: CGPoint(x: 151.08, y: -0.32))
        bezier158Path.addCurve(to: CGPoint(x: 259.74, y: 43.36), controlPoint1: CGPoint(x: 361.13, y: 252.36), controlPoint2: CGPoint(x: -66.76, y: 80.35))
        bezier158Path.addCurve(to: CGPoint(x: 305.68, y: 151.08), controlPoint1: CGPoint(x: 229.59, y: 370.56), controlPoint2: CGPoint(x: 48.66, y: -53.64))
        bezier158Path.addCurve(to: CGPoint(x: 262, y: 259.74), controlPoint1: CGPoint(x: 53, y: 361.13), controlPoint2: CGPoint(x: 225.01, y: -66.76))
        bezier158Path.addCurve(to: CGPoint(x: 154.28, y: 305.68), controlPoint1: CGPoint(x: -65.2, y: 229.59), controlPoint2: CGPoint(x: 359, y: 48.66))
        bezier158Path.addCurve(to: CGPoint(x: 45.63, y: 262), controlPoint1: CGPoint(x: -55.77, y: 53), controlPoint2: CGPoint(x: 372.13, y: 225.01))
        bezier158Path.addCurve(to: CGPoint(x: -0.32, y: 154.28), controlPoint1: CGPoint(x: 75.77, y: -65.2), controlPoint2: CGPoint(x: 256.71, y: 359))
        bezier158Path.addCurve(to: CGPoint(x: 43.36, y: 45.63), controlPoint1: CGPoint(x: 252.36, y: -55.77), controlPoint2: CGPoint(x: 80.35, y: 372.13))
        bezier158Path.addCurve(to: CGPoint(x: 151.08, y: -0.32), controlPoint1: CGPoint(x: 370.56, y: 75.77), controlPoint2: CGPoint(x: -53.64, y: 256.71))
        bezier158Path.close()
        strokeColor.setStroke()
        bezier158Path.lineWidth = 1
        bezier158Path.stroke()

        context.restoreGState()

    }
}
