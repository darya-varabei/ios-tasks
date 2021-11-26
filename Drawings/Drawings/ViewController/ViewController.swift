//
//  ViewController.swift
//  Drawings
//
//  Created by Darya on 11/18/21.
//

import UIKit

class ViewController: UICollectionViewController {
    
    var sections = Drawing.drawings
    typealias DataSource = UICollectionViewDiffableDataSource<Drawing, Drawing>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Drawing, Drawing>
    lazy var dataSource = makeDataSource()
    var searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureSearchController()
        sections = filteredSections(for: "")
        applySnapshot()
    }
}
