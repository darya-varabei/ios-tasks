//
//  ViewController.swift
//  Drawing
//
//  Created by Дарья Воробей on 12/6/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private var scrollView: UIScrollView!
    @IBOutlet private var viewScroll: CanvasView!
    @IBOutlet private var buttonChangeColor: UIButton!
    @IBOutlet private var buttonEraseAll: UIButton!
    
    private let paletteOffset: CGFloat = 250
    private let canvasView = CanvasView()
    private let brush = Brush()
    private var isPalettePresented = false
    private var paletteVC = PaletteView()
    
    private enum LocalParameters {
        static let cornerRadius: CGFloat = 25
        static let shadowOffset: CGFloat = 2
        static let shadowOpacity: Float = 0.2
        static let animationDuration = 0.25
        static let minNumOfTouches = 2
    }
    
    private enum ButtonImages {
        static let scribble = "scribble.variable"
        static let arrowShape = "arrowshape.turn.up.backward"
        static let defaultColor = "blood"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewScroll.addSubview(canvasView)
        canvasView.stretchToSuperviewFrame()
        scrollView.panGestureRecognizer.minimumNumberOfTouches = LocalParameters.minNumOfTouches;
        setupCustomButtons(button: buttonChangeColor, image: ButtonImages.scribble, color: brush.getColor())
        setupCustomButtons(button: buttonEraseAll, image: ButtonImages.arrowShape, color: ButtonImages.defaultColor)
        paletteVC = PaletteView(frame: CGRect(x: 0, y: UIScreen.main.bounds.height - paletteOffset, width: UIScreen.main.bounds.width, height: paletteOffset))
    }
    
    private func setupCustomButtons(button: UIButton, image: String, color: String) {
        button.layer.cornerRadius = LocalParameters.cornerRadius
        button.backgroundColor = UIColor.white
        button.layer.shadowColor = UIColor.black.cgColor
        button.setImage(UIImage(systemName: image), for: .normal)
        button.tintColor = UIColor(named: color)
        button.layer.shadowOffset = CGSize(width: LocalParameters.shadowOffset, height: LocalParameters.shadowOffset)
        button.layer.shadowRadius = LocalParameters.shadowOffset
        button.layer.shadowOpacity = LocalParameters.shadowOpacity
    }
    
    @IBAction private func eraseLast(_ sender: Any) {
        canvasView.removeFromCanvas()
    }
    
    func changeColor(newColor: String) {
        canvasView.brush.setColor(newColor: newColor)
    }
    
    @IBAction private func presentPaletteView(_ sender: Any) {
        
        if !isPalettePresented {
            UIView.transition(with: self.view, duration: TimeInterval(LocalParameters.animationDuration), options: [.transitionCrossDissolve], animations: {
                self.view.addSubview(self.paletteVC)
                self.view.bringSubviewToFront(self.buttonChangeColor)
                self.view.bringSubviewToFront(self.buttonEraseAll)
            }, completion: nil)
            
            isPalettePresented = true
        }
        else {
            UIView.transition(with: self.view, duration: TimeInterval(LocalParameters.animationDuration), options: [.transitionCrossDissolve], animations: {
                self.paletteVC.removeFromSuperview()
            }, completion: nil)
            
            isPalettePresented = false
        }
    }
}

