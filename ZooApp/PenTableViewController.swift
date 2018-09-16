//
//  PenTableViewController.swift
//  ZooApp
//
//  Created by DetroitLabs on 9/12/18.
//  Copyright © 2018 DetroitLabs. All rights reserved.
//

import UIKit

class PenTableViewController: UITableViewController {

    // MARK: - Properties
    var habitat: Habitat?
    var selectedPenIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let theHabitat = habitat else { return 0 }
        return theHabitat.pens.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PenCell", for: indexPath)
        cell.textLabel?.text = habitat!.pens[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedPenIndex = indexPath.row
        return indexPath
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PenToAnimals" {
            guard let animalTableViewController = segue.destination as? AnimalTableViewController else { return }
            guard let theHabitat = habitat else { return }
            animalTableViewController.pen = theHabitat.pens[selectedPenIndex]
        }
    }

}
