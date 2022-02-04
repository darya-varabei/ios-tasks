//
//  ViewController.swift
//  Workouts
//
//  Created by Дарья Воробей on 1/31/22.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet private var workoutsCollectionView: UICollectionView!
    @IBOutlet private var emptyCollectionLabel: UILabel!
    
    fileprivate var dataSource: CollectionViewDataSource<ViewController>!
    
    private enum SegueIdentifier: String {
        case embedNavigation = "addWorkout"
        case embedCamera = "workout"
    }
    
    var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    var managedObjectContext: NSManagedObjectContext!
    
    private enum Literals {
        static let cellIdentifier = "WorkoutCollectionViewCell"
        static let segueIdentifier = "workout"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        managedObjectContext = persistentContainer.viewContext
        setupCollectionView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupCollectionView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let nc = segue.destination as? AddWorkoutViewController
            else { fatalError("wrong view controller type") }
            nc.managedObjectContext = managedObjectContext
    }
    
    private func setupCollectionView() {
        let request = Session.sortedFetchRequest
        request.fetchBatchSize = 20
        let frc = NSFetchedResultsController(fetchRequest: request, managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        dataSource = CollectionViewDataSource(collectionView: workoutsCollectionView, cellIdentifier: "WorkoutCollectionViewCell", fetchedResultsController: frc, delegate: self)
//        if ((frc.fetchedObjects?.isEmpty) != nil) {
//            workoutsCollectionView.isHidden = true
//            emptyCollectionLabel.isHidden = false
//        } else {
//            workoutsCollectionView.isHidden = false
            emptyCollectionLabel.isHidden = true
//        }
    }

    @IBAction func addNewWorkout(_ sender: Any) {
    }
}

extension ViewController: CollectionViewDataSourceDelegate {
    func configure(_ cell: WorkoutCollectionViewCell, for object: Session) {
        cell.configure(for: object)
    }
}

//extension ViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: UIScreen.main.bounds.width-50, height: 70)
//    }
//}
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//        if let viewController = storyboard?.instantiateViewController(identifier: Literals.segueIdentifier) as? AddWorkoutViewController {
//            _ = viewController.view
//            navigationController?.pushViewController(viewController, animated: true)
//        }
//    }
//}



