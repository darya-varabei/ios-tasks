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
    @IBOutlet private weak var cityName: UILabel?
    @IBOutlet private weak var date: UILabel?
    @IBOutlet private weak var temperature: UILabel?
    @IBOutlet private weak var condition: UILabel?
    @IBOutlet private weak var switchTablesButton: UIButton!
    
    public var location: String?
   // private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private var numOfHours = 24
    private var numOfDays = 16
    private let tableView = UITableView()
    private var cities: [City]?
    private var citiesData = [Weather]()
    
    private var showCurrentDay: Bool = true {
        didSet {
            tableView.reloadData()
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
                self.collectionView.reloadData()
                self.tableView.reloadData()
            }
        }
    }
    
    private var forecastData = [DaysForecast]() {
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
        
        getData()
//        fetchCities()
//        getFeaturedData()
        
        self.weatherWidget.layer.cornerRadius = 15
        self.tableView.layer.cornerRadius = 15
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
        tableView.sectionIndexColor = .clear
        tableView.backgroundColor = .clear
        tableView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 50).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 27).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -27).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -94).isActive = true
        tableView.showsVerticalScrollIndicator = false
    }
    
    private func getData() {
        
        var weatherRequest = WeatherRequest(location: self.location ?? "")
        weatherRequest.fetchData { [weak self] (result : Result<[Weather],WeatherError>) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let weather):
                self?.weatherData.append(contentsOf: weather)
            }
        }
        weatherRequest.fetchData { [weak self] (result : Result<[DaysForecast],WeatherError>) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let weather):
                self?.forecastData.append(contentsOf: weather)
            }
        }
    }
    
//    private func getFeaturedData() {
//        if cities?.count != nil {
//            for city in cities! {
//                var weatherRequest = WeatherRequest(location: city.cityName ?? "")
//                weatherRequest.fetchData { [weak self] (result : Result<[Weather],WeatherError>) in
//                    switch result {
//                    case .failure(let error):
//                        print(error)
//                    case .success(let weather):
//                        self?.citiesData.append(contentsOf: weather)
//                    }
//                }
//            }
//        }
//    }
//
//    private func fetchCities() {
//
//        do {
//            //self.cities = try context.fetch(FeaturedCity.fetchRequest())
//
//            DispatchQueue.main.async {
//                self.collectionView.reloadData()
//            }
//        } catch {
//            print("Cities fetch failed")
//        }
//    }
    
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
        
        let cell : CustomCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "custom", for: indexPath) as! CustomCollectionViewCell
        
        cell.layer.cornerRadius = 10
        cell.image.image = UIImage(named: String(self.citiesData[indexPath.item].current.condition.code))
        cell.location.text = self.citiesData[indexPath.item].location.name
        cell.condition.text = self.citiesData[indexPath.item].current.condition.text
        return cell
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if showCurrentDay {
            return self.weatherData[0].forecast.forecastday[0].hour.count
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
            let cell = Bundle.main.loadNibNamed("WeatherTableViewCell", owner: self, options: nil)?.first as! WeatherTableViewCell
            cell.layer.cornerRadius = 10
            let timestr = String(self.weatherData[0].forecast.forecastday[0].hour[indexPath.row].time)
            let index4 = timestr.index(timestr.startIndex, offsetBy: 11)
            cell.picture.image = UIImage(named: String(self.weatherData[0].forecast.forecastday[0].hour[indexPath.row].condition.code))
            cell.time.text = String(self.weatherData[0].forecast.forecastday[0].hour[indexPath.row].time.suffix(from:index4))
            cell.temperature.text = String("\(self.weatherData[0].forecast.forecastday[0].hour[indexPath.row].tempC) °C")
            return cell
        }
        
        else {
            let cell = Bundle.main.loadNibNamed("ForecastTableViewCell", owner: self, options: nil)?.first as! ForecastTableViewCell
            if self.forecastData[0].data.count != 0 {
                cell.layer.cornerRadius = 10
                cell.date.text = self.weatherData[0].forecast.forecastday[0].date
                cell.weather.text = String("\(self.weatherData[0].forecast.forecastday[0].day.mintempC) - \(self.weatherData[0].forecast.forecastday[0].day.maxtempC)°C")
            }
            return cell
        }
    }
}
