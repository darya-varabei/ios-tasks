//
//  DetailViewController.swift
//  macos-versions
//
//  Created by Дарья Воробей on 1/4/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    private var data: Version? {
        didSet {
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func getData(version: Version) {
        data = version
    }
}
