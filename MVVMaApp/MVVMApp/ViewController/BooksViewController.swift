//
//  ViewController.swift
//  MVVMaApp
//
//  Created by Дарья Воробей on 1/13/22.
//

import UIKit

class BooksViewController: UIViewController {
    
    @IBOutlet private var categoriesCollectionView: UICollectionView!
    @IBOutlet private var booksCollectionView: UICollectionView!
    
    private var bufferBookCategories = [[String]]()
    private var bookCategories: Set<String> = []
    private var selectedCategory: String? = nil
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
    }
    
    override func viewDidLayoutSubviews() {
        setupBackgroundColor()
        view.bringSubviewToFront(categoriesCollectionView)
        view.bringSubviewToFront(booksCollectionView)
    }
    
    private func setupBackgroundColor() {
        let gradient = CAGradientLayer()
        
        guard let top = UIColor(named: Literals.gradientTopColor)?.cgColor else { return }
        guard let bottom = UIColor(named: Literals.gradientBottomColor)?.cgColor else { return }
        gradient.frame = view.bounds
        gradient.colors = [top, bottom]
       
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
        booksCollectionView.register(UINib(nibName: Literals.bookCell, bundle: nil), forCellWithReuseIdentifier: Literals.bookCell)
        categoriesCollectionView.register(UINib(nibName: Literals.categoryCell, bundle: nil), forCellWithReuseIdentifier: Literals.categoryCell)
    }
    
    private func initViewModel() {
        viewModel.getBooks()
        viewModel.reloadCollectionView = { [weak self] in
            DispatchQueue.main.async {
                self?.booksCollectionView.reloadData()
                //self?.categoryViewModel.getCategories(books: self?.viewModel.books ?? [], selectedCategory: self?.selectedCategory)
                self?.categoriesCollectionView.reloadData()
            }
        }
    }
}

extension BooksViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.restorationIdentifier == Literals.bookCollectionIdentifier {
            return viewModel.booksToCollection.count
        }
        else {
            return categoryViewModel.categories.count
       }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CellSizeProperties.width, height: CellSizeProperties.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.restorationIdentifier == Literals.bookCollectionIdentifier {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Literals.bookCell, for: indexPath) as? BookCollectionViewCell else { fatalError(Literals.fatalErrorMessage) }
            let cellVM = viewModel.getCellViewModel(at: indexPath)
            cell.cellViewModel = cellVM
            cell.configure(viewModelGetObject: viewModel.getViewModel(index: indexPath.row))
            return cell
        }
        else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Literals.categoryCell, for: indexPath) as? CategoryCollectionViewCell else { fatalError(Literals.fatalErrorMessage) }
            let cellVM = categoryViewModel.getCellViewModel(at: indexPath)
            cell.cellViewModel = cellVM
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView.restorationIdentifier == Literals.bookCollectionIdentifier {
            if let viewController = storyboard?.instantiateViewController(identifier: Literals.detailViewController) as? DetailViewController {
                _ = viewController.view
                let cellVM = viewModel.getCellViewModel(at: indexPath)
                viewController.cellViewModel = cellVM
                viewController.configure(viewModelGetObject: viewModel.getViewModel(index: indexPath.row))
                navigationController?.pushViewController(viewController, animated: true)
            }
        }
        else {
            var cellVM = categoryViewModel.getCellViewModel(at: indexPath)
            if selectedCategory == cellVM.name {
            viewModel.filterBooks(on: cellVM.name, isSelected: Observable(true))
            }
            else {
                selectedCategory = cellVM.name
                viewModel.filterBooks(on: cellVM.name, isSelected: Observable(false))
            }
            cellVM.toggleIfSelected()
            
        }
    }
}
