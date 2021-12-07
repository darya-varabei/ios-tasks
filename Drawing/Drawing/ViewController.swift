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
    
    let canvasView = CanvasView()
    let eraseSwitch = UISwitch()
    var paletteVC = PaletteView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewScroll.addSubview(canvasView)
        canvasView.pinToSuperViewEdges()
        scrollView.panGestureRecognizer.minimumNumberOfTouches = 2;
        setupChoosecolorButton()
        paletteVC = PaletteView(frame: CGRect(x: 0, y: UIScreen.main.bounds.height - 250, width: UIScreen.main.bounds.width, height: 250))
        view.addSubview(paletteVC)
    }
    
    private func setupChoosecolorButton() {
        buttonChangeColor.layer.cornerRadius = 25
        buttonChangeColor.backgroundColor = UIColor.white
        buttonChangeColor.layer.shadowColor = UIColor.black.cgColor
        buttonChangeColor.setImage(UIImage(systemName: "scribble.variable"), for: .normal)
        buttonChangeColor.tintColor = UIColor.red
        buttonChangeColor.layer.shadowOffset = CGSize(width: 3, height: 3)
        buttonChangeColor.layer.shadowRadius = 2
        buttonChangeColor.layer.shadowOpacity = 0.3
    }
    
    @IBAction func presentPaletteView(_ sender: Any) {
        
    }
    
}

