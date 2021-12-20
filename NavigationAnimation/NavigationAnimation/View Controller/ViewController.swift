//
//  ViewController.swift
//  NavigationAnimation
//
//  Created by Дарья Воробей on 12/15/21.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "swipeToBottom",
           let _ = segue.destination as? ThirdViewController {
            self.performSegue(withIdentifier: "swipeToBottom", sender: ViewController())
        }
    }
}

