//
//  WeatherTVC-SearchBar.swift
//  DarkSky
//
//  Created by Ian Shen on 3/5/20.
//  Copyright © 2020 Ian Shen. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import TimeZoneLocate

extension MainVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let locationString = searchBar.text, !locationString.isEmpty {
            updateWeatherLocation(location: locationString)
        }
    }
    
    func updateWeatherLocation (location: String) {
        CLGeocoder().geocodeAddressString(location) { (placemarks:[CLPlacemark]?, error: Error?) in
            guard error == nil else {
                Utilities.displayAlert(title: "Location Error 1", message: "CLGeocoder returned an error when processing the location you entered", vc: self)
                return
            }
            guard placemarks != nil else {
                Utilities.displayAlert(title: "CLPlacemarks Error", message: "CLGeocoder returned an empty CLPlacemark array", vc: self)
                return
            }
            if let location = placemarks?.first?.location {
                self.curTimezone = placemarks?.first?.timeZone
                DarkSkyManager.getCurrentForecast(location: location.coordinate, completion: { (results: CurrentWeather?) in
                    if let currentWeatherData = results {
                        self.currentWeatherForcast = currentWeatherData
                        self.printCurrentWeather()
                    }
                })
                DarkSkyManager.getDailyForecast(location: location.coordinate, completion: { (results: [DailyWeather]?) in
                    if let dailyWeatherData = results {
                        self.dailyWeatherForcasts = dailyWeatherData
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                })
            } else {
                Utilities.displayAlert(title: "Location Error 2", message: "Location can not be properly assigned", vc: self)
            }
        }
    }
    
    func updateWeatherLocation (location: CLLocation) {
        self.curTimezone = location.timeZone
        DarkSkyManager.getCurrentForecast(location: location.coordinate, completion: { (results: CurrentWeather?) in
            if let currentWeatherData = results {
                self.currentWeatherForcast = currentWeatherData
                self.printCurrentWeather()
            }
        })
        DarkSkyManager.getDailyForecast(location: location.coordinate, completion: { (results: [DailyWeather]?) in
            if let dailyWeatherData = results {
                self.dailyWeatherForcasts = dailyWeatherData
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        })
    }
}
