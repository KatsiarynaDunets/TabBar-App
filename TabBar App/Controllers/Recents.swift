//
//  Recents.swift
//  TabBar App
//
//  Created by Kate on 14/09/2023.
//

import UIKit

class Recents: UITableViewController {
    var persons = PersonData.createPersons().sorted { a, b -> Bool in a.firstName < b.lastName }

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

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let person = persons[section]

        let label = UILabel()
        label.backgroundColor = .secondarySystemBackground
        label.text = "Позвонить " + person.firstName + " " + person.lastName
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)

        return label
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        print(indexPath)
        let person = persons[indexPath.section]
        cell.textLabel?.text = indexPath.row == 0 ? "email: " + person.email : "phone: " + person.phone
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {}

//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//
//
//            // Удалить секцию из таблицы с анимацией
//            tableView.deleteSections([indexPath.section], with: .automatic)
//        }
//    }

//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//
//            // Удалить ячейку из таблицы с анимацией
//            tableView.deleteRows(at: [indexPath], with: .automatic)
//            // Удалить элемент из массива данных
//            persons.remove(at: indexPath.section)
//        }
//    }

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

    @IBAction func editButton(_ sender: UIButton) {
        isEditing = !isEditing
    }
}

/* Использование метода для кастомизации секции с использованием кастомного класса
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell"),
              let headerCell = cell as? HeaderCell else { return UIView() }

        let person = persons[section]
        headerCell.personLabel.text = person.firstName + " " + person.lastName

        return headerCell
    }

 Использование метода для кастомизации секции без использования кастомного класса
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let person = persons[section]

        let myView = UIView()
        myView.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)

        let label = UILabel(frame: CGRect(x: 20, y: 3, width: 300, height: 20))
        label.text = person.firstName + " " + person.lastName
        label.textColor = .white

        myView.addSubview(label)
        return myView
    }
 */
