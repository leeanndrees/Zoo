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
    @IBOutlet weak var animalAgeLabel: UILabel!
    
    @IBOutlet weak var animalNameField: UITextField!
    @IBOutlet weak var animalSpeciesField: UITextField!
    @IBOutlet weak var animalSexField: UITextField!
    @IBOutlet weak var animalAgeField: UITextField!
    
    
    // MARK - Properties
    var animalToShow: Animal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayAnimalProperties()
        toggleFieldVisibility()
        showCurrentValuesInFields()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK - Methods
    func displayAnimalProperties() {
        animalNameLabel.text = animalToShow?.name
        animalSpeciesLabel.text = animalToShow?.species
        animalSexLabel.text = animalToShow?.sex
        guard let animalAge = (animalToShow as? BabyAnimal)?.age else {
            animalAgeLabel.text = ""
            return
        }
        animalAgeLabel.text = animalAge
    }
    
    func toggleLabelVisibility() {
        animalNameLabel.isHidden = !animalNameLabel.isHidden
        animalSpeciesLabel.isHidden = !animalSpeciesLabel.isHidden
        animalAgeLabel.isHidden = !animalAgeLabel.isHidden
        animalSexLabel.isHidden = !animalSexLabel.isHidden
    }
    
    func toggleFieldVisibility() {
        // need to only show age for babies
        animalNameField.isHidden = !animalNameField.isHidden
        animalSpeciesField.isHidden = !animalSpeciesField.isHidden
        animalAgeField.isHidden = !animalAgeField.isHidden
        animalSexField.isHidden = !animalSexField.isHidden
    }
    
    func showCurrentValuesInFields() {
        // add default case for empty fields
        animalNameField.text = animalToShow?.name
        animalSexField.text = animalToShow?.sex
        animalSpeciesField.text = animalToShow?.species
    }
    
    @IBAction func editAnimalButton(_ sender: UIButton) {
        toggleLabelVisibility()
        toggleFieldVisibility()
    }
    
}
