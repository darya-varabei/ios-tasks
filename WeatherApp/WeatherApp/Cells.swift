//
//  Cells.swift
//  WeatherApp
//
//  Created by Дарья Воробей on 9/19/21.
//

import Foundation
import UIKit
import CoreData
import NetApi

class TextCell: UITableViewCell {
    
    var manager: FileManagement = FileManagement()
    var data: [City]?
    
    var mark: Bool? {
        didSet {
            marker.image = (self.mark == true ? UIImage(named: "star.fill") : UIImage(named: "star"))
            markButton.setImage(marker.image, for: .normal)
        }
    }
    
    var texts: String? {
        didSet {
            daytime.text = texts
        }
    }
    
    private let markButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        return button
    }()
    
    private let marker: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.tintColor = UIColor(named: "BasicYellow")
        image.clipsToBounds = true
        return image
    }()
    
    private let daytime: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "BasicWhite")
        label.font = UIFont(name: "NotoSans-Regular", size: 14)
        label.textAlignment = .left
        return label
    }()
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(markButton)
        
        markButton.setImage(marker.image, for: .normal)
        markButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        markButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15).isActive = true
        markButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        markButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true
        markButton.addTarget(self, action: #selector(switchStar(_:)), for: .touchUpInside)
        
        contentView.addSubview(daytime)
        
        daytime.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        daytime.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 50).isActive = true
        daytime.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        daytime.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func switchStar(_ sender: UIButton) {
        
        if data?.count != 0 {
            for i in 0..<18 {
                if data![i].city == texts {
                    if sender.currentImage == UIImage(named: "star"){
                        sender.setImage(UIImage(named: "star.fill"), for: .normal)
                        
                        data![i].isMarked = "1"
                    }
                    else {
                        sender.setImage(UIImage(named: "star"), for: .normal)
                        data![i].isMarked = "0"
                    }
                }
            }
            manager.saveData(data ?? [])
        }
    }
}

