//
//  WeatherBackgroundImage.swift
//  WeatherSample
//
//  Created by 山浦功 on 2018/07/25.
//  Copyright © 2018年 KoYamaura. All rights reserved.
//

import Foundation
import UIKit

enum WeatherBackgroundImage: String {
    
    case cloudy = "cloudy"
    case sunny = "sunny"
    
    init?(imageID: String) {
        switch imageID {
        case "01d", "02d", "03d", "01n", "02n", "03n":
            self = .sunny
        case "04d", "09d", "10d", "11d", "13d", "50d", "04n", "09n", "10n", "11n", "13n", "50n":
            self = .cloudy
        default:
            return nil
        }
    }
    var image: UIImage {
        return UIImage(named: self.rawValue)!
    }
}
