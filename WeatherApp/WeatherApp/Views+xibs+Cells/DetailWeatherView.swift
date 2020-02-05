//
//  DetailWeatherView.swift
//  WeatherApp
//
//  Created by Maitree Bain on 2/5/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class DetailWeatherView: UIView {
    
    public lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .blue
        return label
    }()
    
    public lazy var cityImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "heart.fill")
        return image
    }()
    
    public lazy var highLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .blue
        return label
    }()
    
    public lazy var lowLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .blue
        return label
    }()
    
    public lazy var sunriseLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .blue
        return label
    }()
    
    public lazy var sunsetLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .blue
        return label
    }()
    
    public lazy var windspeedLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .blue
        return label
    }()
    
    public lazy var precipitationLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .blue
        return label
    }()
    
    public lazy var summaryText: UITextView = {
        let text = UITextView()
        text.backgroundColor = .green
        text.isEditable = false
        return text
    }()
    
    var labelsArr = [UILabel]()
    
    public lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: labelInfo()) //function here)
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 8
        stack.backgroundColor = .lightGray
        return stack
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
        //constraints here
        
        setUpCityLabel()
        setUpCityImageConstrains()
        setUpStackViewConstraints()
        setUpSummaryConstraints()
    }
    
    private func labelInfo() -> [UILabel] {
        highLabel.text = "high"
        lowLabel.text = "low"
        sunriseLabel.text = "sunrise"
        sunsetLabel.text = "sunset"
        windspeedLabel.text = "windspeed"
        precipitationLabel.text = "precip"
        labelsArr.append(highLabel)
        labelsArr.append(lowLabel)
        labelsArr.append(sunriseLabel)
        labelsArr.append(sunsetLabel)
        labelsArr.append(windspeedLabel)
        labelsArr.append(precipitationLabel)
        return labelsArr
    }
    
    private func setUpCityLabel() {
         addSubview(cityLabel)
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            cityLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            cityLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    private func setUpCityImageConstrains() {
        addSubview(cityImage)
        
        cityImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cityImage.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 20),
            cityImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            cityImage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            cityImage.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.4)
        ])
    }
    
    private func setUpStackViewConstraints() {
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: cityImage.bottomAnchor, constant: 40),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.3)
        ])
    }
    
    private func setUpSummaryConstraints() {
        addSubview(summaryText)
        
        summaryText.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            summaryText.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 8),
            summaryText.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            summaryText.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            summaryText.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.2)
        ])
    }
}
