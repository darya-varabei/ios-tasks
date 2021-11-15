//
//  CountryHeaderView.swift
//  Priorities
//
//  Created by Darya on 11/12/21.
//

import UIKit

class CountryHeaderView: UIView {
    
    let countryName: UILabel = {
        let label = UILabel()
        label.text = "Country: "
        label.backgroundColor = UIColor.yellow
        label.textColor = UIColor.blue
        return label
    }()
    
    let capitalCity: UILabel = {
        let label = UILabel()
        label.text = "Republic of Italy, capital city - Rome"
        label.backgroundColor = UIColor.systemPink
        label.textColor = UIColor.blue
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
        setupConstraints()
      }
    
    let contentView: UIView = {
        let view = UIView(frame: CGRect(x: 50, y: 50, width: 300, height: 100))
        view.layer.borderWidth = 1
        view.layer.backgroundColor = UIColor.yellow.cgColor
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()
    
    func setupViews() {
        self.addSubview(contentView)
        self.addSubview(capitalCity)
        self.addSubview(countryName)
        self.contentView.addSubview(countryName)
        self.contentView.addSubview(capitalCity)
    }
    
    func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.countryName.translatesAutoresizingMaskIntoConstraints = false
        self.countryName.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        self.countryName.rightAnchor.constraint(greaterThanOrEqualTo: self.capitalCity.leftAnchor, constant: -10).isActive = true
        self.countryName.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        self.capitalCity.translatesAutoresizingMaskIntoConstraints = false
        self.capitalCity.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -30).isActive = true
        self.capitalCity.leftAnchor.constraint(greaterThanOrEqualTo: self.countryName.rightAnchor, constant: 10).isActive = true
        self.capitalCity.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        self.capitalCity.setContentCompressionResistancePriority(UILayoutPriority.defaultLow, for: .horizontal)
        self.countryName.setContentHuggingPriority(UILayoutPriority.defaultLow + 1, for: .horizontal)
    }
}
