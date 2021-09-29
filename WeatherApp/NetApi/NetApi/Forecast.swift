//
//  Forecast.swift
//  NetApi
//
//  Created by Darya on 9/27/21.
//

public struct Welcome: Codable {
    public let data: [Datum]
    public let cityName: String

    public enum CodingKeys: String, CodingKey {
        case data
        case cityName = "city_name"
    }
}

public struct Datum: Codable {
   
    public let validDate: String
    public let weather: WeatherCondition
    public let maxTemp: Double
    public let minTemp: Double

    public enum CodingKeys: String, CodingKey {
        case validDate = "valid_date"
        case weather
        case maxTemp = "max_temp"
        case minTemp = "min_temp"
    }
}

public struct WeatherCondition: Codable {
    public let code: Int

    public enum CodingKeys: String, CodingKey {
        case code
    }
}
