//
//  WeatherTVC-CoreLocation.swift
//  DarkSky
//
//  Created by Ian Shen on 3/6/20.
//  Copyright © 2020 Ian Shen. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

extension WeatherTVC: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            print(status)
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                print("Here")
                if CLLocationManager.isRangingAvailable() {
                    print("In")
                }
            }
        }
    }
}
