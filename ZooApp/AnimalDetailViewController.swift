//
//  AnimalDetailTableViewController.swift
//  ZooApp
//
//  Created by DetroitLabs on 9/13/18.
//  Copyright © 2018 DetroitLabs. All rights reserved.
//

import UIKit

protocol AnimalDetailViewControllerDelegate: class {
    func detailViewController(_ controller: AnimalDetailViewController, didFinishEditing animal: Animal)
}

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
    weak var delegate: AnimalDetailViewControllerDelegate?
    
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
    
    func isBabyAnimal() -> Bool {
        guard let animal = animalToShow else { return false }
        return animal.isMember(of: BabyAnimal.self)
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
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        guard let animal = animalToShow else { return }
        
        guard let updatedName = animalNameField.text else { return }
        animal.name = updatedName
        guard let updatedSpecies = animalSpeciesField.text else { return }
        animal.species = updatedSpecies
        guard let updatedSex = animalSexField.text else { return }
        animal.sex = updatedSex
        // need to add age here for babies
        
        delegate?.detailViewController(self, didFinishEditing: animal)
    }
    
}
