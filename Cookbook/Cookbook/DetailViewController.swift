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
    
    @IBOutlet private weak var backgroundImage: UIImageView!
    @IBOutlet private weak var mainImage: UIImageView?
    @IBOutlet private weak var btnChoose: UIButton?
    @IBOutlet private weak var pointTitle: UILabel?
    @IBOutlet private weak var titleLabel: UILabel?
    @IBOutlet private weak var recipeDescription: UITextView?
    @IBOutlet private weak var ingredientsList: UITextView!
    @IBOutlet private weak var baseView: UIView!
    @IBOutlet private weak var nutrientsTableView: UITableView!
    
    private var nutrients: [Total]? = []
    private var labels: String = ""
    private var descriptionRecipe: String = ""
    private var nutrientsData: [String] = ["Protein", "Fats", "Carbohydrates", "Calories", "Undefined", "Undefined", "Undefined", "Undefined"]
    private var imageBase = BackgroundImageView() {
        didSet {
            self.backgroundImage?.image = imageBase.image
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
    
    @IBAction func changeInfo(_ sender: Any) {
        if self.btnChoose?.title(for: .normal) == "Nutritional value" {
            self.btnChoose?.setTitle("Ingredients", for: .normal)
            self.pointTitle?.text = "Nutritional value"
            self.nutrientsTableView.reloadData()
            self.nutrientsTableView.isHidden = false
        }
        else {
            self.btnChoose?.setTitle("Nutritional value", for: .normal)
            self.pointTitle?.text = "Ingredients"
            self.nutrientsTableView.reloadData()
            self.nutrientsTableView.isHidden = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupImage()
        self.nutrientsTableView.delegate = self
        self.nutrientsTableView.dataSource = self
        self.nutrientsTableView.isHidden = true
        self.nutrientsTableView.reloadData()
        self.baseView.layer.cornerRadius = 20
        self.baseView.layer.shadowRadius = 5
        self.btnChoose?.layer.cornerRadius = 15
        self.backgroundImage?.image = imageBase.image
        self.titleLabel?.text = self.recipeData?.label
        
        self.fillNutrientDataArray()
        self.setUpNutritionalData()
        
        navigationController?.navigationBar.tintColor = UIColor(named: "BasicYellow")
    }
    
    private func setupImage() {
        if let url = URL(string: recipeData?.image ?? "https://www.edamam.com/web-img/07e/07e8e6991fe5652e0724cbd60241648a.jpg") {
            imageBase.loadImage(from: url)
            self.backgroundImage?.image = imageBase.image
        }
    }
    
    private func fillNutrientDataArray() {
        
        nutrients = recipeData?.totalNutrients.map { $0.1 }
    
        for item in nutrients! {
            
            if item.label == CookBookApi.Label.protein {
                self.nutrientsData[4] = String(item.quantity)
            }
            
            else if item.label == CookBookApi.Label.fat {
                self.nutrientsData[5] = String(item.quantity)
            }
            
            else if item.label == CookBookApi.Label.carbs {
                self.nutrientsData[6] = String(item.quantity)
            }
            
            else if item.label == CookBookApi.Label.energy {
                self.nutrientsData[7] = String(item.quantity)
            }
        }
    }
    
    private func setUpNutritionalData() {
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
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30.0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
            let cell = Bundle.main.loadNibNamed("NutrientTableViewCell", owner: self, options: nil)?.first as! NutrientTableViewCell
        
        cell.nutrientType = self.nutrientsData[indexPath.row]
        cell.nutrientAmount = self.nutrientsData[indexPath.row + 4]
            return cell
    }
}

