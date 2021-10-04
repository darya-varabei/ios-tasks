//
//  ChooseCityViewController.swift
//  WeatherApp
//
//  Created by Дарья Воробей on 9/19/21.
//

import Foundation
import UIKit
import NetApi
import CoreData

class ChooseCityViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var featured: UILabel!
    @IBOutlet weak var tableWeatherView: UITableView!
    
    private let cities = ["Minsk", "Moskou", "London", "Paris", "Riga", "Vilnius", "Warsaw", "Stockholm", "Oslo", "Helsinki", "Copenhagen", "Madrid", "Rome", "Bristol", "Berlin", "Munich", "Stambul", "Antalya"]
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private var featuredCities: [FeaturedCity]?
    private var citiesData = [Weather]()
    private var feat: [String]?
    private var weatherData = [Forecastday]()
    private var result: String?
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
       // cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCities()
        getFeaturedData()
        view.addSubview(collectionView)
        view.addSubview(tableWeatherView)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 28, bottom: 0, right: 28)
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 260).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        collectionView.showsVerticalScrollIndicator = false
        navigationController?.navigationBar.barTintColor = UIColor(named: "BackgroundBasic")
        navigationController?.navigationBar.tintColor = UIColor(named: "BasicYellow")
        
        self.collectionView.layer.cornerRadius = 15
        tableWeatherView.backgroundColor = .clear
        tableWeatherView.translatesAutoresizingMaskIntoConstraints = false
        tableWeatherView.register(TextCell.self, forCellReuseIdentifier: "text")
        self.tableWeatherView.delegate = self
        self.tableWeatherView.dataSource = self
    }
    
    private func getFeaturedData() {
        
        for city in featuredCities! {
            var weatherRequest = WeatherRequest(location: city.cityName ?? "London")
            
            weatherRequest.fetchData { [weak self] (result : Result<[Weather],WeatherError>) in
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let weather):
                    self?.citiesData.append(contentsOf: weather)
                }
            }
        }
    }
    
    private func fetchCities() {
        
        do {
            self.featuredCities = try context.fetch(FeaturedCity.fetchRequest())
            for i in 1...5 {
                self.feat?.append(self.featuredCities![i].cityName ?? " ")
            }
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        catch {
            print("Cities fetch failed")
        }
    }
}

extension ChooseCityViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 150, height: 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return citiesData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
//        cell.backgroundColor = UIColor(named: "DarkBackground")
//        cell.layer.cornerRadius = 15
//        cell.data = self.citiesData[indexPath.item]
        
        let cell = Bundle.main.loadNibNamed("CustomCollectionViewCell", owner: self, options: nil)?.first as! CustomCollectionViewCell
        cell.layer.cornerRadius = 10
        cell.image.image = UIImage(named: String(self.citiesData[indexPath.item].current.condition.code))
        cell.location.text = self.citiesData[indexPath.item].location.name
        cell.condition.text = self.citiesData[indexPath.item].current.condition.text
        return cell
    }
}

extension ChooseCityViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var ifFeatured = false
        let cell = tableWeatherView.dequeueReusableCell(withIdentifier: "text", for: indexPath) as! TextCell
        cell.backgroundColor = UIColor(named: "DarkBackground")
        cell.texts = cities[indexPath.row]
        
        for i in 0..<(featuredCities?.count ?? 1) {
            
            if featuredCities![i].cityName == self.cities[indexPath.row] {
                ifFeatured = true
            }
            else {
                continue
            }
        }
        cell.mark = ifFeatured
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let viewController = storyboard?.instantiateViewController(identifier: "LocationVC") as? ViewController {
            viewController.location = cities[indexPath.row]
            show(viewController, sender: nil)
        }
        
        self.performSegue(withIdentifier: "showCity", sender: self)
    }
}
