//
//  ViewController.swift
//  Cookbook
//
//  Created by Darya on 10/18/21.
//

import UIKit
import CookBookApi

class ViewController: UIViewController {
    
    @IBOutlet weak private var recipeCollection: UICollectionView!
    private var recipies = Recipe()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.recipeCollection.delegate = self
        self.recipeCollection.dataSource = self
        recipeCollection.register(UINib(nibName: "RecipeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "recipeCell")
    }
    
    func fetchData() {
        let request = NetworkRequest()
        request.fetchData { [weak self] (result: Result<Recipe,NetworkError>) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let recipe):
                recipies = recipe
            }
        }
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 190)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : RecipeCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "recipeCell", for: indexPath) as! RecipeCollectionViewCell
        let cellData = recipies.hits[indexPath.item]
        
        guard let data = cell as? RecipeCollectionViewCell else {
            return cell
        }
        if let url = URL(string: cellData.recipe.image){
            data.backgroundImage.loadImage(from: url)
        }
        
        cell.layer.cornerRadius = 10
        return cell
    }
}

