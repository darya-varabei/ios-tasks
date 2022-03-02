//
//  CategoryCellViewModel.swift
//  MVVMApp
//
//  Created by Darya on 1/17/22.
//

import Foundation
import UIKit

struct CategoryCellViewModel {
    
    private var category: Category
    
    init(category: Category) {
        self.category = category
    }
    
    var name: String {
        return category.name
    }
    
    var isSelected: Bool {
        return category.isSelected
    }
    
    mutating func toggleIfSelected() {
        category.isSelected.toggle()
    }
}
