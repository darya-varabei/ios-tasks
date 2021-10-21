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
    var recipies = [Recipe]()
    var images: [Any] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.recipeCollection.delegate = self
        self.recipeCollection.dataSource = self
        
        DispatchQueue.global().async {
            self.fetchData()
            DispatchQueue.main.async {
                self.recipeCollection.reloadData()
            }
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
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 190)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (self.recipies.first?.hits.count) ?? 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : RecipeCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "recipeCell", for: indexPath) as! RecipeCollectionViewCell
        let cellData = self.recipies.first?.hits[indexPath.item]
        
        guard let data = cell as? RecipeCollectionViewCell else {
            return cell
        }
    
        data.name.text = cellData?.recipe.label
        data.preparationTime.text = "\(cellData?.recipe.totalTime ?? 20) minutes"
        
        DispatchQueue.global(qos: .background).async {
            if let url = URL(string: cellData?.recipe.image ?? ""){
                DispatchQueue.main.async {
                    data.backgroundImage.loadImage(from: url)
                }
                //images.append(data.backgroundImage.loadImage(from: url))
            }
        }
        
        cell.layer.cornerRadius = 10
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let viewController = storyboard?.instantiateViewController(identifier: "DetailVC") as? DetailViewController {
            viewController.recipeData = recipies.first?.hits[indexPath.item].recipe
            show(viewController, sender: nil)
        }
    }
}

