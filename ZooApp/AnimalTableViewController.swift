//
//  AnimalTableViewController.swift
//  ZooApp
//
//  Created by DetroitLabs on 9/12/18.
//  Copyright © 2018 DetroitLabs. All rights reserved.
//

import UIKit

class AnimalTableViewController: UITableViewController {
    
    // MARK: - Properties
    var pen: Pen?
    var animalsToShow: [Animal] = []
    var selectedAnimalIndex = 0

    // MARK: -  Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        animalsToShow = getAnimalData()
        setNavControllerTitle()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func swipeToDelete(indexPath: IndexPath) {
        animalsToShow.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
    }
    
    func getAnimalData() -> [Animal] {
        guard let animalData = pen?.animals else { return [] }
        return animalData
    }
    
    func separateAnimalsAndBabyAnimals() {
        var babyAnimalsInPen: [BabyAnimal] = []
        var grownAnimalsInPen: [Animal] = []
        for animal in animalsToShow {
            if isMember(of: BabyAnimal.self) {
                babyAnimalsInPen.append(animal as! BabyAnimal)
            }
            else {
                grownAnimalsInPen.append(animal)
            }
        }
    }
    
    func setNavControllerTitle() {
        self.navigationItem.title = ("\(getPenName())")
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animalsToShow.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalCell", for: indexPath)
        cell.textLabel?.text = animalsToShow[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedAnimalIndex = indexPath.row
        return indexPath
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AnimalsToDetail" {
            guard let animalDetailViewController = segue.destination as? AnimalDetailViewController else { return }
            animalDetailViewController.animalToShow = animalsToShow[selectedAnimalIndex]
            animalDetailViewController.delegate = self
        }
        else if segue.identifier == "AddAnimal" {
            guard let add = segue.destination as? AddAnimalTableViewController else { return }
            add.delegate = self
        }
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            swipeToDelete(indexPath: indexPath)
            saveAnimals()
        }
    }
}

// MARK: - AddAnimalTableViewControllerDelegate Methods
extension AnimalTableViewController: AddAnimalTableViewControllerDelegate {
    func addAnimalTableViewControllerDidCancel(_ controller: AddAnimalTableViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func addAnimalTableViewController(_ controller: AddAnimalTableViewController, didFinishAdding item: Animal) {
        
        let newRowIndex = animalsToShow.count
        animalsToShow.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
        
        navigationController?.popViewController(animated: true)
        
        saveAnimals()
    }
}

// MARK: - AnimalDetailViewControllerDelegate Methods
extension AnimalTableViewController: AnimalDetailViewControllerDelegate {
    func detailViewController(_ controller: AnimalDetailViewController, didFinishEditing animal: Animal) {
        
        guard let index = animalsToShow.index(of: animal) else { return }
        let indexPath = IndexPath(row: index, section: 0)

        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        cell.textLabel?.text = animal.name
        navigationController?.popViewController(animated: true)
        
        saveAnimals()
    }
}

// MARK: - Persistence
extension AnimalTableViewController {
    
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func getPenName() -> String {
        // remove spaces?
        guard let penName = pen?.name else {
            return "error getting pen name"
        }
        return penName
    }
    
    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("\(getPenName())Animals.plist")
    }
    
    func saveAnimals() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(animalsToShow)
            try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
        }
        catch {
            print("error encoding array")
        }
    }
}
