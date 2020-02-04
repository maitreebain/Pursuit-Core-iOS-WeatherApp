//
//  ImagesAPIClilent.swift
//  WeatherApp
//
//  Created by Maitree Bain on 2/4/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation
import NetworkHelper

struct ImagesAPIClient {
    static func fetchImage(for imageName: String, completion: @escaping (Result<[Image], AppError>) -> ()) {
        let imageName = imageName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let endpointString = "https://pixabay.com/api/?key=\(Secrets.pixabayKey)&q=\(imageName)&image_type=photo&pretty=true"
        
        guard let url = URL(string: endpointString) else {
            completion(.failure(.badURL(endpointString)))
            return
        }
        
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do{
                    let imagesData = try JSONDecoder().decode(PictureData.self, from: data)
                    
                    let image = imagesData.hits
                    
                    completion(.success(image))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
                
            }
        }
    }
    
    
}
