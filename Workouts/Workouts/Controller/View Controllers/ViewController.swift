//
//  ViewController.swift
//  Workouts
//
//  Created by Дарья Воробей on 1/31/22.
//

import UIKit
import CoreData

class ViewController: UIViewController, SegueHandler {
    
    @IBOutlet private var workoutsCollectionView: UICollectionView!
    @IBOutlet private var emptyCollectionLabel: UILabel!
    
    enum SegueIdentifier: String {
        case workout = "workout"
        case addWorkout = "addWorkout"
    }
    
    private let cellIdentifier = "SessionCollectionViewCell"
    private var managedObjectContext: NSManagedObjectContext!
    private var dataSource: CollectionViewDataSource<ViewController>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        managedObjectContext = SceneDelegate.persistentContainer.viewContext
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupCollectionView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segueIdentifier(for: segue) {
        case .workout:
            guard let viewController = segue.destination as? AddWorkoutViewController else { return }
            guard let workout = dataSource.selectedObject else { return }
            viewController.workout = workout
            viewController.managedObjectContext = managedObjectContext
        case .addWorkout:
            guard let viewController = segue.destination as? AddWorkoutViewController else { return }
            viewController.managedObjectContext = managedObjectContext
        case nil:
            break
        }
    }
    
    private func setupCollectionView() {
        let request = Session.sortedFetchRequest(managedObjectContext: managedObjectContext)
        dataSource = CollectionViewDataSource(collectionView: workoutsCollectionView, cellIdentifier: cellIdentifier, fetchedResultsController: request, delegate: self)
        if request.fetchedObjects?.count != 0 {
            workoutsCollectionView.isHidden = false
            emptyCollectionLabel.isHidden = true
        } else {
            workoutsCollectionView.isHidden = true
            emptyCollectionLabel.isHidden = false
        }
    }
}

extension ViewController: CollectionViewDataSourceDelegate {
    func configure(_ cell: SessionCollectionViewCell, for object: Session) {
        cell.configure(for: object)
    }
}



