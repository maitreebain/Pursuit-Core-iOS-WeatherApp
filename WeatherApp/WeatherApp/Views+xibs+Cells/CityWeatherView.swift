//
//  CityWeatherView.swift
//  WeatherApp
//
//  Created by Maitree Bain on 1/31/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class   CityWeatherView: UIView {
    
    public lazy var cityLabel: UILabel = {
        let city = UILabel()
        city.text = "city"
        city.backgroundColor = .darkGray
        city.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return city
    }()

    public lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        return cv
    }()
    
    public lazy var zipPrompt: UILabel = {
        let label = UILabel()
        label.text = "Enter Zipcode below:"
        label.textAlignment = .center
        return label
    }()
    
    public lazy var zipTextField: UITextField = {
        let textfield = UITextField()
        textfield.backgroundColor = .red
        textfield.text = "10023"
        return textfield
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    private func commonInit() {
        
        setUpCityLabelConstraints()
        setUpCollectionViewConstraints()
        setUpZipLabelConstraints()
        setUpZipcodeTextConstraints()
    }
    
    private func setUpCityLabelConstraints() {
        addSubview(cityLabel)
        
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            cityLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            cityLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            cityLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    private func setUpCollectionViewConstraints() {
        addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 40),
            collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            collectionView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4)
        ])
    }
    
    private func setUpZipLabelConstraints() {
        addSubview(zipPrompt)
        
        zipPrompt.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        zipPrompt.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20),
        zipPrompt.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            zipPrompt.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
        
    }
    
    private func setUpZipcodeTextConstraints() {
        addSubview(zipTextField)
        
        zipTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        zipTextField.topAnchor.constraint(equalTo: zipPrompt.bottomAnchor, constant: 20),
            zipTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 100),
            zipTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -100)
        ])
        
    }

}
