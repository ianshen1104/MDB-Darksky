//
//  MainVC-TableView.swift
//  DarkSky
//
//  Created by Ian Shen on 3/10/20.
//  Copyright © 2020 Ian Shen. All rights reserved.
//

import Foundation
import UIKit

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dailyWeatherForcasts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell

        let dailyWeatherObject = dailyWeatherForcasts?[indexPath.row]
        
        cell.dailyTimeLabel.text = Utilities.timeConverter(unixTimestamp: dailyWeatherObject!.time, timeZone: curTimezone!, showHrMin: false)
        cell.dailyTemperatureLabel.text = "\(Double(round(10*dailyWeatherObject!.temperatureLow)/10)) ~ \(Double(round(10*dailyWeatherObject!.temperatureHigh)/10)) °F"
        cell.dailyPrecipProbLabel.text = "\(Int(dailyWeatherObject!.precipProbability*100))%"
        cell.dailyIconImage.image = UIImage(named: dailyWeatherObject!.icon)
        
        let backgroundName = (dailyWeatherObject?.icon ?? "default") + "-background"
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: cell.frame.width, height: cell.frame.height))
        let image = UIImage(named: backgroundName)
        imageView.image = image
        cell.addSubview(imageView)
        cell.sendSubviewToBack(imageView)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        clickedEventId = indexPath.row
//        print( indexPath.row)
//        EventManager.clickedEvent = EventManager.eventList[indexPath.row]
//        segueNum = 1
//        self.performSegue(withIdentifier: "toDetailVC", sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
