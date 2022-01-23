//
//  BookViewControllerCoordinator.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/22/22.
//

import Foundation
import UIKit

//class BookViewControllerCoordinator: Coordinator {
//    
//    private let presenter: UINavigationController
//    private var booksListViewController: BooksViewController?
//    private var detailCoordinator: DetailViewControllerCoordinator?
//    private var selectedCategory = "0"
//    
//    lazy var viewModel = {
//        BookViewModel()
//    }()
//    
//    lazy var categoryViewModel = {
//        CategoryViewModel()
//    }()
//    
//    init(presenter: UINavigationController) {
//        self.presenter = presenter
//    }
//    
//    func start() {
//        let bookListViewController = BooksViewController()
//        bookListViewController.title = "Books list"
//        initViewModel()
//        
//        
//    }
//    
//    private func initViewModel() {
//        viewModel.getBooks()
//        viewModel.reloadCollectionView = { [weak self] in
//            //if let category = selectedCategory {} else { category = ""}
//            DispatchQueue.main.async { [self] in
//                guard let category = self?.selectedCategory else { return }
//                //self?.booksCollectionView.reloadData()
//                self?.categoryViewModel.getCategories(books: self?.viewModel.books ?? [], selectedCategory: category)
//                print("\n\n\n\n\n\n\n\n")
//               // self?.categoriesCollectionView.reloadData()
//            }
//        }
//    }
//}
