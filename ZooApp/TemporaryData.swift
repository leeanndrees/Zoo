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
    Animal(species: "Elephant", name: "Margot", sex: "F"),
    Animal(species: "Elephant", name: "George", sex: "M"),
    BabyAnimal(species: "Elephant", name: "Susan", sex: "F", age: "6 months"),
    Animal(species: "Rhinoceros", name: "Carolyn", sex: "F"),
    Animal(species: "Rhinoceros", name: "Richard", sex: "M"),
    BabyAnimal(species: "Rhinoceros", name: "Bobby", sex: "M", age: "6 months"),
    Animal(species: "Arctic Fox", name: "Meryl", sex: "F")
]

var habitatsInZoo: [Habitat] = [
    grassland, arctic
]

var lionPen = Pen(name: "Lion Pen", animals: [])
var arcticFoxPen = Pen(name: "Arctic Fox Pen", animals: [])
var elephantPen = Pen(name: "Elephant Pen", animals: [])
var rhinoPen = Pen(name: "Rhinoceros Pen", animals: [])

var grassland = Habitat(pens: [lionPen, elephantPen, rhinoPen], name: "Grassland")
var arctic = Habitat(pens: [arcticFoxPen], name: "Arctic")

func populatePens() {
    for animal in animalsInZoo {
        if animal.species == "Lion" {
            lionPen.animals.append(animal)
        }
        else if animal.species == "Arctic Fox" {
            arcticFoxPen.animals.append(animal)
        }
        else if animal.species == "Elephant" {
            elephantPen.animals.append(animal)
        }
        else if animal.species == "Rhinoceros" {
            rhinoPen.animals.append(animal)
        }
    }
}


