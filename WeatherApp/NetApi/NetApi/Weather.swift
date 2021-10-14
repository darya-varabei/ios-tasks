//
//  Weather.swift
//  NetApi
//
//  Created by Darya on 9/27/21.
//

import Foundation

public struct Weather: Decodable {
    public let location: Location
    public let current: Current
    public let forecast: Forecast
}

public struct Current: Decodable {
    public let lastUpdated: String
    public let tempC: Double
    public let condition: Condition
    public let windKph: Double

    enum CodingKeys: String, CodingKey {
        case lastUpdated = "last_updated"
        case tempC = "temp_c"
        case condition
        case windKph = "wind_kph"
    }
}

public struct Condition: Decodable {
    public let code: Int
    public let text: String
}

public struct Forecast: Decodable {
    public let forecastday: [Forecastday]
}

public struct Forecastday: Decodable {
    public let date: String
    public let day: Day
    public let hour: [Hour]

    enum CodingKeys: String, CodingKey {
        case date
        case day, hour
    }
}

public struct Day: Decodable {
    public let maxtempC, mintempC: Double
    public let maxwindKph: Double
    public let condition: Condition

    enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        case mintempC = "mintemp_c"
        case maxwindKph = "maxwind_kph"
        case condition
    }
}

public struct Hour: Decodable {
    public let time: String
    public let tempC: Double
    public let condition: Condition
    public let windKph: Double

    enum CodingKeys: String, CodingKey {
        case time
        case tempC = "temp_c"
        case condition
        case windKph = "wind_kph"
    }
}

public struct Location: Decodable {
    public let name: String
    public let localtime: String

    enum CodingKeys: String, CodingKey {
        case name
        case localtime
    }
}

