//
//  AddAnimalTableViewController.swift
//  ZooApp
//
//  Created by DetroitLabs on 9/13/18.
//  Copyright © 2018 DetroitLabs. All rights reserved.
//

import UIKit

protocol AddAnimalTableViewControllerDelegate: class {
    func addAnimalTableViewControllerDidCancel(_ controller: AddAnimalTableViewController)
    func addAnimalTableViewController(_ controller: AddAnimalTableViewController, didFinishAdding item: Animal)
}

class AddAnimalTableViewController: UITableViewController {
    
    // MARK: - Properties
    weak var delegate: AddAnimalTableViewControllerDelegate?
    var isBabyAnimal = false
    
    @IBOutlet weak var nameTextField: UITextField!
    // TODO: don't need to specify species, it should come from Pen. maybe a dictionary of Pens to species? or a species property for Pens? or pass species data in from pen in segue?
    @IBOutlet weak var speciesTextField: UITextField!
    @IBOutlet weak var sexTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var ageCell: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ageCell.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func createAnimal() -> Animal {
        // is there a nicer way to do this w/o repeating animal properties?
        var newAnimal: Animal
        if isBabyAnimal {
            newAnimal = BabyAnimal(species: speciesTextField.text!, name: nameTextField.text!, sex: sexTextField.text!, age: ageTextField.text!)
        }
        else {
            newAnimal = Animal(species: speciesTextField.text!, name: nameTextField.text!, sex: sexTextField.text!)
        }
        return newAnimal
    }
    
    @IBAction func babyAnimalButton(_ sender: UIButton) {
        isBabyAnimal = true
        ageCell.isHidden = false
    }
    
    @IBAction func cancel() {
        delegate?.addAnimalTableViewControllerDidCancel(self)
    }
    
    @IBAction func save() {
        let animal = createAnimal()
        delegate?.addAnimalTableViewController(self, didFinishAdding: animal)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
