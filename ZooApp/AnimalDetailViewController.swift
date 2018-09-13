//
//  AnimalDetailTableViewController.swift
//  ZooApp
//
//  Created by DetroitLabs on 9/13/18.
//  Copyright © 2018 DetroitLabs. All rights reserved.
//

import UIKit

class AnimalDetailViewController: UIViewController {
    
    // MARK - Outlets
    @IBOutlet weak var animalNameLabel: UILabel!
    @IBOutlet weak var animalSpeciesLabel: UILabel!
    @IBOutlet weak var animalSexLabel: UILabel!
    
    // MARK - Properties
    var animalToShow: Animal = lionPen.animals[0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayAnimalProperties()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK - Methods
    func displayAnimalProperties() {
        animalNameLabel.text = animalToShow.name
        animalSpeciesLabel.text = animalToShow.species
        animalSexLabel.text = animalToShow.sex
    }
}
