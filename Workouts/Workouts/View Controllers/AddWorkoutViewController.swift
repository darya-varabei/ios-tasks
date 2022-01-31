//
//  AddWorkoutViewController.swift
//  Workouts
//
//  Created by Дарья Воробей on 1/31/22.
//

import Foundation
import UIKit

class AddWorkoutViewController: UIViewController {
    @IBOutlet private var nameTextField: UITextField!
    @IBOutlet private var descriptionTextField: UITextField!
    @IBOutlet private var targetAreasCollection: UICollectionView!
    @IBOutlet private var exercisesTableView: UITableView!
    @IBOutlet private var addWorkoutButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
