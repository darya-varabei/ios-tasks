//
//  Story.swift
//  Drawings
//
//  Created by Darya on 11/30/21.
//

import Foundation
import UIKit

class Story: Drawing {
    
    convenience init() {
        self.init(title: "Face", image: "face")
    }
    
    override func draw() -> UIBezierPath {
        let path = UIBezierPath()
        path.lineWidth = 0.5
               path.move(to: CGPoint(x: 68.5, y: 16.4))
               path.addCurve(to: CGPoint(x: 55.1, y: 7), controlPoint1: CGPoint(x: 65.1, y: 12.1), controlPoint2: CGPoint(x: 60, y: 7))
               path.addCurve(to: CGPoint(x: 50, y: 10), controlPoint1: CGPoint(x: 53.6, y: 7), controlPoint2: CGPoint(x: 52.1, y: 8.1))
               path.addCurve(to: CGPoint(x: 37.5, y: 7), controlPoint1: CGPoint(x: 47.1, y: 8.7), controlPoint2: CGPoint(x: 40.7, y: 7))
               path.addCurve(to: CGPoint(x: 25, y: 10), controlPoint1: CGPoint(x: 34.3, y: 7), controlPoint2: CGPoint(x: 27.9, y: 8.7))
               path.addCurve(to: CGPoint(x: 19.9, y: 7), controlPoint1: CGPoint(x: 22.9, y: 8.1), controlPoint2: CGPoint(x: 21.4, y: 7))
               path.addCurve(to: CGPoint(x: 6.5, y: 16.4), controlPoint1: CGPoint(x: 15, y: 7), controlPoint2: CGPoint(x: 9.9, y: 12.1))
               path.addCurve(to: CGPoint(x: 0, y: 28.1), controlPoint1: CGPoint(x: 4, y: 19.6), controlPoint2: CGPoint(x: 0, y: 25.6))
               path.addCurve(to: CGPoint(x: 4, y: 40.1), controlPoint1: CGPoint(x: 0, y: 32.8), controlPoint2: CGPoint(x: 0.2, y: 35))
               path.addCurve(to: CGPoint(x: 9.2, y: 52.7), controlPoint1: CGPoint(x: 6.9, y: 44), controlPoint2: CGPoint(x: 7.2, y: 49.7))
               path.addCurve(to: CGPoint(x: 14.6, y: 55), controlPoint1: CGPoint(x: 10.5, y: 54.8), controlPoint2: CGPoint(x: 12.4, y: 55.6))
               path.addCurve(to: CGPoint(x: 18.9, y: 49.4), controlPoint1: CGPoint(x: 16.9, y: 54.5), controlPoint2: CGPoint(x: 18.3, y: 52.6))
               path.addCurve(to: CGPoint(x: 21.2, y: 56), controlPoint1: CGPoint(x: 21.4, y: 52.8), controlPoint2: CGPoint(x: 21, y: 54.8))
               path.addCurve(to: CGPoint(x: 37.5, y: 68), controlPoint1: CGPoint(x: 21.3, y: 60.4), controlPoint2: CGPoint(x: 28.9, y: 68))
               path.addCurve(to: CGPoint(x: 53.8, y: 56), controlPoint1: CGPoint(x: 46.1, y: 68), controlPoint2: CGPoint(x: 53.7, y: 60.4))
               path.addCurve(to: CGPoint(x: 56.1, y: 49.4), controlPoint1: CGPoint(x: 54, y: 54.8), controlPoint2: CGPoint(x: 53.6, y: 52.8))
               path.addCurve(to: CGPoint(x: 61.7, y: 55.2), controlPoint1: CGPoint(x: 56.7, y: 52.6), controlPoint2: CGPoint(x: 58.4, y: 55.2))
               path.addCurve(to: CGPoint(x: 71, y: 40.1), controlPoint1: CGPoint(x: 67.9, y: 55.2), controlPoint2: CGPoint(x: 66.9, y: 45.6))
               path.addCurve(to: CGPoint(x: 75, y: 28.1), controlPoint1: CGPoint(x: 74.8, y: 35), controlPoint2: CGPoint(x: 75, y: 32.8))
               path.addCurve(to: CGPoint(x: 68.5, y: 16.4), controlPoint1: CGPoint(x: 75, y: 25.6), controlPoint2: CGPoint(x: 71, y: 19.6))
               path.addLine(to: CGPoint(x: 68.5, y: 16.4))
               path.close()
               path.move(to: CGPoint(x: 37.5, y: 50.4))
               path.addCurve(to: CGPoint(x: 34.2, y: 47.4), controlPoint1: CGPoint(x: 36.3, y: 50.4), controlPoint2: CGPoint(x: 34.8, y: 48.5))
               path.addCurve(to: CGPoint(x: 40.8, y: 47.4), controlPoint1: CGPoint(x: 36, y: 46.7), controlPoint2: CGPoint(x: 39, y: 46.7))
               path.addCurve(to: CGPoint(x: 37.5, y: 50.4), controlPoint1: CGPoint(x: 40.2, y: 48.5), controlPoint2: CGPoint(x: 38.7, y: 50.4))
               path.close()
               path.move(to: CGPoint(x: 37.5, y: 59.8))
               path.addCurve(to: CGPoint(x: 43.1, y: 61.9), controlPoint1: CGPoint(x: 39, y: 60.9), controlPoint2: CGPoint(x: 41, y: 61.6))
               path.addCurve(to: CGPoint(x: 31.9, y: 61.9), controlPoint1: CGPoint(x: 39.4, y: 63.8), controlPoint2: CGPoint(x: 35.6, y: 63.8))
               path.addCurve(to: CGPoint(x: 37.5, y: 59.8), controlPoint1: CGPoint(x: 34, y: 61.6), controlPoint2: CGPoint(x: 36, y: 60.9))
               path.addLine(to: CGPoint(x: 37.5, y: 59.8))
               path.close()
               path.move(to: CGPoint(x: 67.3, y: 37.3))
               path.addCurve(to: CGPoint(x: 61.7, y: 50.5), controlPoint1: CGPoint(x: 63.6, y: 42.2), controlPoint2: CGPoint(x: 63, y: 49.3))
               path.addCurve(to: CGPoint(x: 60.4, y: 47), controlPoint1: CGPoint(x: 60.8, y: 50.4), controlPoint2: CGPoint(x: 60.5, y: 47.9))
               path.addCurve(to: CGPoint(x: 60.9, y: 32.8), controlPoint1: CGPoint(x: 60.1, y: 42.7), controlPoint2: CGPoint(x: 60.9, y: 36.5))
               path.addCurve(to: CGPoint(x: 56, y: 16.5), controlPoint1: CGPoint(x: 60.9, y: 26.5), controlPoint2: CGPoint(x: 56.2, y: 16.9))
               path.addCurve(to: CGPoint(x: 52.9, y: 15.5), controlPoint1: CGPoint(x: 55.4, y: 15.4), controlPoint2: CGPoint(x: 54, y: 14.9))
               path.addCurve(to: CGPoint(x: 51.8, y: 18.6), controlPoint1: CGPoint(x: 51.7, y: 16.1), controlPoint2: CGPoint(x: 51.2, y: 17.5))
               path.addCurve(to: CGPoint(x: 56.3, y: 32.8), controlPoint1: CGPoint(x: 53, y: 21.1), controlPoint2: CGPoint(x: 56.3, y: 28.5))
               path.addCurve(to: CGPoint(x: 55.7, y: 42.9), controlPoint1: CGPoint(x: 56.3, y: 35.3), controlPoint2: CGPoint(x: 55.8, y: 39.2))
               path.addCurve(to: CGPoint(x: 49.2, y: 55.1), controlPoint1: CGPoint(x: 54.4, y: 44), controlPoint2: CGPoint(x: 49.2, y: 48.9))
               path.addCurve(to: CGPoint(x: 39.6, y: 55.2), controlPoint1: CGPoint(x: 49.2, y: 58), controlPoint2: CGPoint(x: 41.1, y: 58))
               path.addCurve(to: CGPoint(x: 39.3, y: 54.8), controlPoint1: CGPoint(x: 39.5, y: 55), controlPoint2: CGPoint(x: 39.4, y: 54.9))
               path.addCurve(to: CGPoint(x: 45.7, y: 46.9), controlPoint1: CGPoint(x: 42.8, y: 53.7), controlPoint2: CGPoint(x: 45.7, y: 49.2))
               path.addCurve(to: CGPoint(x: 29.3, y: 46.9), controlPoint1: CGPoint(x: 45.7, y: 40.6), controlPoint2: CGPoint(x: 29.3, y: 40.6))
               path.addCurve(to: CGPoint(x: 35.7, y: 54.8), controlPoint1: CGPoint(x: 29.3, y: 49.2), controlPoint2: CGPoint(x: 32.1, y: 53.7))
               path.addCurve(to: CGPoint(x: 35.4, y: 55.2), controlPoint1: CGPoint(x: 35.6, y: 54.9), controlPoint2: CGPoint(x: 35.5, y: 55))
               path.addCurve(to: CGPoint(x: 25.8, y: 55.1), controlPoint1: CGPoint(x: 33.9, y: 58), controlPoint2: CGPoint(x: 25.8, y: 58))
               path.addCurve(to: CGPoint(x: 19.3, y: 42.9), controlPoint1: CGPoint(x: 25.8, y: 48.9), controlPoint2: CGPoint(x: 20.6, y: 44))
               path.addCurve(to: CGPoint(x: 18.8, y: 32.8), controlPoint1: CGPoint(x: 19.2, y: 39.3), controlPoint2: CGPoint(x: 18.8, y: 35.2))
               path.addCurve(to: CGPoint(x: 23.2, y: 18.6), controlPoint1: CGPoint(x: 18.8, y: 28.5), controlPoint2: CGPoint(x: 22, y: 21.1))
               path.addCurve(to: CGPoint(x: 22.1, y: 15.5), controlPoint1: CGPoint(x: 23.8, y: 17.5), controlPoint2: CGPoint(x: 23.3, y: 16.1))
               path.addCurve(to: CGPoint(x: 19, y: 16.5), controlPoint1: CGPoint(x: 21, y: 14.9), controlPoint2: CGPoint(x: 19.6, y: 15.4))
               path.addCurve(to: CGPoint(x: 14.1, y: 32.8), controlPoint1: CGPoint(x: 18.8, y: 16.9), controlPoint2: CGPoint(x: 14.1, y: 26.5))
               path.addCurve(to: CGPoint(x: 14.6, y: 47), controlPoint1: CGPoint(x: 14.1, y: 36.5), controlPoint2: CGPoint(x: 14.9, y: 42.7))
               path.addCurve(to: CGPoint(x: 13.3, y: 50.5), controlPoint1: CGPoint(x: 14.5, y: 47.9), controlPoint2: CGPoint(x: 14.2, y: 50.4))
               path.addCurve(to: CGPoint(x: 7.7, y: 37.3), controlPoint1: CGPoint(x: 12, y: 49.3), controlPoint2: CGPoint(x: 11.4, y: 42.2))
               path.addCurve(to: CGPoint(x: 4.7, y: 28.3), controlPoint1: CGPoint(x: 4.7, y: 33.2), controlPoint2: CGPoint(x: 4.7, y: 32.2))
               path.addCurve(to: CGPoint(x: 10.5, y: 18.9), controlPoint1: CGPoint(x: 5, y: 27.2), controlPoint2: CGPoint(x: 7.2, y: 23.1))
               path.addCurve(to: CGPoint(x: 19.7, y: 11.7), controlPoint1: CGPoint(x: 14, y: 14.5), controlPoint2: CGPoint(x: 17.5, y: 11.9))
               path.addCurve(to: CGPoint(x: 23, y: 14.5), controlPoint1: CGPoint(x: 20.4, y: 12.1), controlPoint2: CGPoint(x: 21.8, y: 13.4))
               path.addCurve(to: CGPoint(x: 26.2, y: 14.6), controlPoint1: CGPoint(x: 23.8, y: 15.4), controlPoint2: CGPoint(x: 25.3, y: 15.5))
               path.addCurve(to: CGPoint(x: 37.5, y: 11.7), controlPoint1: CGPoint(x: 27.4, y: 13.8), controlPoint2: CGPoint(x: 34.4, y: 11.7))
               path.addCurve(to: CGPoint(x: 48.8, y: 14.6), controlPoint1: CGPoint(x: 40.6, y: 11.7), controlPoint2: CGPoint(x: 47.6, y: 13.8))
               path.addCurve(to: CGPoint(x: 52, y: 14.5), controlPoint1: CGPoint(x: 49.7, y: 15.5), controlPoint2: CGPoint(x: 51.2, y: 15.4))
               path.addCurve(to: CGPoint(x: 55.3, y: 11.7), controlPoint1: CGPoint(x: 54, y: 12.6), controlPoint2: CGPoint(x: 54.9, y: 11.9))
               path.addCurve(to: CGPoint(x: 64.5, y: 18.9), controlPoint1: CGPoint(x: 57.5, y: 11.9), controlPoint2: CGPoint(x: 61, y: 14.5))
               path.addCurve(to: CGPoint(x: 70.3, y: 28.3), controlPoint1: CGPoint(x: 67.8, y: 23.1), controlPoint2: CGPoint(x: 70, y: 27.2))
               path.addCurve(to: CGPoint(x: 67.3, y: 37.3), controlPoint1: CGPoint(x: 70.3, y: 32.2), controlPoint2: CGPoint(x: 70.3, y: 33.2))
               path.addLine(to: CGPoint(x: 67.3, y: 37.3))
               path.close()
               
               path.append({
                   let path = UIBezierPath()
                path.lineWidth = 0.5
                   path.move(to: CGPoint(x: 26.4, y: 34))
                   path.addCurve(to: CGPoint(x: 29.3, y: 31.1), controlPoint1: CGPoint(x: 28, y: 34), controlPoint2: CGPoint(x: 29.3, y: 32.7))
                   path.addCurve(to: CGPoint(x: 26.4, y: 28.1), controlPoint1: CGPoint(x: 29.3, y: 29.4), controlPoint2: CGPoint(x: 28, y: 28.1))
                   path.addCurve(to: CGPoint(x: 23.4, y: 31.1), controlPoint1: CGPoint(x: 24.7, y: 28.1), controlPoint2: CGPoint(x: 23.4, y: 29.4))
                   path.addCurve(to: CGPoint(x: 26.4, y: 34), controlPoint1: CGPoint(x: 23.4, y: 32.7), controlPoint2: CGPoint(x: 24.7, y: 34))
                   path.close()
                   return path
               }())
               
               path.append({
                path.lineWidth = 0.5
                   let path = UIBezierPath()
                   path.move(to: CGPoint(x: 48.6, y: 34))
                   path.addCurve(to: CGPoint(x: 51.6, y: 31.1), controlPoint1: CGPoint(x: 50.3, y: 34), controlPoint2: CGPoint(x: 51.6, y: 32.7))
                   path.addCurve(to: CGPoint(x: 48.6, y: 28.1), controlPoint1: CGPoint(x: 51.6, y: 29.4), controlPoint2: CGPoint(x: 50.3, y: 28.1))
                   path.addCurve(to: CGPoint(x: 45.7, y: 31.1), controlPoint1: CGPoint(x: 47, y: 28.1), controlPoint2: CGPoint(x: 45.7, y: 29.4))
                   path.addCurve(to: CGPoint(x: 48.6, y: 34), controlPoint1: CGPoint(x: 45.7, y: 32.7), controlPoint2: CGPoint(x: 47, y: 34))
                   path.close()
                   return path
               }())

               return path
    }
}
