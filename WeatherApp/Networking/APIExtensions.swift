//
//  APIExtensions.swift
//  WeatherApp
//
//  Created by Sivaranjani Venkatesh on 4/8/21.
//  Copyright © 2021 Sivaranjani Venkatesh. All rights reserved.
//

import Foundation


extension API {
    
    static let baseURLString = "https://api.openweathermap.org/data/2.5"
    
    static func getURLFor(lat:Double, lon:Double) -> String {
        return "\(baseURLString)onecall?lat=\(lat)&lon=\(lon)&exclude=minutely&appId=\(key)&units=imperial"
    }
}
