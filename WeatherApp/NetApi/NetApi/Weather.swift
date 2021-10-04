//
//  Weather.swift
//  NetApi
//
//  Created by Darya on 9/27/21.
//

import Foundation

public struct Weather: Decodable {
    public var location: Location
    public var current: Current
    public var forecast: Forecast
}

public struct Current: Decodable {
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

public struct Condition: Decodable {
    public var code: Int
    public var text: String
}

public struct Forecast: Decodable {
    public var forecastday: [Forecastday]
}

public struct Forecastday: Decodable {
    public var date: String
    public var day: Day
    public var hour: [Hour]

    enum CodingKeys: String, CodingKey {
        case date
        case day, hour
    }
}

public struct Day: Decodable {
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

public struct Hour: Decodable {
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

public struct Location: Decodable {
    public var name: String
    public var localtime: String

    enum CodingKeys: String, CodingKey {
        case name
        case localtime
    }
}

