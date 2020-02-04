//
//  WeatherDataAPIClient.swift
//  WeatherApp
//
//  Created by Maitree Bain on 1/31/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation
import NetworkHelper

struct WeatherDataAPIClient{
    static func getWeather(_ forLatitude: Double,_ forLongitude: Double, completion: @escaping (Result<WeatherData, AppError>) -> ()) {
        
        let endPointURL = "https://api.darksky.net/forecast/\(Secrets.darkSkyKey)/\(forLatitude),\(forLongitude)"
        
        guard let url = URL(string: endPointURL) else {
            completion(.failure(.badURL(endPointURL)))
            return
        }
        
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            
            switch result{
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let weatherinfo = try JSONDecoder().decode(WeatherData.self, from: data)
                    
                    completion(.success(weatherinfo))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
        
    }
}
