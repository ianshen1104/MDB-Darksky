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

extension MainVC: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
//            print(status)
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                }
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        self.physicalLocation = CLLocation(latitude: locValue.latitude, longitude: locValue.longitude)
        print("LOCATION UPDATED")
    }
}
