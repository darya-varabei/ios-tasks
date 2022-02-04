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
        layer.borderWidth = 2
        layer.borderColor = UIColor.lightGray.cgColor
    }

}
extension WorkoutCollectionViewCell {
    func configure(for workout: Session) {
        workoutNameLabel.text = workout.name
        //tergetAreasLabel.text = workout.targerAreas.joined(separator: ", ")
    }
}
