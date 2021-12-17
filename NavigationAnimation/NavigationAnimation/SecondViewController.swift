//
//  SecondViewController.swift
//  NavigationAnimation
//
//  Created by Дарья Воробей on 12/16/21.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "screen" {
            _ = segue.destination as! ViewController
        }
    }
}
