//
//  WeatherButton.swift
//  weather-app
//
//  Created by Eirik Andresen on 16/09/2024.
//
import SwiftUI

struct WeatherButton<Foreground: ShapeStyle, Background: ShapeStyle>: View {
    
    var title: String
    var textColor: Foreground
    var backgroundColor: Background
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .foregroundStyle(textColor) // Using generic Foreground
            .background(backgroundColor) // Using generic Background
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}
