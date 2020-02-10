//
//  UserDefault.swift
//  WeatherApp
//
//  Created by Maitree Bain on 2/10/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation

struct UserKey {
    static let userZip = "Zipcode"
}

struct UserPreference {
    
        private init() {}
        
        static let shared = UserPreference()
        
    func updateZipcode(for zipcode: String) {
        
        UserDefaults.standard.set(zipcode, forKey: UserKey.userZip)
    }
    
    func getZipcode() -> String? {
        guard let zipcode = UserDefaults.standard.object(forKey: UserKey.userZip) as? String else {
            return nil
        }
        
        return zipcode
    }
}
