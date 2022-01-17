//
//  DetailViewController.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/15/22.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet private var bookImage: UIImageView!
    @IBOutlet private var addToBookmarkButton: UIButton!
    @IBOutlet private var numOfPagesLabel: UILabel!
    @IBOutlet private var dateReleasedLabel: UILabel!
    @IBOutlet private var overviewTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "darkGradientTop")
    }
}
