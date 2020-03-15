//
//  DarkSkyManager.swift
//  DarkSky
//
//  Created by Ian Shen on 3/10/20.
//  Copyright © 2020 Ian Shen. All rights reserved.
//

import Foundation
import CoreLocation

class DarkSkyManager {
    
    static let basePath = "https://api.darksky.net/forecast/9a01e0d4e7142a3bf4aef2504a7236e5/"
    
    static func getCurrentForecast (location: CLLocationCoordinate2D, completion: @escaping (CurrentWeather) -> () ){
        
        let urlStr = basePath + "\(location.latitude),\(location.longitude)"
        guard let url = URL(string: urlStr) else {
            print("In getCurrentForecast: Error creating URL object")
            return
        }
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("In getCurrentForecast: " + String(describing: error))
                return
            }
            guard let request = try? JSONDecoder().decode(CurrentWeatherRequest.self, from: data) else {
                print("In getCurrentForecast: Error parsing fields using JSONDecoder")
                return
            }
            completion(request.currently)
        }
        task.resume()
    }
    
    static func getDailyForecast (location: CLLocationCoordinate2D, completion: @escaping ([DailyWeather]) -> () ){
        
        let urlStr = basePath + "\(location.latitude),\(location.longitude)"
        guard let url = URL(string: urlStr) else {
            print("In getDailyForecast: Error creating URL object")
            return
        }
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("In getDailyForecast: " + String(describing: error))
                return
            }
            guard let request = try? JSONDecoder().decode(DailyWeatherRequest.self, from: data) else {
                print("In getDailyForecast: Error parsing fields using JSONDecoder")
                return
            }
//            for dailyWeather in request.daily.data {
//                CacheManager.storeInDatabase(dailyweather: dailyWeather)
//            }
            completion(request.daily.data)
        }
        task.resume()
    }
}
