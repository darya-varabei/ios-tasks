//
//  AddWorkoutViewController.swift
//  Workouts
//
//  Created by Дарья Воробей on 1/31/22.
//

import Foundation
import UIKit
import CoreData

class AddWorkoutViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {
    
    @IBOutlet private var nameTextField: UITextField!
    @IBOutlet private var targetAreasCollection: UICollectionView!
    @IBOutlet private var addWorkoutButton: UIButton!
    @IBOutlet private var coachTextField: UITextField!
    @IBOutlet private var timePicker: UIDatePicker!
    @IBOutlet private var infoTextArea: UITextView!
    @IBOutlet private var errorLabel: UILabel!
    @IBOutlet private var deleteWorkoutButton: UIBarButtonItem!
    
    var managedObjectContext: NSManagedObjectContext!
    var workout: Session?
    private let targetAreasItems = ["Pilates", "Stretching", "Cardio", "Legs strenght", "HIIT", "Crossfit", "Arms&Core", "Full body", "Aerobics", "Kids"]
    private let cellIdentifier = "TargetAreaCollectionViewCell"
    private var selectedWorkoutType = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        fillFields()
        setupCollectionView()
        defineDeletionButtonState()
    }
    
    private func setupCollectionView() {
        targetAreasCollection.delegate = self
        targetAreasCollection.dataSource = self
        targetAreasCollection.register(UINib(nibName: cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
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
            timePicker.date = workout?.time ?? Date()
            selectedWorkoutType = workout?.type ?? ""
        }
        errorLabel.isHidden = true
    }
    
    @IBAction private func saveWorkout(_ sender: Any) {
        if nameTextField.text?.count != 0 && coachTextField.text?.count != 0 && selectedWorkoutType.count != 0 {
            if workout == nil {
                self.managedObjectContext.performChanges {
                    let _ = Session.insert(into: self.managedObjectContext, name: self.nameTextField.text ?? "", time: self.timePicker.date, typeOfClass: self.selectedWorkoutType, info: self.infoTextArea.text, coach: self.coachTextField.text ?? "")
                }
            }
            else {
                let _ = Session.update(into: self.managedObjectContext, object: workout ?? Session() , name: self.nameTextField.text ?? "", time: self.timePicker.date, typeOfClass: self.selectedWorkoutType, info: self.infoTextArea.text, coach: self.coachTextField.text ?? "")
            }
            navigationController?.popViewController(animated: true)
            errorLabel.isHidden = true
        }
        else {
            errorLabel.isHidden = false
        }
    }
    
    @IBAction func deleteWorkout(_ sender: Any) {
        guard let session = workout else { return }
        let _ = Session.delete(session: session)
        navigationController?.popViewController(animated: true)
    }
}

extension AddWorkoutViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return targetAreasItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: TargetAreaCollectionViewCell = (collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? TargetAreaCollectionViewCell) else { return TargetAreaCollectionViewCell() }
        cell.targetText = targetAreasItems[indexPath.item]
        
        if selectedWorkoutType == targetAreasItems[indexPath.item] { cell.isBeingSelected = true }
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
