//
//  ViewController.swift
//  TableViewApp
//
//  Created by Darya on 12/21/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private var navigationBar: UINavigationBar!
    @IBOutlet private var addPersonButton: UIBarButtonItem!
    @IBOutlet fileprivate var familyTableView: UITableView!
    
    fileprivate let tableCellIdentifier = "TableViewCell"
    fileprivate var namesArray: [String] = ["Alice", "Max", "Henry", "Amanda", "John", "Patrick"]
    
    private let refreshControl = UIRefreshControl()
    private let pullToRefreshText = "Pull to refresh"
    private let emptyTableMessage = "Table is currently empty"
    
    private enum Colors {
        static let gradientPink = "gradientPink"
        static let gradientPurple = "gradientPurple"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        familyTableView.delegate = self
        familyTableView.dataSource = self
        familyTableView.dragDelegate = self
        familyTableView.dropDelegate = self
        familyTableView.dragInteractionEnabled = true
        setupAddButton()
        setupRefreshControl()
    }
    
    override func viewDidLayoutSubviews() {
        setupBackgroundColor()
    }
    
    func updateNamesArray(newItem: String) {
        namesArray.append(newItem)
    }
    
    func reloadTable() {
        familyTableView.reloadData()
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
        
        guard let pink = UIColor(named: Colors.gradientPink)?.cgColor else { return }
        guard let purple = UIColor(named: Colors.gradientPurple)?.cgColor else { return }
        gradient.frame = view.bounds
        gradient.colors = [pink, purple]
       
        view.layer.addSublayer(gradient)
        view.bringSubviewToFront(familyTableView)
    }
    
    private func setupRefreshControl() {
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

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if namesArray.count == 0 {
            familyTableView.setBackgroundMessage(emptyTableMessage: emptyTableMessage)
        }
        else {
            familyTableView.removeEmptyTableMessage()
        }
        return namesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = Bundle.main.loadNibNamed(tableCellIdentifier, owner: self, options: nil)?.first as? TableViewCell else { return TableViewCell() }
        cell.name = namesArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            familyTableView.beginUpdates()
            familyTableView.deleteRows(at: [indexPath], with: .fade)
            namesArray.remove(at: indexPath.row)
            familyTableView.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let animation = makeMoveUpWithBounce(rowHeight: cell.frame.height, duration: AnimationParameters.duration, delayFactor: AnimationParameters.delayFactor)
        let animator = Animator(animation: animation)
        animator.animate(cell: cell, at: indexPath, in: tableView)
    }
}

extension ViewController: UITableViewDropDelegate, UITableViewDragDelegate {
    
    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
        return
    }
    
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let dragItem = UIDragItem(itemProvider: NSItemProvider())
        dragItem.localObject = namesArray[indexPath.row]
        return [dragItem]
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let mover = namesArray.remove(at: sourceIndexPath.row)
        namesArray.insert(mover, at: destinationIndexPath.row)
    }
}
