//
//  WeatherCell.swift
//  WeatherApp
//
//  Created by Maitree Bain on 2/4/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class WeatherCell: UICollectionViewCell {
    
    @IBOutlet weak var time: UILabel!
    
    @IBOutlet weak var weatherImage: UIImageView!
    
    @IBOutlet weak var highText: UILabel!
    
    @IBOutlet weak var lowText: UILabel!
    
    func configureCell(for weather: ForecastData) {
        
        time.text = weather.time.convertTime()
        highText.text = "High: \(weather.temperatureHigh)"
        lowText.text = "Low: \(weather.temperatureLow)"
        
        DispatchQueue.main.async {
            self.weatherImage.image = UIImage(named: weather.icon)
        }
    }
}

extension Double {
    func convertDate() -> String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        dateFormatter.timeZone = .current
        let localDate = dateFormatter.string(from: date)
        return localDate
    }
    func convertTime() -> String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium
        dateFormatter.dateFormat = "h:mm a"
        dateFormatter.timeZone = .current
        let localDate = dateFormatter.string(from: date)
        return localDate
    }
}
