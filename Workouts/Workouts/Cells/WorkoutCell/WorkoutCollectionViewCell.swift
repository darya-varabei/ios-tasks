//
//  WorkoutCollectionViewCell.swift
//  Workouts
//
//  Created by Дарья Воробей on 1/31/22.
//

import UIKit

class WorkoutCollectionViewCell: UICollectionViewCell {

    @IBOutlet private var startButton: UIButton!
    @IBOutlet private var workoutNameLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!
    @IBOutlet private var tergetAreasLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
