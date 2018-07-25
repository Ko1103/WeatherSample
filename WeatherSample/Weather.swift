//
//  Weather.swift
//  WeatherSample
//
//  Created by 山浦功 on 2018/07/24.
//  Copyright © 2018年 KoYamaura. All rights reserved.
//

import Foundation

struct Forecast: Codable {
    let date: Date
    let imageID: String
    let temp: Float
    let description: String
}

struct Weather: Codable {
    let cityName: String
    let forecasts: [Forecast]
    
    var currentWeather: Forecast {
        return forecast[0]
    }
    
    
}
