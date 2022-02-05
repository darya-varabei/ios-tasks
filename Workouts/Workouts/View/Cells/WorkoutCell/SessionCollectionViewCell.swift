//
//  SessionCollectionViewCell.swift
//  Workouts
//
//  Created by Дарья Воробей on 2/4/22.
//

import Foundation
import UIKit

class SessionCollectionViewCell: UICollectionViewCell {
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var targetAreasLabel: UILabel!
    @IBOutlet private var dateLastCompleted: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 2
        layer.borderColor = UIColor.lightGray.cgColor
    }
}

extension SessionCollectionViewCell {
    func configure(for workout: Session) {
        nameLabel.text = workout.name
        targetAreasLabel.text = workout.type
        dateLastCompleted.text = "Scheduled at: \(workout.time)"
    }
}
