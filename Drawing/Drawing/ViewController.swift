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
    
    let canvasView = CanvasView()
    let eraseSwitch = UISwitch()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewScroll.addSubview(canvasView)
        canvasView.pinToSuperViewEdges()
        self.scrollView.panGestureRecognizer.minimumNumberOfTouches = 2;
    }
}

