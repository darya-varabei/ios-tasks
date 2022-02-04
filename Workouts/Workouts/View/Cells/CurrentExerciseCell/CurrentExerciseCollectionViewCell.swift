//
//  CurrentExerciseCollectionViewCell.swift
//  Workouts
//
//  Created by Дарья Воробей on 2/1/22.
//

import UIKit

class CurrentExerciseCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var repeatsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func getData(name: String, repeats: Int, sets: Int) {
        nameLabel.text = name
        repeatsLabel.text = "\(sets)sets \(repeats) repeats"
    }
}
