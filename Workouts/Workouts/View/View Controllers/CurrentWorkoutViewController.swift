//
//  CurrentWorkoutViewController.swift
//  Workouts
//
//  Created by Дарья Воробей on 2/1/22.
//

import Foundation
import UIKit

class CurrentWorkoutViewController: UIViewController {
    
    @IBOutlet private var workoutCollectionView: UICollectionView!
    @IBOutlet private var completeWorkoutButton: UIButton!
    var exercises: [Exercise]?
    
    private enum Literals {
        static let cellIdentifier = "CurrentExerciseCollectionViewCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setupCollectionView() {
        workoutCollectionView.dataSource = self
        workoutCollectionView.delegate = self
        workoutCollectionView.register(UINib(nibName: Literals.cellIdentifier, bundle: nil), forCellWithReuseIdentifier: Literals.cellIdentifier)
    }
}

extension CurrentWorkoutViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return exercises?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: CurrentExerciseCollectionViewCell = (collectionView.dequeueReusableCell(withReuseIdentifier: Literals.cellIdentifier, for: indexPath) as? CurrentExerciseCollectionViewCell) else { return CurrentExerciseCollectionViewCell() }
        cell.getData(name: exercises?[indexPath.item].getName() ?? "", repeats:  exercises?[indexPath.item].getRepeats() ?? 1, sets:  exercises?[indexPath.item].getSets() ?? 1)
        return cell
    }
}
