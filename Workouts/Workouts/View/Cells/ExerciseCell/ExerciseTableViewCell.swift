//
//  ExerciseTableViewCell.swift
//  Workouts
//
//  Created by Дарья Воробей on 2/1/22.
//

import UIKit

class ExerciseTableViewCell: UITableViewCell {

    @IBOutlet private var exerciseParametersLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
