//
//  NetworkRequest.swift
//  CookBookApi
//
//  Created by Darya on 10/19/21.
//

import Foundation

public enum NetworkError: Error {
    case noDataAvailable
    case canNotProcessData
}

public struct NetworkRequest {
    
    private var resourceString = "https://api.edamam.com/api/recipes/v2?type=public&q=all&app_id=abf55713&app_key=bef4ac0b858657a2f5ef9afa307d863e"
   
    public init() {
    }
    
    public func fetchData<T: Decodable>(completion: @escaping(Result<T, NetworkError>) -> Void) {
        let resourceURL = URL(string: resourceString)
        print(resourceURL)
        let dataTask = URLSession.shared.dataTask(with: resourceURL!) { data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let weatherResponse = try decoder.decode(T.self, from: jsonData)
                
                completion(.success(weatherResponse))
                //print(weatherResponse)
                print("network")
                
            } catch {
                completion(.failure((.canNotProcessData)))
            }
        }
        dataTask.resume()
    }
}

