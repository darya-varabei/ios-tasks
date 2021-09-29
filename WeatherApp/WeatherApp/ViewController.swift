//
//  ViewController.swift
//  WeatherApp
//
//  Created by Darya on 9/17/21.
//

import UIKit
import NetApi
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var weatherWidget: UIView!
    @IBOutlet private weak var windStrength: UILabel?
    private let tableView = UITableView()
    @IBOutlet private weak var cityName: UILabel?
    @IBOutlet private weak var date: UILabel?
    @IBOutlet private weak var temperature: UILabel?
    @IBOutlet private weak var condition: UILabel?
    @IBOutlet private weak var switchTablesButton: UIButton!
    private var numOfHours = 24
    private var numOfDays = 16
    private var cityTemp: String?
    
    var location: String? 
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private var cities: [FeaturedCity]?
    private var citiesData = [Weather]()
    private var showCurrentDay: Bool = true {
        didSet {
            tableView.reloadData()
            if self.showCurrentDay {
                tableView.register(TableCell.self, forCellReuseIdentifier: "cell1")
            }
            else {
                tableView.register(ForecastCell.self, forCellReuseIdentifier: "cell2")
            }
        }
    }
    
    private var weatherData = [Weather]() {
        didSet {
            DispatchQueue.main.async {
                self.cityName?.text = self.weatherData[0].location.name
                self.date?.text = self.weatherData[0].location.localtime
                self.temperature?.text = "\(self.weatherData[0].current.tempC)°C"
                self.condition?.text = self.weatherData[0].current.condition.text
                self.windStrength?.text = "\(self.weatherData[0].current.windKph) mph"
                self.numOfHours = 0
                self.numOfDays = 0
                self.tableView.delegate = self
                self.tableView.dataSource = self
                self.collectionView.delegate = self
                self.collectionView.dataSource = self
                self.collectionView.reloadData()
                self.tableView.reloadData()
            }
        }
    }
    
    private var forecastData = [Welcome]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.delegate = self
                self.tableView.dataSource = self
                self.numOfHours = 24
                self.numOfDays = 16
                self.tableView.reloadData()
            }
        }
    }
    
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        fetchCities()
        getFeaturedData()
        self.weatherWidget.layer.cornerRadius = 15
        view.addSubview(tableView)
        view.addSubview(collectionView)
        collectionView.backgroundColor = .clear
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 28, bottom: 0, right: 28)
        collectionView.topAnchor.constraint(equalTo:self.weatherWidget.bottomAnchor, constant: 30).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        collectionView.showsHorizontalScrollIndicator = false
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TableCell.self, forCellReuseIdentifier: "cell1")
        tableView.sectionIndexColor = .clear
        tableView.backgroundColor = .clear
        tableView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 50).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 27).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -27).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -94).isActive = true
        tableView.showsVerticalScrollIndicator = false
        
    }
    
    
    func getData() {
        
        var weatherRequest = WeatherRequest(location: self.location ?? "")
        weatherRequest.fetchData { [weak self] (result : Result<[Weather],WeatherError>) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let weather):
                self?.weatherData.append(contentsOf: weather)
            }
        }
        weatherRequest.fetchData { [weak self] (result : Result<[Welcome],WeatherError>) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let weather):
                self?.forecastData.append(contentsOf: weather)
            }
        }
    }
    
    func getFeaturedData() {
        if cities?.count != nil {
            for city in cities! {
                var weatherRequest = WeatherRequest(location: city.cityName ?? "")
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
    
    func fetchCities() {
        
        do {
            self.cities = try context.fetch(FeaturedCity.fetchRequest())
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        } catch {
            print("Cities fetch failed")
        }
    }
    
    @IBAction func switchTables(_ sender: UIButton) {
        if self.switchTablesButton.title(for: .normal) == "16 Days forecast" {
            self.switchTablesButton.setTitle("Day forecast", for: .normal)
            self.showCurrentDay = false
            self.tableView.reloadData()
        }
        else {
            self.switchTablesButton.setTitle("16 Days forecast", for: .normal)
            self.showCurrentDay = true
            self.tableView.reloadData()
        }
    }
}


extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return citiesData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.backgroundColor = UIColor(named: "DarkBackground")
        cell.layer.cornerRadius = 10
        cell.data = self.citiesData[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       // self.location = self.citiesData[indexPath.item].location.name
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if showCurrentDay {
            return self.numOfHours
        }
        else {
            return self.numOfDays
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if showCurrentDay {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! TableCell
            cell.backgroundColor = .clear
            if weatherData.count != 0 {
            cell.data = self.weatherData[0].forecast.forecastday[0].hour[indexPath.row]
            }
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! ForecastCell
            cell.backgroundColor = .clear
            if self.forecastData[0].data.count != 0 {
            cell.data = self.forecastData[0].data[indexPath.row]
            }
            return cell
        }
    }
}

extension Collection where Indices.Iterator.Element == Index {
    subscript (safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
