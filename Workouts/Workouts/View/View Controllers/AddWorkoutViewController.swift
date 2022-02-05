//
//  AddWorkoutViewController.swift
//  Workouts
//
//  Created by Дарья Воробей on 1/31/22.
//

import Foundation
import UIKit
import CoreData

class AddWorkoutViewController: UIViewController, SegueHandler {
    
    @IBOutlet private var nameTextField: UITextField!
    @IBOutlet private var targetAreasCollection: UICollectionView!
    @IBOutlet private var exercisesTableView: UITableView!
    @IBOutlet private var addWorkoutButton: UIButton!
    @IBOutlet private var startWorkoutButton: UIButton!
    @IBOutlet private var deleteWorkoutButton: UIBarButtonItem!
    private let targetAreasItems = ["Legs", "Glutes", "Core", "Back", "Shoulders", "Arms", "Cardio", "Full body", "Chest", "Stretching"]
    var managedObjectContext: NSManagedObjectContext!
    var exercises: [String] = []
    var workout: Session?
    
    enum SegueIdentifier: String {
        case addExercise = "addExercise"
        case updateExercise = "updateExercise"
        case startWorkout = "startWorkout"
    }
    private var selectedRow = 0
    private var dataSource: CollectionViewDataSource<ViewController>!
    private enum Literals {
        static let cellIdentifier = "TargetAreaCollectionViewCell"
        static let tableCellIdentifier = "ExerciseTableViewCell"
        static let addExerciseRow = "Add new exercise"
    }
    private var targetAreas: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exercises = workout?.exercises ?? []
        setupCollectionView()
        setupTableView()
        defineDeletionButtonState()
        fillFields()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segueIdentifier(for: segue) {
        case .updateExercise:
            guard let vc = segue.destination as? UpdateExerciseViewController else { return }
            guard let mood = dataSource.selectedObject?.exercises[selectedRow] else { return }
            vc.exercise = mood
            vc.managedObjectContext = managedObjectContext
        case .addExercise:
            guard let vc = segue.destination as? UpdateExerciseViewController else { return }
            vc.managedObjectContext = managedObjectContext
        case .startWorkout:
            break
        case .none:
            break
        }
    }
    
    func updateExerciseList(at index: IndexPath, exercise: String) {
        
    }
    
    private func setupCollectionView() {
        targetAreasCollection.delegate = self
        targetAreasCollection.dataSource = self
        targetAreasCollection.register(UINib(nibName: Literals.cellIdentifier, bundle: nil), forCellWithReuseIdentifier: Literals.cellIdentifier)
    }
    
    private func setupTableView() {
        exercisesTableView.dataSource = self
        exercisesTableView.delegate = self
    }
    
    private func defineDeletionButtonState() {
        if workout == nil {
            deleteWorkoutButton.isEnabled = false
        }
    }
    
    private func fillFields() {
        if workout != nil {
            nameTextField.text = workout?.name
            for i in workout?.targetAreas ?? [] {
                targetAreas.append(i)
            }
            targetAreasCollection.reloadData()
        }
    }
    
    @IBAction private func saveWorkout(_ sender: Any) {
        let name = nameTextField.text ?? ""
        var totalExercises: [String] = []
        for item in exercises {
            totalExercises.append(item)
        }
        
        if name.count != 0 && exercises.count != 0 {
            self.managedObjectContext.performChanges {
                let _ = Session.insert(into: self.managedObjectContext, name: name, exercises: totalExercises, targetAreas: self.targetAreas)
            }
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func startWorkout(_ sender: Any) {
    }
    
    @IBAction func deleteWorkout(_ sender: Any) {
        guard let session = workout else { return }
        session.managedObjectContext?.performChanges {
            session.managedObjectContext?.delete(session)
        }
        navigationController?.popViewController(animated: true)
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
        return "\(String(describing: exercise.getName)),  \(String(describing: exercise.getSets))x\(String(describing: exercise.getRepeats))"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = Bundle.main.loadNibNamed(Literals.tableCellIdentifier, owner: self, options: nil)?.first as? ExerciseTableViewCell else { return ExerciseTableViewCell() }
        if indexPath.row == exercises.count {
            cell.labelText = Literals.addExerciseRow
        }
        else {
            cell.labelText = exercises[indexPath.row].trimmingCharacters(in: ["*"])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewController = storyboard?.instantiateViewController(identifier: "UpdateExerciseViewController") as? UpdateExerciseViewController {
            _ = viewController.view
            if indexPath.row != exercises.count {
            viewController.exercise = exercises[indexPath.row - 1]
                viewController.action = .update
            }
            else {
                viewController.action = .create
            }
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
