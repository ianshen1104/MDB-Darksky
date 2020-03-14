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


/*
 init(json: [String:Any]) throws {
     guard let time = json["time"] as? Int else {
         throw SerializationError.missing("time missing")
     }
     guard let summary = json["summary"] as? String else {
         throw SerializationError.missing("summary missing")
     }
     guard let icon = json["icon"] as? String else {
         throw SerializationError.missing("icon missing")
     }
     guard let precipProbability = json["precipProbability"] as? Double else {
         throw SerializationError.missing("precipProbability missing")
     }
     guard let temperatureHigh = json["temperatureHigh"] as? Double else {
         throw SerializationError.missing("temperatureHigh missing")
     }
     guard let temperatureLow = json["temperatureLow"] as? Double else {
         throw SerializationError.missing("temperatureLow missing")
     }
     guard let humidity = json["humidity"] as? Double else {
         throw SerializationError.missing("humidity missing")
     }
     guard let uvIndex = json["uvIndex"] as? Int else {
         throw SerializationError.missing("uvIndex missing")
     }
     
     self.time = time
     self.summary = summary
     self.icon = icon
     self.precipProbability = precipProbability
     self.temperatureHigh = temperatureHigh
     self.temperatureLow = temperatureLow
     self.humidity = humidity
     self.uvIndex = uvIndex
 }
 */
