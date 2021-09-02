//
//  ContentView.swift
//  WeatherApp
//
//  Created by Sivaranjani Venkatesh on 7/8/21.
//  Copyright © 2021 Sivaranjani Venkatesh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var cityVM = CityViewModel()
    var body: some View {
        ZStack (alignment: .bottom) {
            VStack(spacing: 0) {
                MenuHeaderView(cityVM: cityVM)
                ScrollView(showsIndicators: false) {
                    CityView(cityVM: cityVM)
                    
                }
            }.padding(.top, 30)
            
        } .background(RoundedRectangle(cornerRadius: 5).fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.4492772222, green: 0.6604323983, blue: 0.9630853534, alpha: 1)), Color(#colorLiteral(red: 0.5010839701, green: 0.4993433356, blue: 0.8290197849, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)))
        .edgesIgnoringSafeArea(.all)
        
            
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
