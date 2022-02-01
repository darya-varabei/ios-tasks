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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setupCollectionView() {
        workoutCollectionView.dataSource = self
        workoutCollectionView.delegate = self
        workoutCollectionView.register(UINib(nibName: "CurrentExerciseCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CurrentExerciseCollectionViewCell")
    }
}

extension CurrentWorkoutViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: CurrentExerciseCollectionViewCell = (collectionView.dequeueReusableCell(withReuseIdentifier: "CurrentExerciseCollectionViewCell", for: indexPath) as? CurrentExerciseCollectionViewCell) else { return CurrentExerciseCollectionViewCell() }
        return cell
    }
}
