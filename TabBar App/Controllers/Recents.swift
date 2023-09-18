//
//  Recents.swift
//  TabBar App
//
//  Created by Kate on 14/09/2023.
//

import UIKit

class Recents: UITableViewController {
    
    let persons = PersonData.createPersons().sorted { a, b -> Bool in a.firstName < b.lastName }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        persons.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    // Использование метода для присваивания заголовка секции
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let person = persons[section]
        return person.firstName + " " + person.lastName
    }
    
    /// Задаем высоту хедера секции
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    
    /*
    // Использование метода для кастомизации секции с использованием кастомного класса
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell"),
              let headerCell = cell as? HeaderCell else { return UIView() }

        let person = persons[section]
        headerCell.personLabel.text = person.name + " " + person.sureName

        return headerCell
    }
    
    // Использование метода для кастомизации секции без использования кастомного класса
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let person = persons[section]

        let label = UILabel()
        label.backgroundColor = .lightGray
        label.text = person.name + " " + person.sureName
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)

        return label
    }
    
    // Использование метода для кастомизации секции без использования кастомного класса
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let person = persons[section]

        let myView = UIView()
        myView.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)

        let label = UILabel(frame: CGRect(x: 20, y: 3, width: 300, height: 20))
        label.text = person.name + " " + person.sureName
        label.textColor = .white

        myView.addSubview(label)
        return myView
    }
    */
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        print(indexPath)
        let person = persons[indexPath.section]
        cell.textLabel?.text = indexPath.row == 0 ? person.email : person.phone
        return cell
    }
}
