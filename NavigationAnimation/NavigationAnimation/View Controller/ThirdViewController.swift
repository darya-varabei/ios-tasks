//
//  ThirdViewController.swift
//  NavigationAnimation
//
//  Created by Дарья Воробей on 12/18/21.
//

import Foundation
import UIKit

class ThirdViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "swipeToTop",
           let _ = segue.destination as? ViewController{
            performSegue(withIdentifier: "swipeToTop", sender: ThirdViewController())
            //controller.someValue = 12345
        }
    }
}
