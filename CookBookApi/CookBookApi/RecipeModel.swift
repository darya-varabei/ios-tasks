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
