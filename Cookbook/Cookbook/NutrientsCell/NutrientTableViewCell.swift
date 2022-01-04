//
//  NutrientTableViewCell.swift
//  Cookbook
//
//  Created by Дарья Воробей on 10/21/21.
//

import UIKit

class NutrientTableViewCell: UITableViewCell {
    
    @IBOutlet private var nutrientName: UILabel!
    @IBOutlet private var nutrientValue: UILabel!
    
    var nutrientType: String? {
        didSet {
            self.nutrientName.text = self.nutrientType
        }
    }
    
    var nutrientAmount: String? {
        didSet {
            self.nutrientValue.text = self.nutrientAmount ?? ""
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
