//
//  TableViewCell.swift
//  TableViewApp
//
//  Created by Darya on 12/21/21.
//

import UIKit

class TableViewCell: UITableViewCell {

    var name: String? {
        didSet {
            nameLabel.text = name
        }
    }
    @IBOutlet private var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
