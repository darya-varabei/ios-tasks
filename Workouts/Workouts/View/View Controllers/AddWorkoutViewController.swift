//
//  AddWorkoutViewController.swift
//  Workouts
//
//  Created by Дарья Воробей on 1/31/22.
//

import Foundation
import UIKit
import CoreData

class AddWorkoutViewController: UIViewController {
    
    @IBOutlet private var nameTextField: UITextField!
    @IBOutlet private var targetAreasCollection: UICollectionView!
    @IBOutlet private var exercisesTableView: UITableView!
    @IBOutlet private var addWorkoutButton: UIButton!
    @IBOutlet private var startWorkoutButton: UIButton!
    var managedObjectContext: NSManagedObjectContext!
    private enum Literals {
        static let cellIdentifier = "TargetAreaCollectionViewCell"
        static let tableCellIdentifier = "ExerciseTableViewCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupTableView()
    }
    
    private func setupCollectionView() {
        targetAreasCollection.delegate = self
        targetAreasCollection.dataSource = self
        targetAreasCollection.register(UINib(nibName: Literals.cellIdentifier, bundle: nil), forCellWithReuseIdentifier: Literals.cellIdentifier)
        targetAreasCollection.allowsSelection = true
        targetAreasCollection.allowsMultipleSelection = true
    }
    
    private func setupTableView() {
        exercisesTableView.delegate = self
        exercisesTableView.dataSource = self
    }
    
    @IBAction private func saveWorkout(_ sender: Any) {
    }
    
    @IBAction private func startWorkout(_ sender: Any) {
    }
}

extension AddWorkoutViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: TargetAreaCollectionViewCell = (collectionView.dequeueReusableCell(withReuseIdentifier: Literals.cellIdentifier, for: indexPath) as? TargetAreaCollectionViewCell) else { return TargetAreaCollectionViewCell() }
        return cell
    }
    
}

extension AddWorkoutViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = Bundle.main.loadNibNamed(Literals.tableCellIdentifier, owner: self, options: nil)?.first as? ExerciseTableViewCell else { return ExerciseTableViewCell() }
        return cell
    }
}
