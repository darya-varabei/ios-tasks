//
//  ViewController.swift
//  Cookbook
//
//  Created by Darya on 10/18/21.
//

import UIKit
import CookBookApi

class ViewController: UIViewController {
    
    @IBOutlet private var recipeCollection: UICollectionView!
    private var pulsingCircle: UIView!
    
    var recipies = [Recipe]() {
        didSet {
            DispatchQueue.main.async {
                self.recipeCollection.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.recipeCollection.delegate = self
        self.recipeCollection.dataSource = self
        
        self.pulsingCircle = UIView(frame: CGRect(x: ((UIScreen.main.bounds.width - 20) / 2), y: ((UIScreen.main.bounds.height - 20) / 2), width: 20, height: 20))
        
        self.pulsingCircle.layer.cornerRadius = self.pulsingCircle.frame.height / 2
        self.pulsingCircle.clipsToBounds = true
        
        DispatchQueue.global().async {
            self.fetchData()
        }
        recipeCollection.register(UINib(nibName: "RecipeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "recipeCell")
    }
    
    private func fetchData() {
        let request = NetworkRequest()
        request.fetchData { [weak self] (result: Result<Recipe,NetworkError>) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let recipe):
                self?.recipies.append(recipe)
            }
        }
    }
    
    func pulseAnimation() {
        let pulse = PulseAnimation(numberOfPulses: 4, radius: 150, position: self.view.center)
        pulse.animationDuration = 1.0
        pulse.backgroundColor = UIColor(named: "BasicYellow")?.cgColor
        self.view.layer.insertSublayer(pulse, below: self.view.layer)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    enum CellConstants {
        static let cellWidth = 150
        static let cellHeight = 190
        static let defaultCellsCount = 20
        static let preparationText = "Wait..."
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CellConstants.cellWidth, height: CellConstants.cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (self.recipies.first?.hits.count) ?? CellConstants.defaultCellsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : RecipeCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "recipeCell", for: indexPath) as! RecipeCollectionViewCell
        let cellData = self.recipies.first?.hits[indexPath.item]
        cell.name.text = cellData?.recipe.label
        
        if cellData?.recipe.totalTime != nil {
            cell.preparationTime.text = "\(cellData?.recipe.totalTime ?? 20) minutes"
        }
        else {
            cell.preparationTime.text = CellConstants.preparationText
        }
        
        DispatchQueue.global(qos: .background).async {
            if let url = URL(string: cellData?.recipe.image ?? "") {
                DispatchQueue.main.async {
                    cell.backgroundImage.loadImage(from: url)
                }
            }
        }
        cell.layer.cornerRadius = 10
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.view.addSubview(self.pulsingCircle)
        pulseAnimation()
        delay(1, closure: { [self] in
            if let viewController = storyboard?.instantiateViewController(identifier: "DetailVC") as? DetailViewController {
                viewController.recipeData = recipies.first?.hits[indexPath.item].recipe
                show(viewController, sender: nil)
            }
        })
        self.pulsingCircle.removeFromSuperview()
    }
    
    func delay(_ delay: Double, closure: @escaping ()->()) {
        let timer = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: timer, execute: closure)
    }
}
