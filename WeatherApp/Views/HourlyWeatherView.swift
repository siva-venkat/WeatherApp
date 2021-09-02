//
//  HourlyWeatherView.swift
//  WeatherApp
//
//  Created by Sivaranjani Venkatesh on 8/8/21.
//  Copyright © 2021 Sivaranjani Venkatesh. All rights reserved.
//

import SwiftUI

struct HourlyWeatherView: View {
    @ObservedObject var cityVM:CityViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                
                    ForEach(cityVM.weather.daily) { weather in
                    let icon =  cityVM.getWeatherIconFor(icon: weather.weather.count > 0 ? weather.weather[0].icon : "sun.max.fill")
                    let hour = cityVM.getTimeFor(timeStamp: weather.dt)
                    let temp = cityVM.getTempFor(temp: weather.temp)
                        getHourlyView(hour: hour, image: icon, temp:temp)
                      
                    }
            }
        }
    }
    private func getHourlyView(hour: String, image: Image, temp:String)  -> some View
    {
        VStack(spacing: 20) {
            Text(hour)
            image
                .foregroundColor(.yellow)
            Text(temp)
           
        }
        .foregroundColor(.white)
        .padding()
        .background(RoundedRectangle(cornerRadius: 5).fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.4492772222, green: 0.6604323983, blue: 0.9630853534, alpha: 1)), Color(#colorLiteral(red: 0.5010839701, green: 0.4993433356, blue: 0.8290197849, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)))
        .shadow(color: Color.white.opacity(0.1), radius: 2, x: -2, y: -2)
        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 2, y: 2)
    
        
    }
    
}
struct  HourlyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
    
}
