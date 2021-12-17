//
//  ViewController.swift
//  NavigationAnimation
//
//  Created by Дарья Воробей on 12/15/21.
//

import UIKit

class ViewController: UIViewController {
    
    var secondWindowController: SecondViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PhotoDetail" {
            _ = segue.destination as! SecondViewController
        }
    }
}

