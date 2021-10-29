//
//  RecipeModel.swift
//  CookBookApi
//
//  Created by Darya on 10/18/21.
//

import Foundation

public struct Recipe: Decodable {
    public let hits: [Hit]
    
    enum CodingKeys: String, CodingKey {
        case hits
    }
}

public struct Hit: Decodable {
    public let recipe: RecipeClass
    
    enum CodingKeys: String, CodingKey {
        case recipe
    }
}

public struct RecipeClass: Decodable {
    public let label: String
    public let image: String
    public let healthLabels: [String]
    public let ingredientLines: [String]
    public let calories, totalWeight, totalTime: Double
    public let totalNutrients: [String: Total]
}


public struct Total: Decodable {
    public let label: String
    public let quantity: Double
}

public enum Label: String, Decodable {
    case calcium = "Calcium"
    case carbs = "Carbs"
    case carbsNet = "Carbs (net)"
    case cholesterol = "Cholesterol"
    case energy = "Energy"
    case fat = "Fat"
    case fiber = "Fiber"
    case folateEquivalentTotal = "Folate equivalent (total)"
    case folateFood = "Folate (food)"
    case folicAcid = "Folic acid"
    case iron = "Iron"
    case magnesium = "Magnesium"
    case monounsaturated = "Monounsaturated"
    case niacinB3 = "Niacin (B3)"
    case phosphorus = "Phosphorus"
    case polyunsaturated = "Polyunsaturated"
    case potassium = "Potassium"
    case protein = "Protein"
    case riboflavinB2 = "Riboflavin (B2)"
    case saturated = "Saturated"
    case sodium = "Sodium"
    case sugarAlcohols = "Sugar alcohols"
    case sugars = "Sugars"
    case sugarsAdded = "Sugars, added"
    case thiaminB1 = "Thiamin (B1)"
    case trans = "Trans"
    case vitaminA = "Vitamin A"
    case vitaminB12 = "Vitamin B12"
    case vitaminB6 = "Vitamin B6"
    case vitaminC = "Vitamin C"
    case vitaminD = "Vitamin D"
    case vitaminE = "Vitamin E"
    case vitaminK = "Vitamin K"
    case water = "Water"
    case zinc = "Zinc"
}
