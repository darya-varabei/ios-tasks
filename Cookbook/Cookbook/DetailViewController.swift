//
//  DetailViewController.swift
//  Cookbook
//
//  Created by Darya on 10/20/21.
//

import Foundation
import UIKit
import CookBookApi

class DetailViewController: UIViewController {
    
    @IBOutlet private weak var mainImage: UIImageView?
    @IBOutlet private weak var btnChoose: UIButton?
    @IBOutlet private weak var pointTitle: UILabel?
    @IBOutlet private weak var titleLabel: UILabel?
    @IBOutlet private weak var recipeDescription: UITextView?
    @IBOutlet private weak var ingredientsList: UITextView!
    
    var labels: String = ""
    var descriptionRecipe: String = ""
    var imageBase = BackgroundImageView() {
        didSet {
            self.mainImage?.image = imageBase.image
        }
    }
    
    var recipeData: RecipeClass? {
        didSet {
            DispatchQueue.main.async {
                self.titleLabel?.text = self.recipeData?.label
                self.recipeDescription?.text = self.recipeData?.ingredientLines[0]
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupImage()
        
        btnChoose?.layer.cornerRadius = 15
        
        self.mainImage?.image = imageBase.image
        self.titleLabel?.text = self.recipeData?.label
        
        for point in self.recipeData!.ingredientLines {
            self.descriptionRecipe.append(point)
            self.descriptionRecipe.append("\n")
        }
        
        for point in self.recipeData!.healthLabels {
            self.labels.append(point)
            self.labels.append(", ")
        }
        
        self.ingredientsList?.text = descriptionRecipe
        self.recipeDescription?.text = labels
        
        navigationController?.navigationBar.tintColor = UIColor(named: "BasicYellow")
    }
    
    func setupImage() {
        if let url = URL(string: recipeData?.image ?? "https://www.edamam.com/web-img/07e/07e8e6991fe5652e0724cbd60241648a.jpg") {
            imageBase.loadImage(from: url)
            self.mainImage?.image = imageBase.image
        }
    }
}
