//
//  TemporaryData.swift
//  ZooApp
//
//  Created by DetroitLabs on 9/12/18.
//  Copyright © 2018 DetroitLabs. All rights reserved.
//

import Foundation

var animalsInZoo: [Animal] = [
    Animal(species: "Lion", name: "Selma", sex: "F"),
    Animal(species: "Lion", name: "Lionel", sex: "M"),
    BabyAnimal(species: "Lion", name: "Fiona", sex: "F", age: "3 months"),
    Animal(species: "Arctic Fox", name: "Meryl", sex: "F")
]

var habitatsInZoo: [Habitat] = [
    grassland, arctic
]

var lionPen = Pen(name: "Lion Pen", animals: [])
var arcticFoxPen = Pen(name: "Arctic Fox Pen", animals: [])

var grassland = Habitat(pens: [lionPen], name: "Grassland")
var arctic = Habitat(pens: [arcticFoxPen], name: "Arctic")

func populatePens() {
    for animal in animalsInZoo {
        if animal.species == "Lion" {
            lionPen.animals.append(animal)
        }
        else if animal.species == "Arctic Fox" {
            arcticFoxPen.animals.append(animal)
        }
    }
}


