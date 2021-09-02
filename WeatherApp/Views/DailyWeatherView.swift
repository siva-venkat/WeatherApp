//
//  DailyWeatherView.swift
//  WeatherApp
//
//  Created by Sivaranjani Venkatesh on 8/8/21.
//  Copyright © 2021 Sivaranjani Venkatesh. All rights reserved.
//

import SwiftUI

struct DailyWeatherView: View {
    
    @ObservedObject var cityVM: CityViewModel
    
    var body: some View {
       
            ForEach(cityVM.weather.daily) { weather in
            LazyVStack {

                dailyCell(weather: weather)
            }
        
        }

    }
    private func dailyCell(weather: DailyWeather) -> some View {
        HStack {
            Text(cityVM.getDayFor(timeStamp: weather.dt).uppercased())
                .frame(width: 50)
            Spacer()
            Text("\(cityVM.getTempFor(temp: weather.temp.max)) | \(cityVM.getTempFor(temp: weather.temp.min))℉")
            Spacer()
            
            cityVM.getWeatherIconFor(icon: weather.weather.count > 0 ? weather.weather[0].icon: "sun.max.fill")
        }
        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        .padding(.horizontal, 40)
        .padding(.vertical, 15)
        .background(RoundedRectangle(cornerRadius: 5).fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.4492772222, green: 0.6604323983, blue: 0.9630853534, alpha: 1)), Color(#colorLiteral(red: 0.5010839701, green: 0.4993433356, blue: 0.8290197849, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)))
        .shadow(color: Color.white.opacity(0.1), radius: 2, x: -2, y: -2)
        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 2, y: 2)
        
    }
}

struct DailyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
