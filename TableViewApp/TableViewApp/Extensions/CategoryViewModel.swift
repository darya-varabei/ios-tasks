//
//  CategoryViewModel.swift
//  MVVMApp
//
//  Created by Darya on 1/17/22.
//

import Foundation
import UIKit

class CategoryViewModel {
    var reloadCollectionView: (() -> Void)?
    
    var categories: [String] = []
    
    private var categoryCellViewModels = [CategoryCellViewModel]() {
        didSet {
            reloadCollectionView?()
        }
    }
    
    func getCategories(books: [Book], selectedCategory: String) {
 
        for i in books {
            for j in i.categories {
                if !categories.contains(j) {
                    categories.append(j)
                }
            }
        }
    
        for item in categories {
            if item != selectedCategory {
            categoryCellViewModels.append(createCellModel(category: Category(name: item, isSelected: false)))
        }
            else {
                categoryCellViewModels.append(createCellModel(category: Category(name: item, isSelected: true)))
            }
        }
    }
    
    func createCellModel(category: Category) -> CategoryCellViewModel {
        return CategoryCellViewModel(category: category)
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> CategoryCellViewModel {
        return categoryCellViewModels[indexPath.row]
    }
}
