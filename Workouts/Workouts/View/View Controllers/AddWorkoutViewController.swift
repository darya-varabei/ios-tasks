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
    @IBOutlet private var deleteWorkoutButton: UIBarButtonItem!
    private let targetAreasItems = ["Legs", "Glutes", "Core", "Back", "Shoulders", "Arms", "Cardio", "Full body", "Chest", "Stretching"]
    var managedObjectContext: NSManagedObjectContext!
    var exercises: [Exercise] = []
    var workout: Session?
   
    //fileprivate var dataSource: TableViewDataSource<AddWorkoutViewController>?
    
    private enum Literals {
        static let cellIdentifier = "TargetAreaCollectionViewCell"
        static let tableCellIdentifier = "ExerciseTableViewCell"
    }
    private var targetAreas: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupTableView()
        defineDeletionButtonState()
        fillFields()
    }
    
    private func setupCollectionView() {
        targetAreasCollection.delegate = self
        targetAreasCollection.dataSource = self
        targetAreasCollection.register(UINib(nibName: Literals.cellIdentifier, bundle: nil), forCellWithReuseIdentifier: Literals.cellIdentifier)
        targetAreasCollection.allowsSelection = true
        targetAreasCollection.allowsMultipleSelection = true
    }
    
    fileprivate func setupTableView() {
        let request = Session.sortedFetchRequest
//        exercisesTableView.rowHeight = UITableView.automaticDimension
//        exercisesTableView.estimatedRowHeight = 55
        request.fetchBatchSize = 20
        request.returnsObjectsAsFaults = false
        let frc = NSFetchedResultsController(fetchRequest: request, managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
//        dataSource = TableViewDataSource(tableView: exercisesTableView, cellIdentifier: "MoodCell", fetchedResultsController: frc, delegate: self)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            guard let vc = segue.destination as? UpdateExerciseViewController else { fatalError("Wrong view controller type") }
//        guard let mood = dataSource?.selectedObject else { fatalError("Showing detail, but no selected row?") }
//            vc.mood = mood
//    }

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
            totalExercises.append(item.description())
        }
        
        if name.count != 0 && exercises.count != 0 {
            self.managedObjectContext.performChanges {
                let _ = Session.insert(into: self.managedObjectContext, name: name, exercises: totalExercises, targetAreas: ["Glutes"])
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

//extension AddWorkoutViewController: TableViewDataSourceDelegate {
//    func configure(_ cell: ExerciseTableViewCell, for object: Exercise) {
//        cell.configure(for: object)
//    }
//}


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
            cell.labelText = "Add new exercise"
        }
        else {
            cell.labelText = formTextForExerciseCell(exercise: exercises[indexPath.row])
        }
        return cell
    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
}
