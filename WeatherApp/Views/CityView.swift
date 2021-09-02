//
//  CityView.swift
//  WeatherApp
//
//  Created by Sivaranjani Venkatesh on 8/8/21.
//  Copyright © 2021 Sivaranjani Venkatesh. All rights reserved.
//

import SwiftUI


struct CityView: View {
    
    @ObservedObject var cityVM:CityViewModel

    var body: some View {

        VStack {
            CityNameView(date: cityVM.date, city: cityVM.city)
                .shadow(radius: 0)
            TodayWeatherView(cityVM: cityVM)
                .padding()
            HourlyWeatherView(cityVM: cityVM)
            
        }.padding(.bottom , 30)
        
    }
}

struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
