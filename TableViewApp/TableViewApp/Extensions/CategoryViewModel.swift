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
    
    var categories: Set<String> = []
    
    var categoryCellViewModels = [CategoryCellViewModel]() {
        didSet {
            reloadCollectionView?()
        }
    }
    
    func getCategories(books: [Book]) -> [String] {
        let bufferBookCategories = books.map { $0.categories }
        categories = Set(bufferBookCategories.flatMap { $0 })
        return Array(categories)
    }
    
    func createCellModel(category: Category) -> CategoryCellViewModel {
        return CategoryCellViewModel(category: category)
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> CategoryCellViewModel {
        return categoryCellViewModels[indexPath.row]
    }
}
