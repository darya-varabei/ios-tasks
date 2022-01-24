//
//  CategoryViewModel.swift
//  MVVMApp
//
//  Created by Darya on 1/17/22.
//

import Foundation
import UIKit

class CategoryViewModel {
    private var categories: [String] = []
    private var categoryCellViewModels = [CategoryCellViewModel]() {
        didSet {
            reloadCollectionView?()
        }
    }
    
    var reloadCollectionView: (() -> Void)?
    
    func getCateroriesList() -> [String] {
        return categories
    }
    
    func getCategories(books: [Book], selectedCategory: String) {
 
        for book in books {
            for category in book.categories {
                if !categories.contains(category) {
                    categories.append(category)
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
