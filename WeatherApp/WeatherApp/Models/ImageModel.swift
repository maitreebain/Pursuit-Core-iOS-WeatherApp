//
//  ImageModel.swift
//  WeatherApp
//
//  Created by Maitree Bain on 1/31/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation

struct PictureData: Codable & Equatable {
    let hits: [Image]
}

struct Image: Codable & Equatable {
    let largeImageURL: String
}

