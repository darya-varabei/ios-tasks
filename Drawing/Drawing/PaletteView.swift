//
//  PaletteView.swift
//  Drawing
//
//  Created by Дарья Воробей on 12/6/21.
//

import Foundation
import UIKit

class PaletteView: UIView {
    
    private let palette: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(UINib(nibName: "ColorCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "color")
        return collectionView
    }()
    
    private var brush = Brush.brush
    private var colors: [String] = []
    
    private enum CollectionLiterals {
        static let width: CGFloat = 300
        static let height: CGFloat = 180
    }
    
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
        palette.widthAnchor.constraint(equalToConstant: CollectionLiterals.width).isActive = true
        palette.heightAnchor.constraint(equalToConstant: CollectionLiterals.height).isActive = true
        palette.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        palette.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        palette.isScrollEnabled = false
    }
}

extension PaletteView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    private enum PaletteLiterals: CGFloat {
        case numOfCells = 8
        case widthPadding = 30
        case heightPadding = 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Int(PaletteLiterals.numOfCells.rawValue)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let defaultCell = ColorCollectionViewCell()
        let cell : ColorCollectionViewCell = (collectionView.dequeueReusableCell(withReuseIdentifier: "color", for: indexPath) as? ColorCollectionViewCell ?? defaultCell)
        let cellData = colors[indexPath.item]
        cellData == Brush.brush.getColor() ? cell.getSelected() : cell.getDeselected()
        cell.cellColor = cellData
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let cellWidthPadding = collectionView.frame.size.width / PaletteLiterals.widthPadding.rawValue
        let cellHeightPadding = collectionView.frame.size.height / PaletteLiterals.heightPadding.rawValue
        return UIEdgeInsets(top: cellHeightPadding,left: cellWidthPadding, bottom: cellHeightPadding,right: cellWidthPadding)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        brush.setColor(newColor: colors[indexPath.item])
        collectionView.reloadData()
    }
}
