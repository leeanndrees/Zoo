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
    Animal(species: "Arctic Fox", name: "Meryl", sex: "F"),
    Animal(species: "Polar Bear", name: "Poppy", sex: "F"),
    Animal(species: "Wolf", name: "William", sex: "M")
]

var habitatsInZoo: [Habitat] = [
    grassland, arctic
]

var lionPen = Pen(name: "Lion Pen", animals: [], animalSpecies: "Lion")
var arcticFoxPen = Pen(name: "Arctic Fox Pen", animals: [], animalSpecies: "Arctic Fox")
var elephantPen = Pen(name: "Elephant Pen", animals: [], animalSpecies: "Elephant")
var rhinoPen = Pen(name: "Rhinoceros Pen", animals: [], animalSpecies: "Rhinoceros")
var polarBearPen = Pen(name: "Polar Bear Pen", animals: [], animalSpecies: "Polar Bear")
var wolfPen = Pen(name: "Wolf Pen", animals: [], animalSpecies: "Wolf")

var pensInZoo: [Pen] = [
    lionPen, arcticFoxPen, elephantPen, rhinoPen, polarBearPen, wolfPen
]

var grassland = Habitat(pens: [lionPen, elephantPen, rhinoPen], name: "Grassland")
var arctic = Habitat(pens: [arcticFoxPen, polarBearPen, wolfPen], name: "Arctic")

func populatePens() {
    for animal in animalsInZoo {
        switch animal.species {
        case "Lion":
            lionPen.animals.append(animal)
        case "Arctic Fox":
            arcticFoxPen.animals.append(animal)
        case "Elephant":
            elephantPen.animals.append(animal)
        case "Rhinoceros":
            rhinoPen.animals.append(animal)
        case "Polar Bear":
            polarBearPen.animals.append(animal)
        case "Wolf":
            wolfPen.animals.append(animal)
        default:
            return
        }
    }
}


