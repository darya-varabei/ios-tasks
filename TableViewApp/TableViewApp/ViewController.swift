//
//  ViewController.swift
//  TableViewApp
//
//  Created by Darya on 12/21/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var familyTableView: UITableView!
    var namesArray: [String] = ["Alice", "Max", "Henry", "Amanda", "John", "Patrick"]
    private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        familyTableView.delegate = self
        familyTableView.dataSource = self
        setupRefreshController()
    }
    
    private func setupRefreshController() {
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        familyTableView.addSubview(refreshControl)
    }
    
    @objc private func refresh(_ sender: AnyObject) {
        namesArray.shuffle()
        familyTableView.reloadData()
        refreshControl.endRefreshing()
    }
}

