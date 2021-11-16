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
        label.text = "Country is named: "
        label.backgroundColor = UIColor.white
        label.textColor = UIColor.blue
        return label
    }()
    
    let capitalCity: UILabel = {
        let label = UILabel()
        label.text = "Republic of Italy, capital city - Rome"
        label.backgroundColor = UIColor.white
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
    
    func setupViews() {
        self.addSubview(capitalCity)
        self.addSubview(countryName)
    }
    
    func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.countryName.translatesAutoresizingMaskIntoConstraints = false
        self.countryName.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        self.countryName.rightAnchor.constraint(greaterThanOrEqualTo: self.capitalCity.leftAnchor, constant: -10).isActive = true
        self.countryName.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        self.capitalCity.translatesAutoresizingMaskIntoConstraints = false
        self.capitalCity.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        self.capitalCity.leftAnchor.constraint(greaterThanOrEqualTo: self.countryName.rightAnchor, constant: 10).isActive = true
        self.capitalCity.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        self.capitalCity.setContentHuggingPriority(UILayoutPriority(rawValue: 250), for: .horizontal)
        self.capitalCity.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 750), for: .horizontal)
        self.countryName.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 751), for: .horizontal)
        self.countryName.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .horizontal)
    }
}
