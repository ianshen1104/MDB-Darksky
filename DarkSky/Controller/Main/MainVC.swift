//
//  MainViewController.swift
//  DarkSky
//
//  Created by Ian Shen on 3/10/20.
//  Copyright © 2020 Ian Shen. All rights reserved.
//

import UIKit
import CoreLocation

class MainVC: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var currentIconImage: UIImageView!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var currentPrecipProbLabel: UILabel!
    var locationManager: CLLocationManager?
    var currentWeatherForcast: CurrentWeather?
    var dailyWeatherForcasts: [DailyWeather]?
    var curTimezone: TimeZone?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()

        updateWeatherLocation(location: "2400 Durant Ave, Berkeley, CA")
    }

    @IBAction func seeMoreButtonClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "toCurrentDetailVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? CurrentDetailVC {
            destinationVC.currentWeatherForcast = self.currentWeatherForcast
            destinationVC.curTimezone = self.curTimezone
        }
    }
    
    func printCurrentWeather() {
        DispatchQueue.main.async {
            let backgroundName = (self.currentWeatherForcast?.icon ?? "default") + "-background"
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: backgroundName)!)
            self.currentTimeLabel.text = Utilities.timeConverter(unixTimestamp: self.currentWeatherForcast!.time, timeZone: self.curTimezone!, showHrMin: false)
            self.currentIconImage.image = UIImage(named: self.currentWeatherForcast?.icon ?? "default")
            self.currentTemperatureLabel.text = "\(Double(self.currentWeatherForcast?.temperature ?? 0))°F"
            self.currentPrecipProbLabel.text = "\(Int((self.currentWeatherForcast?.precipProbability ?? -1)*100))%"
            self.currentPrecipProbLabel.text = "\(Int((self.currentWeatherForcast?.precipProbability ?? -1)*100))%"
        }
    }
}
