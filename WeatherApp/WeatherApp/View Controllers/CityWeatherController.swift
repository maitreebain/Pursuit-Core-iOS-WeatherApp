//
//  ViewController.swift
//  WeatherApp
//
//  Created by David Rifkin on 10/8/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class CityWeatherController: UIViewController {

    var cityWeatherView = CityWeatherView()
    
    override func loadView() {
        view = cityWeatherView
    }
    
    var weather = [ForecastData]() {
        didSet {
            self.cityWeatherView.collectionView.reloadData()
        }
    }
    
    var zipCode: String? {
        didSet {
            loadLocation(zipcode: zipCode ?? "10023")
        }
    }
    
    var image = [PictureData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
        cityWeatherView.zipTextField.delegate = self
        
    }
    
    func loadData(lat: Double, long: Double) {
        WeatherDataAPIClient.getWeather(lat, long) { (result) in
            
            switch result {
            case .failure(let appError):
                print("data error: \(appError)")
            case .success(let weatherData):
                self.weather = weatherData.daily.data
                
            }
        }
    }
    
    func loadLocation(zipcode: String) {
        ZipCodeHelper.getLatLong(fromZipCode: zipcode) { (result) in
            
            switch result {
            case .failure(let fetchingError):
                print("fetching error: \(fetchingError)")
            case .success(let coords):
                self.loadData(lat: coords.lat, long: coords.long)
                DispatchQueue.main.async {
                    self.cityWeatherView.cityLabel.text = coords.placeName
                    self.loadImages(forName: coords.placeName)
                }
            }
        }
    }
    
    func loadImages(forName: String) {
        ImagesAPIClient.fetchImage(for: forName) { (result) in
            
            switch result{
            case .failure(let appError):
                print("error getting image: \(appError)")
            case .success(let imageData):
                self.image = imageData
            }
        }
    }

}

extension CityWeatherController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        zipCode = textField.text
        return true
    }
}

