//
//  WeatherDetailViewController.swift
//  WeatherApp
//
//  Created by Maitree Bain on 1/31/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit
import DataPersistence

class WeatherDetailViewController: UIViewController {
    
    private let detailCityView = DetailWeatherView()
    
    public var weather: ForecastData?
    public var image: Image?
    
    var dataPersistence: DataPersistence<PictureData>!
    
    override func loadView() {
        view = detailCityView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        updateUI()
//        view.backgroundColor = .purple
    }
    
    private func updateUI() {
        if let weatherInfo = weather {
            self.weather = weatherInfo
            detailCityView.cityLabel.text = "\(weatherInfo.time)"
        }
    }

}
