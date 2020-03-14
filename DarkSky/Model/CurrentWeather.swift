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

/*
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
 */
