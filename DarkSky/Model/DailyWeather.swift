//
//  WeatherStruct.swift
//  DarkSky
//
//  Created by Ian Shen on 3/5/20.
//  Copyright © 2020 Ian Shen. All rights reserved.
//

import Foundation
import CoreLocation

class DailyWeather {
    let time: Int
    let summary: String
    let icon: String
    let precipProbability: Double
    let temperatureHigh: Double
    let temperatureLow: Double
    let humidity: Double
    let uvIndex: Int
    
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
    
    static let basePath = "https://api.darksky.net/forecast/9a01e0d4e7142a3bf4aef2504a7236e5/"
    
    static func forecast (location: CLLocationCoordinate2D, completion: @escaping ([DailyWeather]) -> () ){
        
        let url = basePath + "\(location.latitude),\(location.longitude)"
        let request = URLRequest(url: URL(string: url)!)
        
        let task = URLSession.shared.dataTask(with: request) { (data:Data?, response: URLResponse?, error: Error?) in
            
            var forecastArr: [DailyWeather] = []
            if let data = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        if let dailyJson = json["daily"] as? [String:Any] {
                            if let dataJson = json["data"] as? [[String:Any]] {
                                for dataPoint in dataJson {
                                    if let weatherObject = try? DailyWeather(json: dataPoint) {
                                        forecastArr.append(weatherObject)
                                    }
                                }
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
