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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
