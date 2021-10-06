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
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var featured: UILabel!
    @IBOutlet private weak var tableWeatherView: UITableView!
    
    private var cities = [City]()
    private let manager = FileManagement()
    private var citiesData = [Weather]()
    private var feat: [String]?
    private var weatherData = [Forecastday]()
    private var result: String?
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "custom")
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cities = manager.readData()
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
        
        for city in cities {
            
            if city.isMarked == "1" {
                var weatherRequest = WeatherRequest(location: city.city)
                
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
        
        let cell : CustomCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "custom", for: indexPath) as! CustomCollectionViewCell
        
        cell.layer.cornerRadius = 10
        cell.image.image = UIImage(named: String(self.citiesData[indexPath.item].current.condition.code))
        cell.location.text = self.citiesData[indexPath.item].location.name
        cell.temperature.text = "\(self.citiesData[indexPath.item].current.tempC)°C"
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
        let manager = FileManagement()
        let cell = tableWeatherView.dequeueReusableCell(withIdentifier: "text", for: indexPath) as! TextCell
        
        cell.backgroundColor = UIColor(named: "DarkBackground")
        cell.texts = manager.readData()[indexPath.row].city
        cell.data = manager.readData()
        
        for i in 0..<manager.readData().count {
            
            if manager.citiesAndMarks[i].isMarked == "1" {
                ifFeatured = true
            }
            else {
                ifFeatured = false
            }
        }
        cell.mark = ifFeatured
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let viewController = storyboard?.instantiateViewController(identifier: "LocationVC") as? ViewController {
            viewController.location = cities[indexPath.row].city
            show(viewController, sender: nil)
        }
    }
}
