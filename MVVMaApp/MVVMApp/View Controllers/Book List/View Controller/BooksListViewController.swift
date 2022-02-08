//
//  BooksListViewController.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/23/22.
//

import UIKit

class BooksListViewController: UIViewController {
    
    @IBOutlet private var categoryCollection: UICollectionView!
    @IBOutlet private var booksCollection: UICollectionView!
    
    private var bookCategories: Array<String> = []
    private var selectedCategory: String? = ""
    private var viewModel: BookViewModel
    
    private var categoryViewModel = {
        CategoryViewModel()
    }()
    
    init(viewModel: BookViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError(Literals.errorInitMessage)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewModel()
        setDelegates()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupBackgroundColor()
        view.bringSubviewToFront(categoryCollection)
        view.bringSubviewToFront(booksCollection)
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
        categoryCollection.delegate = self
        booksCollection.delegate = self
        categoryCollection.dataSource = self
        booksCollection.dataSource = self
        booksCollection.backgroundColor = UIColor.clear
        categoryCollection.backgroundColor = UIColor.clear
        booksCollection.register(UINib(nibName: Literals.bookCell, bundle: nil), forCellWithReuseIdentifier: Literals.bookCell)
        categoryCollection.register(UINib(nibName: Literals.categoryCell, bundle: nil), forCellWithReuseIdentifier: Literals.categoryCell)
    }
    
    private func initViewModel() {
        let queue = DispatchQueue.global(qos: .userInteractive)
        queue.sync {
            viewModel.getBooks()
        }
        viewModel.getAllBooks().bind(observer: {_ in
            DispatchQueue.main.async {
                guard let category = self.selectedCategory else { return }
                self.booksCollection.reloadData()
                self.categoryViewModel.getCategories(books: self.viewModel.getAllBooks().value ?? [], selectedCategory: category)
                self.categoryCollection.reloadData()
            }
        })
    }
}

extension BooksListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.restorationIdentifier == Literals.bookCollectionIdentifier {
            if viewModel.getBooksForCollection().value?.count != nil {
                return viewModel.getBooksForCollection().value?.count ?? 0
            }
            return 0
        }
        else {
            return categoryViewModel.getCateroriesList().count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.restorationIdentifier == Literals.bookCollectionIdentifier {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Literals.bookCell, for: indexPath) as? BookCollectionViewCell else { fatalError(Literals.fatalErrorMessage) }
            let cellViewModel = viewModel.getCellViewModel(at: indexPath)
            cell.cellViewModel = cellViewModel
            cell.configure(viewModelGetObject: viewModel.getViewModel(index: indexPath.row))
            return cell
        }
        else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Literals.categoryCell, for: indexPath) as? CategoryCollectionViewCell else { fatalError(Literals.fatalErrorMessage) }
            let cellViewModel = categoryViewModel.getCellViewModel(at: indexPath)
            cell.cellViewModel = cellViewModel
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView.restorationIdentifier == Literals.bookCollectionIdentifier {
            viewModel.goToDetailView(flow: .books(.detailsScreen), cellViewModel: viewModel.getCellViewModel(at: indexPath), viewModelGetObject: viewModel.getViewModel(index: indexPath.row))
        }
        else {
            var cellViewModel = categoryViewModel.getCellViewModel(at: indexPath)
            if cellViewModel.isSelected {
                selectedCategory = "-"
            }
            else {
                selectedCategory = cellViewModel.name
            }
            viewModel.filterBooks(on: cellViewModel.name, isSelected: cellViewModel.isSelected)
            cellViewModel.toggleIfSelected()
        }
    }
}
