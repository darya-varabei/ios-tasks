//
//  Request.swift
//  NetApi
//
//  Created by Darya on 9/27/21.
//

import Foundation

public enum WeatherError: Error {
    case noDataAvailable
    case canNotProcessData
}

public struct WeatherRequest {

    let API_KEY = "1bdb39fb15694f4a99d202336211609"
    let API_KEY2 = "0abb6a9569d54895895515951a1a9858"
    var resourceURL: URL
    let forecastURL: URL

   public init(location: String) {
    
    var resurceString = "https://api.weatherapi.com/v1/forecast.json?key=\(API_KEY)&q=\(location)&days=1&aqi=no&alerts=no"
   
    var forecastString = "https://api.weatherbit.io/v2.0/forecast/daily?city=\(location)&key=\(API_KEY2)"
    
    if location == "" {
        resurceString = "https://api.weatherapi.com/v1/forecast.json?key=\(API_KEY)&q=Minsk&days=1&aqi=no&alerts=no"
        forecastString = "https://api.weatherbit.io/v2.0/forecast/daily?city=Minsk&key=\(API_KEY2)"
    }
        guard let resourceURL = URL(string: resurceString) else {fatalError()}
    guard let forecastURL = URL(string: forecastString) else {fatalError()}

        self.resourceURL = resourceURL
    self.forecastURL = forecastURL
    
    }

    public mutating func fetchData<T: Decodable>(completion: @escaping(Result<[T], WeatherError>) -> Void) {
        
        if String(describing: T.self) == "Welcome" {
            self.resourceURL = self.forecastURL
        }
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }

            do {
                let decoder = JSONDecoder()
                let weatherResponse = try decoder.decode(T.self, from: jsonData)
                
                completion(.success([weatherResponse]))
                
            } catch {
                completion(.failure((.canNotProcessData)))
            }
        }
        dataTask.resume()
    }
}

