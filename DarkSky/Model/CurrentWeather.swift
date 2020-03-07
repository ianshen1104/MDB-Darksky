//
//  CurrentWeather.swift
//  DarkSky
//
//  Created by Ian Shen on 3/5/20.
//  Copyright © 2020 Ian Shen. All rights reserved.
//

import Foundation
import CoreLocation

class CurrentWeather {
    let time: Int
    let summary: String
    let icon: String
    let nearestStormDistance: Double
    let precipIntensity: Double
    let precipIntensityError: Double
    let precipProbability: Double
    let precipType: String
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
    
    enum SerializationError: Error {
        case missing(String)
        case invalid(String, Any)
    }
    
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
        guard let nearestStormDistance = json["nearestStormDistance"] as? Double else {
            throw SerializationError.missing("nearestStormDistance missing")
        }
        guard let precipIntensity = json["precipIntensity"] as? Double else {
            throw SerializationError.missing("precipIntensity missing")
        }
        guard let precipIntensityError = json["precipIntensityError"] as? Double else {
            throw SerializationError.missing("precipIntensityError missing")
        }
        guard let precipProbability = json["precipProbability"] as? Double else {
            throw SerializationError.missing("precipProbability missing")
        }
        guard let precipType = json["precipType"] as? String else {
            throw SerializationError.missing("precipType missing")
        }
        guard let temperature = json["temperature"] as? Double else {
            throw SerializationError.missing("temperature missing")
        }
        guard let apparentTemperature = json["apparentTemperature"] as? Double else {
            throw SerializationError.missing("apparentTemperature missing")
        }
        guard let dewPoint = json["dewPoint"] as? Double else {
            throw SerializationError.missing("dewPoint missing")
        }
        guard let humidity = json["humidity"] as? Double else {
            throw SerializationError.missing("humidity missing")
        }
        guard let pressure = json["pressure"] as? Double else {
            throw SerializationError.missing("pressure missing")
        }
        guard let windSpeed = json["windSpeed"] as? Double else {
            throw SerializationError.missing("windSpeed missing")
        }
        guard let windGust = json["windGust"] as? Double else {
            throw SerializationError.missing("windGust missing")
        }
        guard let windBearing = json["windBearing"] as? Int else {
            throw SerializationError.missing("windBearing missing")
        }
        guard let cloudCover = json["cloudCover"] as? Double else {
            throw SerializationError.missing("cloudCover missing")
        }
        guard let uvIndex = json["uvIndex"] as? Int else {
            throw SerializationError.missing("uvIndex missing")
        }
        guard let visibility = json["visibility"] as? Double else {
            throw SerializationError.missing("visibility missing")
        }
        guard let ozone = json["ozone"] as? Double else {
            throw SerializationError.missing("ozone missing")
        }
        
        self.time = time
        self.summary = summary
        self.icon = icon
        self.nearestStormDistance = nearestStormDistance
        self.precipIntensity = precipIntensity
        self.precipIntensityError = precipIntensityError
        self.precipProbability = precipProbability
        self.precipType = precipType
        self.temperature = temperature
        self.apparentTemperature = apparentTemperature
        self.dewPoint = dewPoint
        self.humidity = humidity
        self.pressure = pressure
        self.windSpeed = windSpeed
        self.windGust = windGust
        self.windBearing = windBearing
        self.cloudCover = cloudCover
        self.uvIndex = uvIndex
        self.visibility = visibility
        self.ozone = ozone
    }
    
    static let basePath = "https://api.darksky.net/forecast/9a01e0d4e7142a3bf4aef2504a7236e5/"
    
    static func forecast (location: CLLocationCoordinate2D, completion: @escaping ([CurrentWeather]) -> () ){
        
        let url = basePath + "\(location.latitude),\(location.longitude)"
        let request = URLRequest(url: URL(string: url)!)
        
        let task = URLSession.shared.dataTask(with: request) { (data:Data?, response: URLResponse?, error: Error?) in
            
            var forecastArr: [CurrentWeather] = []
            if let data = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        if let currentJson = json["currently"] as? [String:Any] {
                            if let weatherObject = try? CurrentWeather(json: currentJson) {
                                forecastArr.append(weatherObject)
                            }
                        }
                    }
                } catch {
                    print(error.localizedDescription)
                }
                completion(forecastArr)
            }
        }
    }
}
