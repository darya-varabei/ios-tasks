//
//  ViewController.swift
//  Drawing
//
//  Created by Дарья Воробей on 12/6/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var viewScroll: CanvasView!
    @IBOutlet weak var buttonChangeColor: UIButton!
    @IBOutlet weak var buttonEraseAll: UIButton!
    private var isPalettePresented = false
    let canvasView = CanvasView()
    var paletteVC = PaletteView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewScroll.addSubview(canvasView)
        canvasView.pinToSuperViewEdges()
        scrollView.panGestureRecognizer.minimumNumberOfTouches = 2;
        setupChooseColorButton(button: buttonChangeColor, image: "scribble.variable", color: Brush.brush.getColor())
        setupChooseColorButton(button: buttonEraseAll, image: "arrowshape.turn.up.backward", color: "blood")
        paletteVC = PaletteView(frame: CGRect(x: 0, y: UIScreen.main.bounds.height - 250, width: UIScreen.main.bounds.width, height: 250))
    }
    
    private func setupChooseColorButton(button: UIButton, image: String, color: String) {
        button.layer.cornerRadius = 25
        button.backgroundColor = UIColor.white
        button.layer.shadowColor = UIColor.black.cgColor
        button.setImage(UIImage(systemName: image), for: .normal)
        button.tintColor = UIColor(named: color)
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.shadowRadius = 2
        button.layer.shadowOpacity = 0.2
    }
    
    @IBAction func eraseAll(_ sender: Any) {
        canvasView.removeFromSuperLayer()
    }
    
    @IBAction func presentPaletteView(_ sender: Any) {
        
        if !isPalettePresented {
            
            UIView.transition(with: self.view, duration: 0.25, options: [.transitionCrossDissolve], animations: {
                self.view.addSubview(self.paletteVC)
            }, completion: nil)
            
            isPalettePresented = true
        }
        else {
            UIView.transition(with: self.view, duration: 0.25, options: [.transitionCrossDissolve], animations: {
                self.paletteVC.removeFromSuperview()
            }, completion: nil)
            
            isPalettePresented = false
        }
    }
}

