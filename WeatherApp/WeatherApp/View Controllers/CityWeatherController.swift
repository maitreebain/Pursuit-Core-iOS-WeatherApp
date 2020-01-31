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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
    }


}

