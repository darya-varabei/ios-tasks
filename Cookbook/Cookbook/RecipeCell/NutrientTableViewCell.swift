//
//  NutrientTableViewCell.swift
//  Cookbook
//
//  Created by Дарья Воробей on 10/21/21.
//

import UIKit

class NutrientTableViewCell: UITableViewCell {

    @IBOutlet weak var nutrientName: UILabel!
    @IBOutlet weak var nutrientValue: UILabel!
    
    var nutrientType: String? {
        didSet {
            DispatchQueue.main.async {
                self.nutrientName.text = self.nutrientType
            }
        }
    }
    var nutrientAmount: String? {
        didSet {
            DispatchQueue.main.async {
            self.nutrientValue.text = self.nutrientAmount ?? ""
            }
        }
    }
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
}
