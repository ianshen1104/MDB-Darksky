//
//  CacheManager.swift
//  DarkSky
//
//  Created by Ian Shen on 3/14/20.
//  Copyright © 2020 Ian Shen. All rights reserved.
//

import Foundation
import Firebase

class CacheManager {
    
    static let db = Database.database().reference()
    
    static func storeInDatabase(dailyweather: DailyWeather){
        let eventsNode = db.child("DailyWeather")
        let eventNode = eventsNode.child("\(Int(dailyweather.time))")
        eventNode.updateChildValues(["summary": dailyweather.summary, "icon": dailyweather.icon,"temperatureHigh": dailyweather.temperatureHigh, "temperatureLow": dailyweather.temperatureLow, "precipProbability": dailyweather.precipProbability])
    }
}
