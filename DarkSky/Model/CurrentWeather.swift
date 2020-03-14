//
//  CurrentWeather.swift
//  DarkSky
//
//  Created by Ian Shen on 3/5/20.
//  Copyright © 2020 Ian Shen. All rights reserved.
//

import Foundation
import CoreLocation

class CurrentWeatherRequest: Decodable {
    let latitude: Double
    let longitude: Double
    let timezone: String
    let currently: CurrentWeather
}

struct CurrentWeather: Decodable {
    
    let time: Int
    let summary: String
    let icon: String
    let nearestStormDistance: Double
    let precipIntensity: Double
    let precipProbability: Double
    let temperature: Double
    let apparentTemperature: Double
    let dewPoint: Double
    let humidity: Double
    let pressure: Double
    let windSpeed: Double
    let windGust: Double
    let windBearing: Int
    let cloudCover: Double
    let uvIndex: Int
    let visibility: Double
    let ozone: Double
    
}
