//
//  FavoriteCell.swift
//  WeatherApp
//
//  Created by Maitree Bain on 2/5/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class FavoriteCell: UITableViewCell {
    
    @IBOutlet weak var favImage: UIImageView!
    
    public func configureCell(_ image: Image) {
        favImage.getImage(with: image.largeImageURL) { [weak self] (result) in
            
            switch result {
            case .failure(let appError):
                print("could not get image for cell: \(appError)")
            case .success(let image):
                self?.favImage.image = image
            }
        }
    }
}
