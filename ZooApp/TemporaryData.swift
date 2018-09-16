//
//  TemporaryData.swift
//  ZooApp
//
//  Created by DetroitLabs on 9/12/18.
//  Copyright © 2018 DetroitLabs. All rights reserved.
//

import Foundation

var animalsInZoo: [Animal] = [
    Animal(species: Species.lion.rawValue, name: "Selma", sex: "F"),
    Animal(species: Species.lion.rawValue, name: "Lionel", sex: "M"),
    BabyAnimal(species: Species.lion.rawValue, name: "Fiona", sex: "F", age: "3 months"),
    Animal(species: Species.elephant.rawValue, name: "Margot", sex: "F"),
    Animal(species: Species.elephant.rawValue, name: "George", sex: "M"),
    BabyAnimal(species: Species.elephant.rawValue, name: "Susan", sex: "F", age: "6 months"),
    Animal(species: Species.rhino.rawValue, name: "Carolyn", sex: "F"),
    Animal(species: Species.rhino.rawValue, name: "Richard", sex: "M"),
    BabyAnimal(species: Species.rhino.rawValue, name: "Bobby", sex: "M", age: "6 months"),
    Animal(species: Species.arcticFox.rawValue, name: "Meryl", sex: "F"),
    Animal(species: Species.polarBear.rawValue, name: "Poppy", sex: "F"),
    Animal(species: Species.wolf.rawValue, name: "William", sex: "M")
]

var habitatsInZoo: [Habitat] = [
    grassland, arctic
]

var grassland = Habitat(pens: [lionPen, elephantPen, rhinoPen], name: "Grassland")
var arctic = Habitat(pens: [arcticFoxPen, polarBearPen, wolfPen], name: "Arctic")


var lionPen = Pen(name: "Lion Pen", animals: [], animalSpecies: Species.lion.rawValue)
var arcticFoxPen = Pen(name: "Arctic Fox Pen", animals: [], animalSpecies: Species.arcticFox.rawValue)
var elephantPen = Pen(name: "Elephant Pen", animals: [], animalSpecies: "Elephant")
var rhinoPen = Pen(name: "Rhinoceros Pen", animals: [], animalSpecies: Species.rhino.rawValue)
var polarBearPen = Pen(name: "Polar Bear Pen", animals: [], animalSpecies: Species.polarBear.rawValue)
var wolfPen = Pen(name: "Wolf Pen", animals: [], animalSpecies: Species.wolf.rawValue)

var pensInZoo: [Pen] = [
    lionPen, arcticFoxPen, elephantPen, rhinoPen, polarBearPen, wolfPen
]

func populatePens() {
    for animal in animalsInZoo {
        switch animal.species {
        case Species.lion.rawValue:
            lionPen.animals.append(animal)
        case Species.arcticFox.rawValue:
            arcticFoxPen.animals.append(animal)
        case Species.elephant.rawValue:
            elephantPen.animals.append(animal)
        case Species.rhino.rawValue:
            rhinoPen.animals.append(animal)
        case Species.polarBear.rawValue:
            polarBearPen.animals.append(animal)
        case Species.wolf.rawValue:
            wolfPen.animals.append(animal)
        default:
            return
        }
    }
}


