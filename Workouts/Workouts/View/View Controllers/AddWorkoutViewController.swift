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
    @IBOutlet private var addWorkoutButton: UIButton!
    @IBOutlet private var startWorkoutButton: UIButton!
    @IBOutlet private var coachTextField: UITextField!
    @IBOutlet private var timePicker: UIDatePicker!
    @IBOutlet private var infoTextArea: UITextView!
    @IBOutlet private var deleteWorkoutButton: UIBarButtonItem!
    private let targetAreasItems = ["Pilates", "Stretching", "Cardio", "Legs strenght", "HIIT", "Crossfit", "Arms&Core", "Full body", "Aerobics", "Kids"]
    var managedObjectContext: NSManagedObjectContext!
    var workout: Session?
    
    enum SegueIdentifier: String {
        case addExercise = "addExercise"
        case updateExercise = "updateExercise"
        case startWorkout = "startWorkout"
    }
    private var selectedWorkoutType = ""
    private var dataSource: CollectionViewDataSource<ViewController>!
    private enum Literals {
        static let cellIdentifier = "TargetAreaCollectionViewCell"
        static let tableCellIdentifier = "ExerciseTableViewCell"
        static let addExerciseRow = "Add new exercise"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillFields()
        setupCollectionView()
        defineDeletionButtonState()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segueIdentifier(for: segue) {
        case .updateExercise:
            guard let vc = segue.destination as? UpdateExerciseViewController else { return }
//            guard let mood = dataSource.selectedObject?.exercises[selectedRow] else { return }
           // vc.exercise = mood
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
    
    private func setupCollectionView() {
        targetAreasCollection.delegate = self
        targetAreasCollection.dataSource = self
        targetAreasCollection.register(UINib(nibName: Literals.cellIdentifier, bundle: nil), forCellWithReuseIdentifier: Literals.cellIdentifier)
    }
    
    private func defineDeletionButtonState() {
        if workout == nil {
            deleteWorkoutButton.isEnabled = false
        }
    }
    
    private func fillFields() {
        if workout != nil {
            nameTextField.text = workout?.name
            coachTextField.text = workout?.coach
            infoTextArea.text = workout?.info
            timePicker.date = (workout?.time)!
            selectedWorkoutType = workout?.type ?? ""
        }
    }
    
    @IBAction private func saveWorkout(_ sender: Any) {
        let name = nameTextField.text ?? ""

        //if name.count != 0 && exercises.count != 0 {
            self.managedObjectContext.performChanges {
                let _ = Session.insert(into: self.managedObjectContext, name: name, time: self.timePicker.date, typeOfClass: self.selectedWorkoutType, info: self.infoTextArea.text, coach: self.coachTextField.text ?? "")
            }
       // }
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
        
        if selectedWorkoutType == targetAreasItems[indexPath.item] {
            cell.isBeingSelected = true
        }
        else { cell.isBeingSelected = false }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if selectedWorkoutType != targetAreasItems[indexPath.item] {
            selectedWorkoutType = targetAreasItems[indexPath.item]
        }
        collectionView.reloadData()
    }
}
