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
    
    var color: Observable<UIColor>?
    
    var isSelected: Observable<Bool> {
        return Observable(category.isSelected)
    }
    
    mutating func toggleIfSelected() {
        category.isSelected.toggle()
    }
    
//    mutating func cellTap() {
//        if Observable(isSelected) {
//            category.isSelected = false
//            color = Observable(UIColor.init(white: 1, alpha: 0.1))
//        }
//        else {
//            category.isSelected = true
//            color = Observable(UIColor.init(white: 1, alpha: 0.5))
//        }
//    }
}
