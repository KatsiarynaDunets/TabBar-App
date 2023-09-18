//
//  Contacts.swift
//  TabBar App
//
//  Created by Kate on 13/09/2023.
//

import UIKit

class Contacts: UITableViewController {
    var persons = PersonData.createPersons().sorted { a, b -> Bool in
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

    // Разрешаем перетаскивание для всех ячеек
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    // Обрабатываем перетаскивание
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedPerson = persons.remove(at: sourceIndexPath.section)
        persons.insert(movedPerson, at: destinationIndexPath.section)
    }

    // Удаление ячеек
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Удалить элемент из массива данных
            if indexPath.row == 0 {
                persons[indexPath.section].email = ""
            } else {
                persons[indexPath.section].phone = ""
            }

            // Удалить ячейку из таблицы с анимацией
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

    // Добавляем кнопку для активации режима редактирования
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = editButtonItem
    }

    // MARK: - Navigation
}
