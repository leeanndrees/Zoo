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

    override func viewDidLoad() {
        super.viewDidLoad()
        animalsToShow = getAnimalData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func swipeToDelete(indexPath: IndexPath) {
        animalsToShow.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
    }
    
    func getAnimalData() -> [Animal] {
        return (pen?.animals)!
        // ^ ^ ^ add guard
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
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

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            swipeToDelete(indexPath: indexPath)
        }
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

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
    }
}

extension AnimalTableViewController: AnimalDetailViewControllerDelegate {
    func detailViewController(_ controller: AnimalDetailViewController, didFinishEditing animal: Animal) {
        
        guard let index = animalsToShow.index(of: animal) else { return }
        let indexPath = IndexPath(row: index, section: 0)

        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        cell.textLabel?.text = animal.name
        navigationController?.popViewController(animated: true)
    }
}
