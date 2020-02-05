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

    @IBOutlet weak var faveTableView: UITableView!
    
    var dataPersistence: DataPersistence<Image>!
    
    var imageInfo = [Image]() {
        didSet{
            DispatchQueue.main.async {
                self.faveTableView.reloadData()
            }
        }
    }
    
    //view has collection view
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        faveTableView.delegate = self
        faveTableView.dataSource = self
        loadData()

    }
    
    private func loadData() {
        do{
        try imageInfo = dataPersistence.loadItems()
        } catch {
            print("could not load favorites")
        }
    }

}

extension FavortiesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = faveTableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath) as? FavoriteCell else {
            fatalError("could not downcast to FavoriteCell")
        }
        let selectedImage = imageInfo[indexPath.row]
        
        cell.configureCell(selectedImage)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    
}

extension FavortiesViewController: ImageAppended {
    func newImageAdded(_ image: Image) {
        imageInfo.append(image)
    }
    
}
