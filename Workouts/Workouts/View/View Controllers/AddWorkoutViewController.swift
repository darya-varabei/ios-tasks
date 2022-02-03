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
    private let targetAreasItems = ["Legs", "Glutes", "Core", "Back", "Shoulders", "Arms", "Cardio", "Full body", "Chest", "Stretching"]
    var managedObjectContext: NSManagedObjectContext!
    var exercises: [Exercise] = []
    
    private enum Literals {
        static let cellIdentifier = "TargetAreaCollectionViewCell"
        static let tableCellIdentifier = "ExerciseTableViewCell"
    }
    private var targetAreas: [String] = []
    
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
        let name = nameTextField.text ?? ""
        let targetAreasString = targetAreas.joined(separator: ", ")
        let exercises = self.exercises
        
        if name.count != 0 && exercises.count != 0 {
            self.managedObjectContext.performChanges {
                let _ = Workout.insert(into: self.managedObjectContext, name: name, exercises: exercises, targetAreas: targetAreasString)
            }
        }
    }
    
    @IBAction private func startWorkout(_ sender: Any) {
    }
}

extension AddWorkoutViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return targetAreasItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: TargetAreaCollectionViewCell = (collectionView.dequeueReusableCell(withReuseIdentifier: Literals.cellIdentifier, for: indexPath) as? TargetAreaCollectionViewCell) else { return TargetAreaCollectionViewCell() }
        cell.targetText = targetAreasItems[indexPath.item]
        
        if targetAreas.contains(targetAreasItems[indexPath.item]) {
            cell.isBeingSelected = true
        }
        else { cell.isBeingSelected = false }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        if !targetAreas.contains(targetAreasItems[indexPath.item]) {
        targetAreas.append(targetAreasItems[indexPath.item])
        }
        else {
            targetAreas.remove(at: targetAreas.firstIndex(of: targetAreasItems[indexPath.item]) ?? -1)
        }
        collectionView.reloadData()
    }
}

extension AddWorkoutViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count + 1
    }
    
    private func formTextForExerciseCell(exercise: Exercise) -> String {
        return "\(exercise.name),  \(exercise.sets)x\(exercise.repeats)"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = Bundle.main.loadNibNamed(Literals.tableCellIdentifier, owner: self, options: nil)?.first as? ExerciseTableViewCell else { return ExerciseTableViewCell() }
        if indexPath.row == exercises.count {
            cell.labelText = "Add new exercise"
        }
        else {
            cell.labelText = formTextForExerciseCell(exercise: exercises[indexPath.row])
        }
        return cell
    }
}
