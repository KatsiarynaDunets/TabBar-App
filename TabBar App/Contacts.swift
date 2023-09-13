//
//  Contacts.swift
//  TabBar App
//
//  Created by Kate on 13/09/2023.
//

import UIKit

class Contacts: UITableViewController {
    
    var people: [Person] = []
    let firstNames = ["Maша", "Саня", "Миша", "Алекс", "Настя", "Михаил", "Ирина", "Жанна", "Николай", "Саша"]
    let lastNames = ["Пугачева", "Лукаc", "Бел", "Баск", "Круг", "Аллегров.", "Дунец", "Михайленко", "Максимчик", "Новик", "Иванов"]
    let emails = ["123@example.com", "1223@example.com", "krug@example.com", "michael@example.com", "mic@example.com", "sss@example.com", "grew@example.com", "dgse@example.com", "4532@example.com", "fgfxg@example.com"]
    let phones = ["375-456-7890","375-456-8473","375-456-5574","375-456-2222","375-456-3333","375-456-5555","375-456-4444", "987-654-7786", "555-555-5555", "111-111-1111"]
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return people.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let person = people[section]
        return "\(person.firstName) \(person.lastName)"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let person = people[indexPath.section]
        
        if indexPath.row == 0 {
            cell.textLabel?.text = "Email: \(person.email)"
        } else {
            cell.textLabel?.text = "Phone: \(person.phone)"
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Удалить элемент из вашего массива данных
            people.remove(at: indexPath.section)
            
            // Удалить секцию из таблицы с анимацией
            tableView.deleteSections([indexPath.section], with: .automatic)
        }
    }

}


