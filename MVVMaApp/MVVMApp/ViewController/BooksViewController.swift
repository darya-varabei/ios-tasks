//
//  ViewController.swift
//  MVVMaApp
//
//  Created by Дарья Воробей on 1/13/22.
//

import UIKit

//class BooksViewController: UIViewController, BooksBaseCoordinated {
//    @IBOutlet weak var categoryCollectionView: UICollectionView!
//    
//    @IBOutlet weak var booksCollectionView: UICollectionView!
//    var coordinator: BooksBaseCoordinator?
//    
//    private var bufferBookCategories = [[String]]()
//    private var bookCategories: Array<String> = []
//    private var selectedCategory: String? = "o"
//    lazy var viewModel = {
//            BookViewModel()
//        }()
//        
//        lazy var categoryViewModel = {
//            CategoryViewModel()
//        }()
//
//    
//    init(coordinator: BooksBaseCoordinator) {
//        super.init(nibName: "BooksViewController", bundle: nil)
//        self.coordinator = coordinator
//        title = "Books"
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//       super.init(coder: aDecoder)
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setDelegates()
//        initViewModel()
//        setupBackgroundColor()
//        view.bringSubviewToFront( categoryCollectionView)
//        view.bringSubviewToFront(booksCollectionView)
//    }
//    
////    override func viewDidLayoutSubviews() {
////        setupBackgroundColor()
////        view.bringSubviewToFront(categoriesCollectionView)
////        view.bringSubviewToFront(booksCollectionView)
////    }
//    
//    private func setupBackgroundColor() {
//        let gradient = CAGradientLayer()
//        
//        guard let top = UIColor(named: Literals.gradientTopColor)?.cgColor else { return }
//        guard let bottom = UIColor(named: Literals.gradientBottomColor)?.cgColor else { return }
//        gradient.frame = view.bounds
//        gradient.colors = [top, bottom]
//       
//        view.layer.addSublayer(gradient)
//    }
//    
//    private func setDelegates() {
//        booksCollectionView.translatesAutoresizingMaskIntoConstraints = true
//        categoryCollectionView.delegate = self
//        booksCollectionView.delegate = self
//        categoryCollectionView.dataSource = self
//        booksCollectionView.dataSource = self
//        booksCollectionView.backgroundColor = UIColor.clear
//        categoryCollectionView.backgroundColor = UIColor.clear
//        booksCollectionView.register(UINib(nibName: Literals.bookCell, bundle: nil), forCellWithReuseIdentifier: Literals.bookCell)
//        categoryCollectionView.register(UINib(nibName: Literals.categoryCell, bundle: nil), forCellWithReuseIdentifier: Literals.categoryCell)
//    }
//    
//    private func initViewModel() {
//        viewModel.getBooks()
//        viewModel.reloadCollectionView = { [weak self] in
//            //if let category = selectedCategory {} else { category = ""}
//            DispatchQueue.main.async {
//                guard let category = self?.selectedCategory else { return }
//                self?.booksCollectionView.reloadData()
//                self?.categoryViewModel.getCategories(books: self?.viewModel.books ?? [], selectedCategory: category)
//                print("\n\n\n\n\n\n\n\n")
//                self?.categoryCollectionView.reloadData()
//            }
//        }
//    }
//}
//
//extension BooksViewController: UICollectionViewDelegate, UICollectionViewDataSource {
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if collectionView.restorationIdentifier == Literals.bookCollectionIdentifier {
//            print("###############")
//            print(viewModel.booksToCollection.count)
//            return viewModel.booksToCollection.count
//        }
//        else {
//            return categoryViewModel.categories.count
//       }
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: CellSizeProperties.width, height: CellSizeProperties.height)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        
//        if collectionView.restorationIdentifier == Literals.bookCollectionIdentifier {
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Literals.bookCell, for: indexPath) as? BookCollectionViewCell else { fatalError(Literals.fatalErrorMessage) }
//            let cellVM = viewModel.getCellViewModel(at: indexPath)
//            cell.cellViewModel = cellVM
//            cell.configure(viewModelGetObject: viewModel.getViewModel(index: indexPath.row))
//            return cell
//        }
//        else {
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Literals.categoryCell, for: indexPath) as? CategoryCollectionViewCell else { fatalError(Literals.fatalErrorMessage) }
//            let cellVM = categoryViewModel.getCellViewModel(at: indexPath)
//            cell.cellViewModel = cellVM
//            
//            return cell
//        }
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        
//        if collectionView.restorationIdentifier == Literals.bookCollectionIdentifier {
//            if let viewController = storyboard?.instantiateViewController(identifier: Literals.detailViewController) as? DetailViewController {
//                _ = viewController.view
//                let cellVM = viewModel.getCellViewModel(at: indexPath)
//                viewController.cellViewModel = cellVM
//                viewController.configure(viewModelGetObject: viewModel.getViewModel(index: indexPath.row))
//                navigationController?.pushViewController(viewController, animated: true)
//            }
//        }
//        else {
//            var cellVM = categoryViewModel.getCellViewModel(at: indexPath)
//            if cellVM.isSelected.value {
//                selectedCategory = "-"
//                print("**************")
//                print("1")
//                viewModel.filterBooks(on: cellVM.name, isSelected: Observable(true))
//            }
//            else {
//                selectedCategory = cellVM.name
//                print("**************")
//                print("2")
//                viewModel.filterBooks(on: cellVM.name, isSelected: Observable(false))
//            }
//            //viewModel.filterBooks(on: cellVM.name, isSelected: cellVM.isSelected)
//            cellVM.toggleIfSelected()
//            
//        }
//    }
//}
