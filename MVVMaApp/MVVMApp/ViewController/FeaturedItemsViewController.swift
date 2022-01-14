//
//  FeaturedItemsViewController.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/15/22.
//

import Foundation
import UIKit

class FeaturedItemsViewController: UIViewController {
    
    @IBOutlet weak var featuredTitleLabel: UILabel!
    @IBOutlet weak var featuredCollectionView: UICollectionView!
    
    override func viewDidLoad() {

    }
    
    override func viewDidLayoutSubviews() {
        setupBackgroundColor()
    }
    
    private func setupBackgroundColor() {
        let gradient = CAGradientLayer()
        
        guard let pink = UIColor(named: "darkGradientTop")?.cgColor else { return }
        guard let purple = UIColor(named: "darkGradientBottom")?.cgColor else { return }
        gradient.frame = view.bounds
        gradient.colors = [pink, purple]
       
        view.layer.addSublayer(gradient)
    }
}
