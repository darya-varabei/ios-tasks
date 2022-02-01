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
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: CurrentExerciseCollectionViewCell = (collectionView.dequeueReusableCell(withReuseIdentifier: Literals.cellIdentifier, for: indexPath) as? CurrentExerciseCollectionViewCell) else { return CurrentExerciseCollectionViewCell() }
        return cell
    }
}
