//
//  ContentView.swift
//  weather-app
//
//  Created by Eirik Andresen on 15/09/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                
                MainWeatherView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",           temperature: isNight ? 10 : 24)
                
                HStack(spacing: 20) {
                    WeatherDayView(
                        dayOfWeek: "TUE", imageName: "cloud.sun.fill", temerature: 24)
                    WeatherDayView(
                        dayOfWeek: "WED", imageName: "sun.max.fill", temerature: 27)
                    WeatherDayView(
                        dayOfWeek: "THU", imageName: "wind.snow", temerature: 12)
                    WeatherDayView(
                        dayOfWeek: "FRI", imageName: "sunset.fill", temerature: 19)
                    WeatherDayView(
                        dayOfWeek: "SAT", imageName: "snow", temerature: -2)
                    
                }
                
                Spacer()
                
                Button() {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "change day time",
                                textColor: .white,
                                backgroundColor: .mint)
                }
                
                Spacer()
            }
            
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temerature: Int
    
    var body: some View {
        VStack(spacing: 4) {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(.white)
            
            Image(systemName: imageName)
                .symbolRenderingMode(.palette)
                .resizable()
                .foregroundStyle(.mint, .orange, .green)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temerature)˚")
                .font(.system(size: 28, weight: .medium))
                .foregroundStyle(.white)
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool

    var body: some View {
 //       LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
 //                      startPoint: .topTrailing,
 //                      endPoint: .bottomTrailing)
//        .ignoresSafeArea()
        
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(.white)
            .padding()
    }
}

struct MainWeatherView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)˚C")
                .font(.system(size: 70, weight: .medium))
                .foregroundStyle(.white)
        }
        .padding(.bottom, 40)
    }
}
