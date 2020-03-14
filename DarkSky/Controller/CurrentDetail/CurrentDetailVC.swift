//
//  CurrentDetailVC.swift
//  DarkSky
//
//  Created by Ian Shen on 3/10/20.
//  Copyright © 2020 Ian Shen. All rights reserved.
//

import UIKit
import Foundation

class CurrentDetailVC: UIViewController {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var precipIntensityLabel: UILabel!
    @IBOutlet weak var apparentTempLabel: UILabel!
    @IBOutlet weak var dewPointLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var windspeedLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var precipProbLabel: UILabel!
    @IBOutlet weak var uvIndexLabel: UILabel!
    @IBOutlet weak var visibilityLabel: UILabel!
    
    
    var currentWeatherForcast: CurrentWeather?
    var backgroundImage: UIImageView!
    var curTimezone: TimeZone?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let gifURL : String = "https://data.whicdn.com/images/320490783/original.gif"
//        let image = UIImage.gifImageWithURL(gifURL)
        var image = UIImage(named: "default-background")
        let icon = currentWeatherForcast?.icon
        if icon == "clear-day" || icon == "wind" {
            image = UIImage(named: "detailVC-background-1")
        } else if icon == "cloudy" || icon == "partly-cloudy-day" {
            image = UIImage(named: "detailVC-background-2")
        } else if icon == "rain" || icon == "partly-cloudy-night" || icon == "fog" {
            image = UIImage(named: "detailVC-background-3")
        } else if icon == "clear-night" || icon == "sleet" || icon == "snow" {
            image = UIImage(named: "detailVC-background-4")
        }
        self.backgroundImage = UIImageView(image: image)
        self.backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(self.backgroundImage, at: 0)
        
        self.iconImageView.image = UIImage(named: currentWeatherForcast!.icon)
        self.timeLabel.text = Utilities.timeConverter(unixTimestamp: currentWeatherForcast!.time, timeZone: curTimezone!, showHrMin: true)
        self.summaryLabel.text = "Summary: \(currentWeatherForcast!.summary)"
        self.temperatureLabel.text = "Temperature   : \(Double(round(10*currentWeatherForcast!.temperature)/10)) °F"
        self.apparentTempLabel.text = "Apparent Temp: \(Double(round(10*currentWeatherForcast!.apparentTemperature)/10)) °F"
        self.precipProbLabel.text = "Precipitation Probability: \(Int(currentWeatherForcast!.precipProbability*100))%"
        self.precipIntensityLabel.text = "Precipitation Intensity  : \(Int(currentWeatherForcast!.precipIntensity*10000))"
        self.humidityLabel.text = "Humidity:  \(Int(currentWeatherForcast!.humidity*100))%"
        self.pressureLabel.text = "Pressure:  \(Int(currentWeatherForcast!.pressure/10))kPa"
        self.dewPointLabel.text = "Dew Point:  \(Double(round(10*currentWeatherForcast!.dewPoint)/10)) °F"
        self.windspeedLabel.text = "Wind Speed:  \(Double(round(10*currentWeatherForcast!.dewPoint)/10)) mph"
        self.uvIndexLabel.text = "UV Index: \(Int(currentWeatherForcast!.uvIndex))"
        self.visibilityLabel.text = "Visibility: \(Int(currentWeatherForcast!.visibility))"
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        self.backgroundImage.frame = self.view.bounds
    }
}


