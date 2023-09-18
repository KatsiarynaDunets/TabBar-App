//
//  Contacts.swift
//  TabBar App
//
//  Created by Kate on 13/09/2023.
//

import UIKit

class Contacts: UITableViewController {

    let persons = PersonData.createPersons().sorted { a, b -> Bool in
        a.firstName < b.lastName
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        /// второй вариант
//        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        let person = persons[indexPath.row]
        cell.textLabel?.text = person.lastName
        cell.detailTextLabel?.text = person.firstName
        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
}

/*
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Удалить элемент из вашего массива данных
            people.remove(at: indexPath.section)
            
            // Удалить секцию из таблицы с анимацией
            tableView.deleteSections([indexPath.section], with: .automatic)
        }
    }

}

*/
