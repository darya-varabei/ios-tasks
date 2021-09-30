//
//  Weather.swift
//  NetApi
//
//  Created by Darya on 9/27/21.
//

import Foundation

public struct Weather: Codable {
    public var location: Location
    public var current: Current
    public var forecast: Forecast
}

public struct Current: Codable {
    public var lastUpdated: String
    public var tempC: Double
    public var condition: Condition
    public var windKph: Double

    enum CodingKeys: String, CodingKey {
        case lastUpdated = "last_updated"
        case tempC = "temp_c"
        case condition
        case windKph = "wind_kph"
    }
}

public struct Condition: Codable {
    public var code: Int
    public var text: String
}

public struct Forecast: Codable {
    public var forecastday: [Forecastday]
}

public struct Forecastday: Codable {
    public var date: String
    public var day: Day
    public var hour: [Hour]

    enum CodingKeys: String, CodingKey {
        case date
        case day, hour
    }
}

public struct Day: Codable {
    public var maxtempC, mintempC: Double
    public var maxwindKph: Double
    public var condition: Condition

    enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        case mintempC = "mintemp_c"
        case maxwindKph = "maxwind_kph"
        case condition
    }
}

public struct Hour: Codable {
    public var time: String
    public var tempC: Double
    public var condition: Condition
    public var windKph: Double

    enum CodingKeys: String, CodingKey {
        case time
        case tempC = "temp_c"
        case condition
        case windKph = "wind_kph"
    }
}

public struct Location: Codable {
    public var name: String
    public var localtime: String

    enum CodingKeys: String, CodingKey {
        case name
        case localtime
    }
}

