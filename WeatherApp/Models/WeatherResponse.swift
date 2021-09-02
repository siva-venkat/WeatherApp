//
//  WeatherResponse.swift
//  WeatherApp
//
//  Created by Sivaranjani Venkatesh on 4/8/21.
//  Copyright © 2021 Sivaranjani Venkatesh. All rights reserved.
//

import Foundation


struct WeatherResponse: Codable {
   
    var current: Weather
    var hourly: [Weather]
    var daily:[DailyWeather]
    
    static func empty() -> WeatherResponse {
        return WeatherResponse(current: Weather(), hourly: [Weather](repeating: Weather() ,count: 23 ),daily: [DailyWeather](repeating:DailyWeather(), count:8))
    }
}
