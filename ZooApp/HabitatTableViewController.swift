//
//  HabitatTableViewController.swift
//  ZooApp
//
//  Created by DetroitLabs on 9/12/18.
//  Copyright © 2018 DetroitLabs. All rights reserved.
//

import UIKit

class HabitatTableViewController: UITableViewController {
    
    // MARK: - Properties
    var selectedHabitatIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        useLargeTitles()
        populatePens()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return habitatsInZoo.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HabitatCell", for: indexPath)
        cell.textLabel?.text = habitatsInZoo[indexPath.row].name
        return cell
    }
    
    // MARK: - Private Implementation
    
    func useLargeTitles() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedHabitatIndex = indexPath.row
        return indexPath
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "HabitatToPens" {
            guard let penTableViewController = segue.destination as? PenTableViewController else { return }
            penTableViewController.habitat = habitatsInZoo[selectedHabitatIndex]
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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


}
