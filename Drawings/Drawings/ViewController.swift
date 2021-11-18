//
//  ViewController.swift
//  Drawings
//
//  Created by Darya on 11/18/21.
//

import UIKit

class ViewController: UICollectionViewController {
    
    var sections = Section.sections
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Drawing>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Drawing>
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
