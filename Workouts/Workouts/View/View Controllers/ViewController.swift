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
    
    var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: Literals.persistentContainer)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? { return }
        })
        return container
    }()
    
    var managedObjectContext: NSManagedObjectContext!
    
    fileprivate var dataSource: CollectionViewDataSource<ViewController>!
    
    private enum Literals {
        static let cellIdentifier = "SessionCollectionViewCell"
        static let persistentContainer = "Model"
        static let batchSize = 20
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        managedObjectContext = persistentContainer.viewContext
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupCollectionView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segueIdentifier(for: segue) {
        case .workout:
            guard let vc = segue.destination as? AddWorkoutViewController else { return }
            guard let mood = dataSource.selectedObject else { return }
            vc.workout = mood
            vc.managedObjectContext = managedObjectContext
        case .addWorkout:
            guard let vc = segue.destination as? AddWorkoutViewController else { return }
            vc.managedObjectContext = managedObjectContext
        case nil:
            break
        }
    }
    
    private func setupCollectionView() {
        let request = Session.sortedFetchRequest
        request.fetchBatchSize = Literals.batchSize
        let frc = NSFetchedResultsController(fetchRequest: request, managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        dataSource = CollectionViewDataSource(collectionView: workoutsCollectionView, cellIdentifier: Literals.cellIdentifier, fetchedResultsController: frc, delegate: self)
        if frc.fetchedObjects?.count != 0 {
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



