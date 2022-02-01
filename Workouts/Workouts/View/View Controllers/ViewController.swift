//
//  ViewController.swift
//  Workouts
//
//  Created by Дарья Воробей on 1/31/22.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet private var workoutsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }

    private func setupCollectionView() {
        workoutsCollectionView.delegate = self
        workoutsCollectionView.dataSource = self
        workoutsCollectionView.register(UINib(nibName: "WorkoutCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "WorkoutCollectionViewCell")
    }

    @IBAction func addNewWorkout(_ sender: Any) {
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: WorkoutCollectionViewCell = (collectionView.dequeueReusableCell(withReuseIdentifier: "WorkoutCollectionViewCell", for: indexPath) as? WorkoutCollectionViewCell) else { return WorkoutCollectionViewCell() }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let viewController = storyboard?.instantiateViewController(identifier: "workout") as? AddWorkoutViewController {
            _ = viewController.view
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
