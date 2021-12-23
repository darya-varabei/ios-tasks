//
//  ViewController.swift
//  TableViewApp
//
//  Created by Darya on 12/21/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var familyTableView: UITableView!
    @IBOutlet private var navigationBar: UINavigationBar!
    @IBOutlet private var addPersonButton: UIBarButtonItem!
    
    enum AnimationParameters {
        static let springDumping: CGFloat = 0.4
        static let springVelocity: CGFloat = 0.1
        static let duration: TimeInterval = 1
        static let delayFactor = 0.05
    }
    
    enum AlertParameters {
        static let title = "Add new person"
        static let message = "Type new person's name"
        static let cancelTitle = "Cancel"
        static let addTitle = "Add"
        static let placeholder = "Name"
    }
    
    let tableCellIdentifier = "TableViewCell"
    let emptyTableMessage = "Table is currently empty"
    var namesArray: [String] = ["Alice", "Max", "Henry", "Amanda", "John", "Patrick"]
    
    private let refreshControl = UIRefreshControl()
    private let pullToRefreshText = "Pull to refresh"
    
    private enum Colors {
        static let gradientPink = "gradientPink"
        static let gradientPurple = "gradientPurple"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        familyTableView.delegate = self
        familyTableView.dataSource = self
        setupAddButton()
        setupRefreshController()
    }
    
    override func viewDidLayoutSubviews() {
        setupBackgroundColor()
    }
    
    private func setupAddButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(showAlert(_:))
        )
    }
    
    private func setupBackgroundColor() {
        let gradient = CAGradientLayer()
        
        gradient.frame = view.bounds
        gradient.colors = [UIColor(named: Colors.gradientPink)?.cgColor ?? UIColor.white.cgColor, UIColor(named: Colors.gradientPurple)?.cgColor ?? UIColor.white.cgColor]
       
        view.layer.addSublayer(gradient)
        view.bringSubviewToFront(familyTableView)
    }
    
    private func setupRefreshController() {
        refreshControl.attributedTitle = NSAttributedString(string: pullToRefreshText)
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        familyTableView.addSubview(refreshControl)
    }
    
    @objc private func refresh(_ sender: AnyObject) {
        namesArray.shuffle()
        familyTableView.reloadData()
        refreshControl.endRefreshing()
    }
}

