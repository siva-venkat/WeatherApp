//
//  CityNameView.swift
//  WeatherApp
//
//  Created by Sivaranjani Venkatesh on 8/8/21.
//  Copyright © 2021 Sivaranjani Venkatesh. All rights reserved.
//

import SwiftUI

struct CityNameView: View {
    var date:String
    var city:String
    var body: some View {
        HStack{
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10) {
                Text(city)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                Text(date)
                
                
            }.foregroundColor(.white)
                
            
        }
    }
}

struct CityNameView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
