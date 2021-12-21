//
//  TableViewCell.swift
//  TableViewApp
//
//  Created by Darya on 12/21/21.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
