//
//  WeatherDetailViewController.swift
//  WeatherApp
//
//  Created by Maitree Bain on 1/31/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit
import DataPersistence
import ImageKit

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
    }
    
    private func updateUI() {
        if let weatherInfo = weather {
            self.weather = weatherInfo
            detailCityView.cityLabel.text = "\(weatherInfo.time.convertTime())"
            detailCityView.highLabel.text = "High Temp: \(weatherInfo.temperatureHigh)"
            detailCityView.lowLabel.text = "Low Temp: \(weatherInfo.temperatureLow)"
            detailCityView.sunriseLabel.text = "Sunrise: \(weatherInfo.sunriseTime.convertTime())"
            detailCityView.sunsetLabel.text = "Sunset: \(weatherInfo.sunsetTime.convertTime())"
            detailCityView.windspeedLabel.text = "Windspeed: \(weatherInfo.windSpeed)"
            detailCityView.precipitationLabel.text = "Precipitation Chance: \(weatherInfo.precipProbability)"
            detailCityView.summaryText.text = "\(weatherInfo.summary ?? "No summary available")"
        }
        
        if let imageInfo = image {
            detailCityView.cityImage.getImage(with: imageInfo.largeImageURL) {[weak self] (result) in
                
                switch result {
                case .failure(let appError):
                    print("cannot load image: \(appError)")
                case .success(let image):
                    DispatchQueue.main.async {
                        self?.detailCityView.cityImage.image = image
                    }
                }
            }
        }
    }
    
    private func configureNavBarItem() {
        
    }

}
