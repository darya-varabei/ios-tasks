//
//  ViewController.swift
//  MVVMaApp
//
//  Created by Дарья Воробей on 1/13/22.
//

import UIKit

class BooksViewController: UIViewController {
    
    private enum BookViewControllerParameters {
        static let gradientTopColor = "darkGradientTop"
        static let gradientBottomColor = "darkGradientBottom"
        static let bookCell = "BookCollectionViewCell"
        static let categoryCell = "CategoryCollectionViewCell"
        static let bookCollectionIdentifier = "BooksCollectionView"
        static let fatalErrorMessage = "xib does not exists"
    }
    
    @IBOutlet private var searchTextField: UITextField!
    @IBOutlet private var categoriesCollectionView: UICollectionView!
    @IBOutlet private var booksCollectionView: UICollectionView!
    
    private var bufferBookCategories = [[String]]()
    private var bookCategories: Set<String> = []
    lazy var viewModel = {
        BookViewModel()
    }()
    
    lazy var categoryViewModel = {
        CategoryViewModel()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        initViewModel()
        setupKeyboard()
    }
    
    override func viewDidLayoutSubviews() {
        setupBackgroundColor()
        view.bringSubviewToFront(searchTextField)
        view.bringSubviewToFront(categoriesCollectionView)
        view.bringSubviewToFront(booksCollectionView)
    }
    
    private func setupBackgroundColor() {
        let gradient = CAGradientLayer()
        
        guard let pink = UIColor(named: BookViewControllerParameters.gradientTopColor)?.cgColor else { return }
        guard let purple = UIColor(named: BookViewControllerParameters.gradientBottomColor)?.cgColor else { return }
        gradient.frame = view.bounds
        gradient.colors = [pink, purple]
       
        view.layer.addSublayer(gradient)
    }
    
    private func setDelegates() {
        booksCollectionView.translatesAutoresizingMaskIntoConstraints = true
        categoriesCollectionView.delegate = self
        booksCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        booksCollectionView.dataSource = self
        booksCollectionView.backgroundColor = UIColor.clear
        categoriesCollectionView.backgroundColor = UIColor.clear
        booksCollectionView.register(UINib(nibName: BookViewControllerParameters.bookCell, bundle: nil), forCellWithReuseIdentifier: BookViewControllerParameters.bookCell)
        categoriesCollectionView.register(UINib(nibName: BookViewControllerParameters.categoryCell, bundle: nil), forCellWithReuseIdentifier: BookViewControllerParameters.categoryCell)
    }
    
    private func initViewModel() {
        viewModel.getBooks()
        viewModel.reloadCollectionView = { [weak self] in
            DispatchQueue.main.async {
                self?.booksCollectionView.reloadData()
                self?.categoryViewModel.getCategories(books: self?.viewModel.books ?? [])
                self?.categoriesCollectionView.reloadData()
            }
        }
    }
    
    private func setupKeyboard() {
        hideKeyboardWhenTappedAround()
        let bar = UIToolbar()
        searchTextField.inputAccessoryView = bar.hideKeyboardToolbar()
    }
    
    
}

extension BooksViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.restorationIdentifier == BookViewControllerParameters.bookCollectionIdentifier {
            return viewModel.books.count
        }
        else {
            return categoryViewModel.categories.count
       }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 2 - 30, height: UIScreen.main.bounds.height / 3 - 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.restorationIdentifier == BookViewControllerParameters.bookCollectionIdentifier {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookViewControllerParameters.bookCell, for: indexPath) as? BookCollectionViewCell else { fatalError(BookViewControllerParameters.fatalErrorMessage) }
            let cellVM = viewModel.getCellViewModel(at: indexPath)
            cell.cellViewModel = cellVM
            cell.configure(viewModelGetObject: viewModel.getViewModel(index: indexPath.row))
            return cell
        }
        else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookViewControllerParameters.categoryCell, for: indexPath) as? CategoryCollectionViewCell else { fatalError(BookViewControllerParameters.fatalErrorMessage) }
            let cellVM = categoryViewModel.getCellViewModel(at: indexPath)
            cell.cellViewModel = cellVM
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let viewController = storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController {
            _ = viewController.view
            let cellVM = viewModel.getCellViewModel(at: indexPath)
            viewController.cellViewModel = cellVM
            viewController.configure(viewModelGetObject: viewModel.getViewModel(index: indexPath.row))
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
