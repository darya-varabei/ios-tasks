//
//  FeaturedItemsViewController.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/15/22.
//

import Foundation
import UIKit

class FeaturedItemsViewController: UIViewController {
    
    @IBOutlet private var featuredTitleLabel: UILabel!
    @IBOutlet private var featuredCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
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
    
    private func setDelegates() {
        featuredCollectionView.delegate = self
        featuredCollectionView.dataSource = self
    }
}

extension FeaturedItemsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return BookCollectionViewCell()
    }
}
