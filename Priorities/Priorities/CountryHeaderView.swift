//
//  CountryHeaderView.swift
//  Priorities
//
//  Created by Darya on 11/12/21.
//

import UIKit

class CountryHeaderView: UIView {
    
    private let countryName: UILabel = {
        let label = UILabel()
        label.text = "Country is Italy: "
        label.backgroundColor = UIColor.white
        label.textColor = UIColor.blue
        return label
    }()
    
    private let capitalCity: UILabel = {
        let label = UILabel()
        label.text = "Capital - Rome"
        label.backgroundColor = UIColor.white
        label.textColor = UIColor.blue
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        self.addSubview(capitalCity)
        self.addSubview(countryName)
    }
    
    private func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        countryName.translatesAutoresizingMaskIntoConstraints = false
        countryName.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        countryName.rightAnchor.constraint(greaterThanOrEqualTo: capitalCity.leftAnchor, constant: -10).isActive = true
        countryName.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        capitalCity.translatesAutoresizingMaskIntoConstraints = false
        capitalCity.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        capitalCity.leftAnchor.constraint(greaterThanOrEqualTo: countryName.rightAnchor, constant: 10).isActive = true
        capitalCity.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
     
        capitalCity.setContentHuggingPriority(UILayoutPriority(rawValue: 250), for: .horizontal)
        capitalCity.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 751), for: .horizontal)
        countryName.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 750), for: .horizontal)
        countryName.setContentHuggingPriority(UILayoutPriority(rawValue: 250), for: .horizontal)
    }
}
