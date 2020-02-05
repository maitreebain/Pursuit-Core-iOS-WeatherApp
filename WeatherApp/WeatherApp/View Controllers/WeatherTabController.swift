//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Maitree Bain on 1/31/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit
import DataPersistence

class WeatherTabController: UITabBarController {
    
    private let dataPersistence = DataPersistence<Image>(filename: "images.plist")

    private lazy var cityWeatherController: CityWeatherController = {
        let viewController = CityWeatherController()
        viewController.tabBarItem = UITabBarItem(title: "Weather", image: UIImage(systemName: "cloud.sun.rain"), tag: 0)
        
        viewController.dataPersistence = dataPersistence
        
        return viewController
    }()
    
    private lazy var favoritesController: FavortiesViewController = {
        
        let storyboard = UIStoryboard(name: "Favorites", bundle: nil)
        
        guard let viewController = storyboard.instantiateViewController(identifier: "FavortiesViewController") as? FavortiesViewController else {
            fatalError("could not downcast to FavortiesViewController")
        }
        
        viewController.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "star.fill"), tag: 1)
        
        viewController.dataPersistence = dataPersistence
        
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = [UINavigationController(rootViewController: cityWeatherController), favoritesController]
    }

}
