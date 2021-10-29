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
    
    @IBOutlet private var backgroundImage: UIImageView!
    @IBOutlet private var mainImage: UIImageView?
    @IBOutlet private var btnChoose: UIButton?
    @IBOutlet private var pointTitle: UILabel?
    @IBOutlet private var titleLabel: UILabel?
    @IBOutlet private var recipeDescription: UITextView?
    @IBOutlet private var ingredientsList: UITextView!
    @IBOutlet private var baseView: UIView!
    @IBOutlet private var nutrientsTableView: UITableView!
    
    private var nutrients: [Total]? = []
    private var labels: String = ""
    private var descriptionRecipe: String = ""
    private var nutrientsData: [String] = ["Protein", "Fats", "Carbohydrates", "Calories"]
    
    var recipeData: RecipeClass? {
        didSet {
            DispatchQueue.main.async {
                self.titleLabel?.text = self.recipeData?.label
                self.recipeDescription?.text = self.recipeData?.ingredientLines[0]
            }
        }
    }

    @IBAction func changeInfo(_ sender: Any) {
        if self.btnChoose?.tag == 1 {
            self.btnChoose?.setTitle("Ingredients", for: .normal)
            self.pointTitle?.text = "Nutritional value"
            self.btnChoose?.tag = 2
            self.nutrientsTableView.reloadData()
            self.nutrientsTableView.isHidden = false
        }
        else {
            self.btnChoose?.setTitle("Nutritional value", for: .normal)
            self.pointTitle?.text = "Ingredients"
            self.btnChoose?.tag = 1
            self.nutrientsTableView.isHidden = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupImage()
        setShadow()
        self.nutrientsTableView.delegate = self
        self.nutrientsTableView.dataSource = self
        self.nutrientsTableView.isHidden = true
        self.nutrientsTableView.reloadData()
        self.btnChoose?.layer.cornerRadius = 15
        self.titleLabel?.text = self.recipeData?.label
        self.fillNutrientDataArray()
        self.setUpNutritionalData()
        
        navigationController?.navigationBar.tintColor = UIColor(named: "BasicYellow")
    }
    
    private func setupImage() {
        self.backgroundImage.imageFromUrl(urlString: self.recipeData?.image ?? "https://www.edamam.com/web-img/07e/07e8e6991fe5652e0724cbd60241648a.jpg")
    }
    
    private func fillNutrientDataArray() {
        
        nutrients = recipeData?.totalNutrients.map { $0.1 }
        
        let array: [Total] = self.nutrients ?? []

        self.nutrientsData.append(contentsOf: array.filter( {$0.label == "Protein" }).map({ return String($0.quantity) }))

        self.nutrientsData.append(contentsOf: array.filter( {$0.label == "Fat"}).map({ return String($0.quantity) }))

        self.nutrientsData.append(contentsOf: array.filter( {$0.label == "Carbs" }).map({ return String($0.quantity) }))

        self.nutrientsData.append(contentsOf: array.filter( {$0.label == "Energy" }).map({ return String($0.quantity) }))
//
//        for item in array {
//
//            if item.label == CookBookApi.Label.protein {
//                self.nutrientsData[4] = String(item.quantity)
//            }
//
//            else if item.label == CookBookApi.Label.fat {
//                self.nutrientsData[5] = String(item.quantity)
//            }
//
//            else if item.label == CookBookApi.Label.carbs {
//                self.nutrientsData[6] = String(item.quantity)
//            }
//
//            else if item.label == CookBookApi.Label.energy {
//                self.nutrientsData[7] = String(item.quantity)
//            }
//        }
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
    
    private func setShadow() {
        
        self.baseView.layer.cornerRadius = 20
        self.baseView.layer.shadowRadius = 5
        self.baseView.layer.shadowColor = UIColor.gray.cgColor
        self.baseView.layer.shadowOpacity = 0.4
        self.baseView.layer.shadowRadius = 1
    }
}

extension UIImageView {
    public func imageFromUrl(urlString: String) {
        if let url = NSURL(string: urlString) {
            let request = NSURLRequest(url: url as URL)
            let task = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
                DispatchQueue.main.async {
                self.image = UIImage(data: data! as Data)
                }
            }
            task.resume()
        }
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    enum TableConstants {
        static let rowCount = 4
        static let rowHeight = 30.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableConstants.rowCount
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(TableConstants.rowHeight)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed("NutrientTableViewCell", owner: self, options: nil)?.first as? NutrientTableViewCell
        cell?.nutrientType = self.nutrientsData[indexPath.row]
        cell?.nutrientAmount = self.nutrientsData[indexPath.row + 4]
        return cell!
    }
}

