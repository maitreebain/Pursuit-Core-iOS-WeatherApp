//
//  FavortiesViewController.swift
//  WeatherApp
//
//  Created by Maitree Bain on 1/31/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit
import DataPersistence

class FavortiesViewController: UIViewController {

    var dataPersistence: DataPersistence<PictureData>!
    
    //view has collection view
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
    }
    

}
