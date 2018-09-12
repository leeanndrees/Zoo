//
//  BabyAnimal.swift
//  ZooApp
//
//  Created by DetroitLabs on 9/12/18.
//  Copyright © 2018 DetroitLabs. All rights reserved.
//

import Foundation

class BabyAnimal: Animal {
    var age: String
    
    init(species: String, name: String, sex: String, age: String) {
        self.age = age
        super.init(species: species, name: name, sex: sex)
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}
