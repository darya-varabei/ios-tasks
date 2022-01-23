//
//  FeaturedItemsViewController.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/23/22.
//

import UIKit

class FeaturedItemsViewController: UIViewController {
    
    @IBOutlet private var featuredTitleLabel: UILabel!
    @IBOutlet private var featuredCollectionView: UICollectionView!
    var coordinator: FeaturedBaseCoordinator?

    init(coordinator: FeaturedBaseCoordinator) {
        super.init(nibName: nil, bundle: nil)
        self.coordinator = coordinator
        title = "Favourite"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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

        guard let top = UIColor(named: Literals.gradientTopColor)?.cgColor else { return }
        guard let bottom = UIColor(named: Literals.gradientBottomColor)?.cgColor else { return }
        gradient.frame = view.bounds
        gradient.colors = [top, bottom]

        view.layer.addSublayer(gradient)
    }

    private func setDelegates() {
        featuredCollectionView.delegate = self
        featuredCollectionView.dataSource = self
        featuredCollectionView.backgroundColor = UIColor.clear
        featuredCollectionView.register(UINib(nibName: Literals.bookCell, bundle: nil), forCellWithReuseIdentifier: Literals.bookCell)
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

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.books.count
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CellSizeProperties.width, height: CellSizeProperties.height)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Literals.bookCell, for: indexPath) as? BookCollectionViewCell else { fatalError(Literals.fatalErrorMessage) }
        let cellVM = viewModel.getCellViewModel(at: indexPath)
        cell.cellViewModel = cellVM
        cell.configure(viewModelGetObject: viewModel.getViewModel(index: indexPath.row))
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let viewController = storyboard?.instantiateViewController(identifier: Literals.detailViewController) as? BookDetailViewController {
            _ = viewController.view
            let cellVM = viewModel.getCellViewModel(at: indexPath)
            viewController.cellViewModel = cellVM
            viewController.configure(viewModelGetObject: viewModel.getViewModel(index: indexPath.row))
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
