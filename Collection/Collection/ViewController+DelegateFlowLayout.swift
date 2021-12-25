//
//  ViewController+DelegateFlowLayout.swift
//  Collection
//
//  Created by Дарья Воробей on 12/24/21.
//

import Foundation
import UIKit

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
