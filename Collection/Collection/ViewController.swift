//
//  ViewController.swift
//  Collection
//
//  Created by Дарья Воробей on 12/24/21.
//

import UIKit

class ViewController: UICollectionViewController {
    
    enum CollectionParameters {
        static let cellIdentifier = "RectangleCollectionViewCell"
        static let minCellHeight: CGFloat = 30
        static let maxCellHeight: CGFloat = 200
        static let insets: CGFloat = 70
        static let numOfColumns: CGFloat = 3
    }
    
    var rectangles: [Rectangle] = .init(repeatElement(Rectangle(height: 0, color: UIColor.white), count: CellsParameters.cellsEnd))
    
    private enum CellsParameters {
        static let cellsEnd = 100
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddButton()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView?.collectionViewLayout.invalidateLayout()
        super.viewWillTransition(to: size, with: coordinator)
    }
    
    private func setupAddButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addRectangle)
        )
    }
    
    @objc private func addRectangle() {
        rectangles.append(Rectangle(height: 0, color: UIColor.white))
        let indexPath = IndexPath(row: rectangles.count - 1, section: 0)
        collectionView?.performBatchUpdates( { self.collectionView?.insertItems(at: [indexPath]) }, completion: nil)
    }
}
