//
//  Utilities.swift
//  DarkSky
//
//  Created by Ian Shen on 3/5/20.
//  Copyright © 2020 Ian Shen. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    static func displayAlert(title: String, message: String, vc: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(defaultAction)
        vc.present(alert, animated: true, completion: nil)
    }
    
    static func timeConverter(unixTimestamp: Int, timeZone: TimeZone, showHrMin: Bool) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(unixTimestamp))
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = timeZone
        //dateFormatter.locale = NSLocale.current
        if showHrMin {
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        } else {
            dateFormatter.dateFormat = "yyyy-MM-dd"
        }
        let strDate = dateFormatter.string(from: date)
        return strDate
    }
    
}
