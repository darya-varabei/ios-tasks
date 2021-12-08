//
//  PaletteView.swift
//  Drawing
//
//  Created by Дарья Воробей on 12/6/21.
//

import Foundation
import UIKit

class PaletteView: UIView {
    
    private var brush = Brush.brush
    private var colors: [String] = []
    
    private let palette: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(UINib(nibName: "ColorCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "color")
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(palette)
        colors = setColors()
        collectionConstraints()
        palette.delegate = self
        palette.dataSource = self
        palette.backgroundColor = UIColor.white
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    private func collectionConstraints() {
        palette.widthAnchor.constraint(equalToConstant: 300).isActive = true
        palette.heightAnchor.constraint(equalToConstant: 180).isActive = true
        palette.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        palette.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        palette.isScrollEnabled = false
    }
}

extension PaletteView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : ColorCollectionViewCell = (collectionView.dequeueReusableCell(withReuseIdentifier: "color", for: indexPath) as? ColorCollectionViewCell)!
        let cellData = colors[indexPath.item]
        cellData == Brush.brush.getColor() ? cell.getSelected() : cell.getDeselected()
        cell.cellColor = cellData
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {

        let cellWidthPadding = collectionView.frame.size.width / 30
        let cellHeightPadding = collectionView.frame.size.height / 4
        return UIEdgeInsets(top: cellHeightPadding,left: cellWidthPadding, bottom: cellHeightPadding,right: cellWidthPadding)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        brush.setColor(newColor: colors[indexPath.item])
        collectionView.reloadData()
    }
}
