//
//  WeatherStruct.swift
//  DarkSky
//
//  Created by Ian Shen on 3/5/20.
//  Copyright © 2020 Ian Shen. All rights reserved.
//

import Foundation
import CoreLocation

class DailyWeatherRequest: Decodable {
    let latitude: Double
    let longitude: Double
    let timezone: String
    let daily: Daily
}

class Daily: Decodable {
    let summary: String
    let icon: String
    let data: [DailyWeather]
}

struct DailyWeather: Decodable {
    let time: Int
    let summary: String
    let icon: String
    let precipIntensity: Double
    let precipProbability: Double
    let precipType: String
    let temperatureHigh: Double
    let temperatureHighTime: Int
    let temperatureLow: Double
    let temperatureLowTime: Int
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
