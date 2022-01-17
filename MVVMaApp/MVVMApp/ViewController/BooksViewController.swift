//
//  ViewController.swift
//  MVVMaApp
//
//  Created by Дарья Воробей on 1/13/22.
//

import UIKit

class BooksViewController: UIViewController {
    
    @IBOutlet private var searchTextField: UITextField!
    @IBOutlet private var categoriesCollectionView: UICollectionView!
    @IBOutlet private var booksCollectionView: UICollectionView!
    
    lazy var viewModel = {
        BookViewModel()
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
        
        guard let pink = UIColor(named: "darkGradientTop")?.cgColor else { return }
        guard let purple = UIColor(named: "darkGradientBottom")?.cgColor else { return }
        gradient.frame = view.bounds
        gradient.colors = [pink, purple]
       
        view.layer.addSublayer(gradient)
    }
    
    private func setDelegates() {
        categoriesCollectionView.delegate = self
        booksCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        booksCollectionView.dataSource = self
        booksCollectionView.backgroundColor = UIColor.clear
        categoriesCollectionView.backgroundColor = UIColor.clear
        booksCollectionView.register(UINib(nibName: "BookCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BookCollectionViewCell")
    }
    
    private func initViewModel() {
        viewModel.getBooks()
        viewModel.reloadCollectionView = { [weak self] in
            DispatchQueue.main.async {
                self?.booksCollectionView.reloadData()
            }
        }
    }
    
    private func setupKeyboard() {
        hideKeyboardWhenTappedAround()
        let bar = UIToolbar()
        searchTextField.inputAccessoryView = bar.hideKeyboardToolbar()
        searchTextField.keyboardType = .decimalPad
    }
}

extension BooksViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCollectionViewCell", for: indexPath) as? BookCollectionViewCell else { fatalError("xib does not exists") }
        let cellVM = viewModel.getCellViewModel(at: indexPath)
        cell.cellViewModel = cellVM
        
        return cell
    }
}
