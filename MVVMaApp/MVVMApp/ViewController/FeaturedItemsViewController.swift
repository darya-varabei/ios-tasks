//
//  FeaturedItemsViewController.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/15/22.
//

import Foundation
import UIKit

class FeaturedItemsViewController: UIViewController {
    
    @IBOutlet private var featuredTitleLabel: UILabel!
    @IBOutlet private var featuredCollectionView: UICollectionView!
    
    private enum BookViewControllerParameters {
        static let gradientTopColor = "darkGradientTop"
        static let gradientBottomColor = "darkGradientBottom"
        static let bookCell = "BookCollectionViewCell"
        static let fatalErrorMessage = "xib does not exists"
        static let detailViewController = "DetailViewController"
    }
    
    lazy var viewModel = {
        FeaturedBookViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        initViewModel()
    }
    
    override func viewDidLayoutSubviews() {
        setupBackgroundColor()
        view.bringSubviewToFront(featuredCollectionView)
        view.bringSubviewToFront(featuredTitleLabel)
    }
    
    private func setupBackgroundColor() {
        let gradient = CAGradientLayer()
        
        guard let top = UIColor(named: BookViewControllerParameters.gradientTopColor)?.cgColor else { return }
        guard let bottom = UIColor(named: BookViewControllerParameters.gradientBottomColor)?.cgColor else { return }
        gradient.frame = view.bounds
        gradient.colors = [top, bottom]
       
        view.layer.addSublayer(gradient)
    }
    
    private func setDelegates() {
        featuredCollectionView.delegate = self
        featuredCollectionView.dataSource = self
        featuredCollectionView.backgroundColor = UIColor.clear
        featuredCollectionView.register(UINib(nibName: BookViewControllerParameters.bookCell, bundle: nil), forCellWithReuseIdentifier: BookViewControllerParameters.bookCell)
    }
    
    private func initViewModel() {
        viewModel.getBooks()
        viewModel.reloadCollectionView = { [weak self] in
            DispatchQueue.main.async {
                self?.featuredCollectionView.reloadData()
            }
        }
    }
}

extension FeaturedItemsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    private enum CellSizeProperties {
        static let width = UIScreen.main.bounds.width / 2 - 30
        static let height = UIScreen.main.bounds.height / 3 - 50
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.featuredBooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CellSizeProperties.width, height: CellSizeProperties.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookViewControllerParameters.bookCell, for: indexPath) as? BookCollectionViewCell else { fatalError(BookViewControllerParameters.fatalErrorMessage) }
        let cellVM = viewModel.getCellViewModel(at: indexPath)
        cell.cellViewModel = cellVM
        cell.configure(viewModelGetObject: viewModel.getViewModel(index: indexPath.row))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let viewController = storyboard?.instantiateViewController(identifier: BookViewControllerParameters.detailViewController) as? DetailViewController {
            _ = viewController.view
            let cellVM = viewModel.getCellViewModel(at: indexPath)
            viewController.cellViewModel = cellVM
            viewController.configure(viewModelGetObject: viewModel.getViewModel(index: indexPath.row))
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
