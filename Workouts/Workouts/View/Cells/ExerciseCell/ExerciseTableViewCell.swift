//
//  ExerciseTableViewCell.swift
//  Workouts
//
//  Created by Дарья Воробей on 2/1/22.
//

import UIKit

class ExerciseTableViewCell: UITableViewCell {

    @IBOutlet private var exerciseParametersLabel: UILabel!
    var labelText: String? {
        didSet {
            exerciseParametersLabel.text = labelText
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
