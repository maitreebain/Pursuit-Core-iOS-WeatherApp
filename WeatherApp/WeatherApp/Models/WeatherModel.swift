//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Maitree Bain on 1/31/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation

struct WeatherData: Decodable {
    let latitude: Double
    let longitude: Double
    let timezone: String
    let daily: Daily
}

struct Daily: Decodable {
    let summary: String
    let icon: String
    let data: [ForecastData]
}

struct ForecastData: Decodable {
    let time: Int
    let summary: String
    let icon: String
    let sunrise: Int
    let sunset: Int
    let percipType: String
    let temperatureHigh: Double
    let temperatureLow: Double
    let windSpeed: Double
}
