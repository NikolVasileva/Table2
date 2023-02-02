//
//  Weather.swift
//  HW8
//
//  Created by Nikol Vasileva on 22.01.23.
//

import Foundation


struct CurrentWeather: Codable {
    var temperature: Double
    var time: String
    var weathercode: Double
    var winddirection: Double
    var windspeed: Double
}

struct Weather: Codable {
    var elevation: Double
    var latitude: Double
    var longitude: Double
    var timezone: String
    var timezone_abbreviation: String
    var utc_offset_seconds: Int
    var generationtime_ms: Double
    var current_weather: CurrentWeather
}
