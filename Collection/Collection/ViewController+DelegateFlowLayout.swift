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
        return colors.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RectangleCollectionViewCell", for: indexPath as IndexPath) as? RectangleCollectionViewCell else { return RectangleCollectionViewCell() }
        
        if colors[indexPath.item] == UIColor.white {
            cell.changeCellColor()
            colors[indexPath.item] = cell.getColor()
        }
        else {
            cell.setFirstColor(initialColor: colors[indexPath.item])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 3 - 30, height: CGFloat.random(in: 30...200))
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? RectangleCollectionViewCell
        cell?.animateCellTap(sender: cell)
        cell?.changeCellColor()
        colors[indexPath.item] = cell?.getColor() ?? UIColor.white
    }
}
