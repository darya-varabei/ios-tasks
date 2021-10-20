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
    
    var imageBase: UIImage? {
        didSet {
            self.mainImage?.image = self.imageBase
        }
    }
    var recipeData: RecipeClass? {
        didSet {
            DispatchQueue.main.async {
                print(self.recipeData?.label)
//                self.mainImage?.image = UIImage(self.recipeData?.image ?? "")
                self.titleLabel?.text = self.recipeData?.label
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainImage?.image = UIImage(named: self.recipeData?.image ?? "")
        self.titleLabel?.text = self.recipeData?.label
        
        //navigationController?.navigationBar.barTintColor = UIColor(named: .w)
        navigationController?.navigationBar.tintColor = UIColor(named: "BasicYellow")
    }
}
