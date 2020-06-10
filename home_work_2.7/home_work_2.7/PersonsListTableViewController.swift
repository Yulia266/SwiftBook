//
//  PersonsListTableViewController.swift
//  home_work_2.7
//
//  Created by Юлия on 10.06.2020.
//  Copyright © 2020 Юлия. All rights reserved.
//

import UIKit

class PersonsListTableViewController: UITableViewController {
    
    var personsList = Person.getPerson()
  
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personsList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personsList", for: indexPath)
        
        cell.textLabel?.text = personsList[indexPath.row].fullName
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let personalDetails = personsList[indexPath.row]
        performSegue(withIdentifier: "showDetails", sender: personalDetails)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            let personDetailsVC = segue.destination as! PersonDetailsTableViewController
            personDetailsVC.personalDetails = sender as? Person
        }
    }
}
