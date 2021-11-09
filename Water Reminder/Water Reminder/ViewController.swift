//
//  ViewController.swift
//  Water Reminder
//
//  Created by Darya on 11/9/21.
//

import UIKit

class ViewController: UIViewController {
    var wave: WaveAnimationView?

    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.wave = WaveAnimationView(frame: CGRect(x: UIScreen.main.bounds.width / 2 - 100, y: UIScreen.main.bounds.height / 3 - 100, width: 200, height: 200))
        view.addSubview(self.wave ?? self.view)
        wave?.startAnimation()
    }

    override func viewDidDisappear(_ animated: Bool) {
        wave?.stopAnimation()
    }
}

