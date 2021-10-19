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
    override func viewDidLoad() {
        super.viewDidLoad()
        //let req = NetworkRequest()
        let request = NetworkRequest()
        request.fetchData { [weak self] (result: Result<Recipe,NetworkError>) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let recipe):
                print(recipe)
            }
        }
        // Do any additional setup after loading the view.
    }


}

