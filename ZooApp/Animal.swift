//
//  Animal.swift
//  ZooApp
//
//  Created by DetroitLabs on 9/12/18.
//  Copyright © 2018 DetroitLabs. All rights reserved.
//

import Foundation

class Animal: Codable {
    var species: String
    var name: String
    var sex: String
    
    init(species: String, name: String, sex: String) {
        self.species = species
        self.name = name
        self.sex = sex
    }
}
