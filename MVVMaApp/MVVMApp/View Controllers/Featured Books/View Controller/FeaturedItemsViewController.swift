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
    
    private var viewModel: FeaturedBookViewModel?

    init(viewModel: FeaturedBookViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError(Literals.errorInitMessage)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewModel()
        setupCollectionView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
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

    private func setupCollectionView() {
        featuredCollectionView.delegate = self
        featuredCollectionView.dataSource = self
        featuredCollectionView.backgroundColor = UIColor.clear
        featuredCollectionView.register(UINib(nibName: Literals.bookCell, bundle: nil), forCellWithReuseIdentifier: Literals.bookCell)
    }

    private func initViewModel() {
        let queue = DispatchQueue.global(qos: .userInteractive)
        queue.sync {
            viewModel?.getBooks()
            viewModel?.getAllBooks().bind(observer: {_ in
                DispatchQueue.main.async { [weak self] in
                    self?.featuredCollectionView.reloadData()
                }
            })
        }
    }
}

extension FeaturedItemsViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Literals.bookCell, for: indexPath) as? BookCollectionViewCell else { fatalError(Literals.fatalErrorMessage) }
        let cellViewModel = viewModel?.getCellViewModel(at: indexPath)
        cell.cellViewModel = cellViewModel
        cell.configure(viewModelGetObject: viewModel?.getViewModel(index: indexPath.row))
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel?.goToDetailView!(.featured(.detailScreen), viewModel?.getCellViewModel(at: indexPath), viewModel?.getViewModel(index: indexPath.row))
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let counter = viewModel?.getAllBooks().value?.count else { return 0 }
        return counter
    }
}
