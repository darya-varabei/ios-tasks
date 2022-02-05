//
//  UpdateExerciseViewController.swift
//  Workouts
//
//  Created by Дарья Воробей on 2/1/22.
//

import Foundation
import UIKit
import CoreData

class UpdateExerciseViewController: UIViewController {
    
    @IBOutlet private var exerciseNameTextField: UITextField!
    @IBOutlet private var setsTextField: UITextField!
    @IBOutlet private var repeatsTextField: UITextField!
    @IBOutlet private var saveExerciseButton: UIButton!
    
    var managedObjectContext: NSManagedObjectContext!
    var exercise: String?
    var action: ChangeType = .update
    
    override func viewDidLoad() {
        super.viewDidLoad()
        castStringToExercise(exerciseInput: exercise ?? nil)
    }
    
    private func fillFields(exercise: Exercise) {
        exerciseNameTextField.text = exercise.getName()
        setsTextField.text = "\(exercise.getSets())"
        repeatsTextField.text = "\(exercise.getRepeats())"
    }
    
    private func castStringToExercise(exerciseInput: String?) {
        
        guard let input = exerciseInput else { return }
        let subsequence = input.split(separator: "*")
        var exercise: Exercise?
        exercise?.setName(newName: String(subsequence[0]))
        exercise?.setRepeats(newRepeats: Int(subsequence[1]) ?? 0)
        exercise?.setSets(newSets: Int(subsequence[2]) ?? 0)
        guard let item = exercise else { return }
        fillFields(exercise: item)
    }
    
    @IBAction func saveExerciseState(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
