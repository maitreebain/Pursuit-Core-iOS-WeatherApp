//
//  ViewController.swift
//  WeatherApp
//
//  Created by David Rifkin on 10/8/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit
import DataPersistence

class CityWeatherController: UIViewController {

    var cityWeatherView = CityWeatherView()
    
    var dataPersistence: DataPersistence<Image>!
    
    override func loadView() {
        view = cityWeatherView
    }
    
    var weather = [ForecastData]() {
        didSet {
            DispatchQueue.main.async {
                self.cityWeatherView.collectionView.reloadData()
            }
        }
    }
    
    var placeName = ""
    
    var zipCode = String() {
        didSet {
            loadLocation(zipcode: zipCode)
        }
    }
    
    var image = [Image]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGray
        cityWeatherView.zipTextField.delegate = self
        cityWeatherView.collectionView.delegate = self
        cityWeatherView.collectionView.dataSource = self
        cityWeatherView.collectionView.register(UINib(nibName: "WeatherCell", bundle: nil), forCellWithReuseIdentifier: "weatherCell")
        loadLocation(zipcode: "10023")
    }
    
    func loadData(lat: Double, long: Double) {
        WeatherDataAPIClient.getWeather(lat, long) { [weak self] (result) in
            switch result {
            case .failure(let appError):
                print("data error: \(appError)")
            case .success(let weatherData):
                self?.weather = weatherData.daily.data
            }
        }
    }
    
    func loadLocation(zipcode: String) {
        ZipCodeHelper.getLatLongName(fromZipCode: zipcode) { [weak self] (result) in
            
            switch result {
            case .failure(let fetchingError):
                print("fetching error: \(fetchingError)")
            case .success(let coords):
                self?.loadData(lat: coords.lat, long: coords.long)
                print(coords.placeName)
                self?.placeName.append(coords.placeName)
                DispatchQueue.main.async {
                    self?.cityWeatherView.cityLabel.text = coords.placeName
                    self?.loadImages(forName: coords.placeName)
                }
            }
        }
    }
    
    func loadImages(forName: String) {
        ImagesAPIClient.fetchImage(for: forName) { [weak self] (result) in
            
            switch result{
            case .failure(let appError):
                print("error getting image: \(appError)")
            case .success(let imageData):
                self?.image = imageData
            }
        }
    }
    
    
    
}

extension CityWeatherController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let interItemSpacing: CGFloat = 4
        let maxWidth = UIScreen.main.bounds.size.width
        let numberOfItems: CGFloat = 2
        let totalSpacing: CGFloat = numberOfItems * interItemSpacing
        let itemWidth: CGFloat = (maxWidth - totalSpacing) / numberOfItems
        
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
}

extension CityWeatherController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weather.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "weatherCell", for: indexPath) as? WeatherCell else {
            fatalError("could not downcast to WeatherCell")
        }
        let selectedCell = weather[indexPath.row]
        
        cell.configureCell(for: selectedCell)
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let weatherInfo = weather[indexPath.row]
        let detailVC = WeatherDetailViewController()
        detailVC.weather = weatherInfo
        detailVC.image = image[indexPath.row]
        detailVC.navigationItem.title = placeName
        detailVC.dataPersistence = dataPersistence
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
}

extension CityWeatherController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        zipCode = textField.text ?? "10023"
        return true
    }
}

