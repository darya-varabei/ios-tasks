//
//  NutrientsView.swift
//  Cookbook
//
//  Created by Дарья Воробей on 10/21/21.
//

import UIKit

class NutrientsView: UIView {
    
    var totalProtein: Double?
    var totalFat: Double?
    var totalCarbs: Double?
    var totalCalories: Double?
    
    private let protein: UILabel = {
        let label = UILabel()
        label.text = "Protein"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(ciColor: .black)
        label.font = UIFont(name: "NotoSans-Regular", size: 14)
        label.textAlignment = .left
        return label
    }()
    
    private let fat: UILabel = {
        let label = UILabel()
        label.text = "Fat"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(ciColor: .black)
        label.font = UIFont(name: "NotoSans-Regular", size: 14)
        label.textAlignment = .left
        return label
    }()
    
    private let carbs: UILabel = {
        let label = UILabel()
        label.text = "Carbohidra"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(ciColor: .black)
        label.font = UIFont(name: "NotoSans-Regular", size: 14)
        label.textAlignment = .left
        return label
    }()
    
    private let calories: UILabel = {
        let label = UILabel()
        label.text = "Calories"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(ciColor: .black)
        label.font = UIFont(name: "NotoSans-Regular", size: 14)
        label.textAlignment = .left
        return label
    }()
}
