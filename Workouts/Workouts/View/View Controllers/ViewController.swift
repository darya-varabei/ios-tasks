//
//  ViewController.swift
//  Workouts
//
//  Created by Дарья Воробей on 1/31/22.
//

import UIKit
import CoreData

class ViewController: UIViewController{

    @IBOutlet private var workoutsCollectionView: UICollectionView!
    @IBOutlet private var emptyCollectionLabel: UILabel!
    
    var managedObjectContext: NSManagedObjectContext!
    
    private enum Literals {
        static let cellIdentifier = "WorkoutCollectionViewCell"
        static let segueIdentifier = "workout"
    }
    
    private var workoutsArray: [String] = [] {
       didSet {
          if workoutsArray.count > 0 {
            workoutsCollectionView.isHidden = true
            emptyCollectionLabel.isHidden = false
          } else {
            workoutsCollectionView.isHidden = false
            emptyCollectionLabel.isHidden = true
          }
       }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }

    private func setupCollectionView() {
        workoutsCollectionView.delegate = self
        workoutsCollectionView.dataSource = self
        workoutsCollectionView.register(UINib(nibName: Literals.cellIdentifier, bundle: nil), forCellWithReuseIdentifier: Literals.cellIdentifier)
    }

    @IBAction func addNewWorkout(_ sender: Any) {
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: WorkoutCollectionViewCell = (collectionView.dequeueReusableCell(withReuseIdentifier: Literals.cellIdentifier, for: indexPath) as? WorkoutCollectionViewCell) else { return WorkoutCollectionViewCell() }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let viewController = storyboard?.instantiateViewController(identifier: Literals.segueIdentifier) as? AddWorkoutViewController {
            _ = viewController.view
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
