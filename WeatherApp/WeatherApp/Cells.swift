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
    
    static let identifier = "text"
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var mark: Bool? {
        didSet {
            marker.image = (self.mark == true ? UIImage(named: "star.fill") : UIImage(named: "star"))
            markButton.setImage(marker.image, for: .normal)
        }
    }
    var text: String? {
        didSet{
            daytime.text = text
        }
    }
    
    fileprivate let markButton: UIButton = {
        let iv = UIButton()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        return iv
    }()
    
    fileprivate let marker: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.tintColor = UIColor(named: "BasicYellow")
        iv.clipsToBounds = true
        return iv
    }()
    
    fileprivate let daytime: UILabel = {
        let iv = UILabel()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.textColor = UIColor(named: "BasicWhite")
        iv.font = UIFont(name: "NotoSans-Regular", size: 14)
        iv.textAlignment = .left
        return iv
    }()
    
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
        let city = FeaturedCity(context: context)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FeaturedCity")
        fetchRequest.predicate = NSPredicate(format: "cityName = %@", self.text!)
        if sender.currentImage == UIImage(named: "star"){
            sender.setImage(UIImage(named: "star.fill"), for: .normal)
            city.cityName = self.text
            do {
                try context.save()
            }
            catch {
                context.rollback()
            }
        }
        else {
            sender.setImage(UIImage(named: "star"), for: .normal)
            
            do {
                let test = try context.fetch(fetchRequest)
                
                let objectToDelete = test[0] as! NSManagedObject
                context.delete(objectToDelete)
                
                do {
                    try context.save()
                } catch {
                    context.rollback()
                }
            } catch {
                print("Context save failure")
            }
        }
    }
}

class TableCell: UITableViewCell {
    
    static let identifier = "cell1"
    let timeRange = 11...15
    var data: Hour? {
        didSet {
            let timestr = String(data?.time ?? "")
            let index4 = timestr.index(timestr.startIndex, offsetBy: 11)
            guard let data = data else { return }
            bg.image = UIImage(named: String(data.condition.code))
            daytime.text = String(data.time.suffix(from:index4))
            temp.text = String("\(data.tempC)°C")
        }
    }
    
    fileprivate let bg: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 12
        return iv
    }()
    
    fileprivate let daytime: UILabel = {
        let iv = UILabel()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.textColor = UIColor(named: "BasicWhite")
        iv.font = UIFont(name: "NotoSans-Medium", size: 18)
        iv.textAlignment = .left
        return iv
    }()
    
    fileprivate let temp: UILabel = {
        let iv = UILabel()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.textColor = UIColor(named: "BasicWhite")
        iv.font = UIFont(name: "NotoSans-Medium", size: 22)
        return iv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(bg)
        
        bg.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12).isActive = true
        bg.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 20).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12).isActive = true
        
        contentView.addSubview(daytime)
        
        daytime.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 19).isActive = true
        daytime.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12).isActive = true
        daytime.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -240).isActive = true
        daytime.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -19).isActive = true
        
        contentView.addSubview(temp)
        
        temp.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 19).isActive = true
        temp.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 222).isActive = true
        temp.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -65).isActive = true
        temp.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -19).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class ForecastCell: UITableViewCell {
    
    static let identifier = "cell2"
    let timeRange = 11...15
    
    var data: Datum? {
        didSet {
            guard let data = data else { return }
            bg.image = UIImage(named: String(data.weather.code))
            daytime.text = data.validDate
            temp.text = String("\(data.minTemp)°C - \(data.maxTemp)°C")
        }
    }
    
    fileprivate let bg: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 12
        return iv
    }()
    
    fileprivate let daytime: UILabel = {
        let iv = UILabel()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.textColor = UIColor(named: "BasicWhite")
        iv.font = UIFont(name: "NotoSans-Medium", size: 18)
        iv.textAlignment = .left
        return iv
    }()
    
    fileprivate let temp: UILabel = {
        let iv = UILabel()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.textColor = UIColor(named: "BasicWhite")
        iv.font = UIFont(name: "NotoSans-Medium", size: 18)
        return iv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(bg)
        
        bg.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12).isActive = true
        bg.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 20).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12).isActive = true
        
        contentView.addSubview(daytime)
        
        daytime.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 19).isActive = true
        daytime.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12).isActive = true
        daytime.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -240).isActive = true
        daytime.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -19).isActive = true
        
        contentView.addSubview(temp)
        
        temp.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 19).isActive = true
        temp.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 170).isActive = true
        temp.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -65).isActive = true
        temp.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -19).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CustomCell: UICollectionViewCell {
    
    var data: Weather? {
        didSet {
            guard let data = data else { return }
            bg.image = UIImage(named: String(data.current.condition.code))
            city.text = data.location.name
            temp.text = String((data.current.tempC)) + "°C"
            condition.text = data.current.condition.text
        }
    }
    
    fileprivate let bg: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 12
        return iv
    }()
    
    fileprivate let city: UILabel = {
        let iv = UILabel()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.textColor = UIColor(named: "BasicWhite")
        iv.font = UIFont(name: "NotoSans-Regular", size: 12)
        iv.textAlignment = .right
        return iv
    }()
    
    fileprivate let temp: UILabel = {
        let iv = UILabel()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.textColor = UIColor(named: "BasicYellow")
        iv.font = UIFont(name: "NotoSans-Medium", size: 13)
        return iv
    }()
    
    fileprivate let condition: UILabel = {
        let iv = UILabel()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.textColor = UIColor(named: "OpaqueWhite")
        iv.font = UIFont(name: "NotoSans-Regular", size: 10)
        iv.textAlignment = .right
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.addSubview(bg)
        
        bg.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12).isActive = true
        bg.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 11).isActive = true
        bg.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -93).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12).isActive = true
        
        contentView.addSubview(city)
        
        city.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        city.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 70).isActive = true
        city.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -14).isActive = true
        city.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -38).isActive = true
        
        contentView.addSubview(temp)
        
        temp.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24).isActive = true
        temp.widthAnchor.constraint(equalToConstant: 40).isActive = true
        temp.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -14).isActive = true
        temp.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -21).isActive = true
        
        contentView.addSubview(condition)
        
        condition.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 42).isActive = true
        condition.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 40).isActive = true
        condition.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -14).isActive = true
        condition.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

