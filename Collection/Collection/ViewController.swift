//
//  ViewController.swift
//  Collection
//
//  Created by Дарья Воробей on 12/24/21.
//

import UIKit

class ViewController: UICollectionViewController {
    
    fileprivate var rectangles: [Rectangle] = .init(repeatElement(Rectangle(height: 0, color: UIColor.white), count: CellsParameters.cellsEnd))
    
    fileprivate enum CollectionParameters {
        static let cellIdentifier = "RectangleCollectionViewCell"
        static let minCellHeight: CGFloat = 30
        static let maxCellHeight: CGFloat = 200
        static let insets: CGFloat = 70
        static let numOfColumns: CGFloat = 3
    }
    
    private enum CellsParameters {
        static let cellsEnd = 100
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddButton()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
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
        rectangles.insert(Rectangle(height: 0, color: UIColor.white), at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        collectionView?.performBatchUpdates( { [weak self] in
           self?.collectionView?.insertItems(at: [indexPath]) },
           completion: nil)
        collectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: UICollectionView.ScrollPosition(rawValue: 0), animated: true)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rectangles.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionParameters.cellIdentifier, for: indexPath as IndexPath) as? RectangleCollectionViewCell else { return RectangleCollectionViewCell() }

        if rectangles[indexPath.item].getColor() == UIColor.white {
            cell.changeCellColor()
            rectangles[indexPath.item].setColor(newColor: cell.getColor())
        }
        else {
            cell.setFirstColor(initialColor: rectangles[indexPath.item].getColor())
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? RectangleCollectionViewCell
        cell?.animateCellTap(sender: cell)
        cell?.changeCellColor()
        rectangles[indexPath.item].setColor(newColor: cell?.getColor() ?? UIColor.white)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if rectangles[indexPath.item].getHeight() == 0 {
            rectangles[indexPath.item].setHeight(newHeight: CGFloat.random(in: CollectionParameters.minCellHeight...CollectionParameters.maxCellHeight))
        }
        return CGSize(width: (UIScreen.main.bounds.width - CollectionParameters.insets) / CollectionParameters.numOfColumns, height: rectangles[indexPath.item].getHeight())
    }
}
