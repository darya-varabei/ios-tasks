//
//  Forecast.swift
//  NetApi
//
//  Created by Darya on 9/27/21.
//

public struct DaysForecast: Decodable {
    public let data: [Datum]
    public let cityName: String

    enum CodingKeys: String, CodingKey {
        case data
        case cityName = "city_name"
    }
}

public struct Datum: Decodable {
   
    public let validDate: String
    public let weather: WeatherCondition
    public let maxTemp: Double
    public let minTemp: Double

    enum CodingKeys: String, CodingKey {
        case validDate = "valid_date"
        case weather
        case maxTemp = "max_temp"
        case minTemp = "min_temp"
    }
}

public struct WeatherCondition: Decodable {
    public let code: Int

    enum CodingKeys: String, CodingKey {
        case code
    }
}
