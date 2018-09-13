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
    @IBOutlet weak var nameTextField: UITextField!
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
    
    @IBAction func babyAnimalButton(_ sender: UIButton) {
        ageCell.isHidden = false
    }
    
    @IBAction func cancel() {
        delegate?.addAnimalTableViewControllerDidCancel(self)
    }
    
    @IBAction func save() {
        let animal = Animal(species: speciesTextField.text!, name: nameTextField.text!, sex: sexTextField.text!)
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
