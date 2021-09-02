//
//  CityViewModel.swift
//  WeatherApp
//
//  Created by Sivaranjani Venkatesh on 5/8/21.
//  Copyright © 2021 Sivaranjani Venkatesh. All rights reserved.
//

import SwiftUI
import CoreLocation




final class CityViewModel:ObservableObject {
    
    @Published var weather  = WeatherResponse.empty()
    @Published var city:String = "Sydney" {
    didSet  {
        //call get location
        
        getLocation()
    }
    }
    //Create three formatter
    // create date formatter
    private lazy var dateFormatter:DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
        
    }()
    //create day formatter
    private lazy var dayFormatter:DateFormatter =  {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        return formatter
    }()
    //create hour formatter
    private lazy var timeFormatter:DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh a"
        return formatter
    }()
    
    //Create the initializer for get location
    init() {
        //get location
        getLocation()
    }
    //display the date
    var date :String {
        return dateFormatter.string(from:Date(timeIntervalSince1970: TimeInterval(weather.current.dt)))
    }
    //create a weather icon
    var weatherIcon:String{
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].icon
        }
        return "sun.max.fill"
    }
    //dispaly the temperature
    var temperature: String{
        return getTempFor(temp: weather.current.temp)
    }
    var conditions:String{
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].main
        }
        return ""
    
    }
    //get the wind speed value
    var windSpeed:String{
        return String(format: "%0.1f", weather.current.wind_speed)
    }
    //get the humidity value
    var humidity:String{
        return String(format: "%d%%", weather.current.humidity)
    }
    //create the rain chance
    var rainChances:String{
        return String(format: "0.0f%%", weather.current.dew_point)
    }
    //create the helper function for timeformat
    func getTimeFor(timeStamp:Int) ->String {
        return timeFormatter.string(from:Date(timeIntervalSince1970: TimeInterval(timeStamp)))
    }
    //create the helper function for day format
    func getDayFor(timeStamp:Int) -> String {
        return dayFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timeStamp)))
    }
    //create function for temperature
    
    func getTempFor(temp:Double) -> String {
        return String(format: "%0.1f", temp)
    }
    //create the function for location
    private func getLocation(){
        CLGeocoder().geocodeAddressString(city) {(placeMarks,error) in
            if let places = placeMarks, let place = places.first {
                self.getWeather(coord: place.location?.coordinate)
                
            }
        }
        
    }
    
    // let create the network call
    
    private func getWeather(coord: CLLocationCoordinate2D?) {
        if  let coord = coord {
            let urlString = API.getURLFor(lat: coord.latitude, lon: coord.longitude)
              //call the getweather internal function for city
            getWeatherInternal(city: city, for: urlString)
        } else {
            let urlString = API.getURLFor(lat: 33.8688 , lon: 151.2093)
            getWeatherInternal(city: city, for: urlString)

        }
        }
    private func getWeatherInternal(city:String, for urlString:String){
        NetworkManager<WeatherResponse>.fetch(for: URL(string: urlString)!) { (result) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.weather = response
                }
            case .failure(let err):
                print(err)
            }
            
        }
    }
     func getLottieAnimationFor(icon:String) -> String {
        switch icon {
        case "01d":
            return "dayClearSky"
        case "01n":
            return "nightClearSky"
        case "02d":
            return "dayFewClouds"
        case "02n":
            return "nightFewClouds"
        case "03d":
            return "dayScatteredClouds"
        case "03n":
            return "nightScatteredClouds"
        case "04d":
            return "dayBrokenClouds"
        case "04n":
            return "nightBrokenClouds"
        case "09d":
            return "dayShowerRains"
        case "09n":
            return "nightShowerRains"
        case "10d":
            return "dayRain"
        case "10n":
            return "nightRain"
        case "11d":
            return "dayThunderStrom"
        case "11n":
            return "nightThunderStrom"
        case "13d":
            return "daySnow"
        case "13n":
            return "nightSnow"
        case "50d":
            return "dayMist"
        case "50n":
            return "nightMist"
        default:
            return "dayClearSky"
        }
    }
    func getWeatherIconFor(icon:String) -> Image {
        switch icon {
        
        case "01d":
            return Image(systemName: "sun.max.fill") // clear _day_sky
        case "01n":
            return Image(systemName: "moon.max.fill") // clear _night_sky
        case "02d":
            return Image(systemName: "cloud.sun.fill") // few clouds day
        case "02n":
            return Image(systemName: "cloud.moon.fill") // few clouds night
        case "03d":
            return Image(systemName: "cloud.fill") // scattered clouds
        case "03n":
            return Image(systemName: "cloud.fill") // scattered clouds
        case "04d":
            return Image(systemName: "cloud.fill") // broken clouds
        case "04n":
            return Image(systemName: "cloud.fill") // broken clouds
        case "09d":
            return Image(systemName: "cloud.drizzle.fill") // shower rain
        case "09n":
            return Image(systemName: "cloud.drizzle.fill") // shower rain
        case "10d":
            return Image(systemName: "cloud.heavyrain.fill") //  rain day
        case "10n":
            return Image(systemName: "cloud.heavyrain.fill") //  rain night
        case "11d":
            return Image(systemName: "cloud.bolt.fill") //  thunderstorm day
        case "11n":
            return Image(systemName: "cloud.bolt.fill") //  thunderstorm night
        case "13d":
            return Image(systemName: "cloud.snow.fill") //  snow day
        case "13n":
            return Image(systemName: "cloud.snow.fill") //  snow night
        case "50d":
            return Image(systemName: "cloud.fog.fill") //  thunderstorm day
        case "50n":
            return Image(systemName: "cloud.fog.fill") //  thunderstorm day
        default:
            return Image(systemName: "sun.max.fill") // clear _day_sky
        }
        
    }

    
}


