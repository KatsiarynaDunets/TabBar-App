//
//  Recents.swift
//  TabBar App
//
//  Created by Kate on 14/09/2023.
//

import UIKit

class MyTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let recents = Recents()
        recents.tabBarItem = UITabBarItem(title: "Recents", image: UIImage(named: "Recents"), tag: 0)

        let contacts = Contacts()
        contacts.tabBarItem = UITabBarItem(title: "Contacts", image: UIImage(named: "Contacts"), tag: 1)

        let tabBarList = [recents, contacts]

        viewControllers = tabBarList.map { UINavigationController(rootViewController: $0) }
    }
}

struct Person: Hashable {
    let id: UUID
    let firstName: String
    let lastName: String
    let email: String
    let phone: String
}

class Recents: UITableViewController {
    
    var uniqueFirstNames = Set<String>()
    var uniqueLastNames = Set<String>()
    var uniqueEmails = Set<String>()
    var uniquePhones = Set<String>()
    var people: [Person] = []
    let firstNames = ["Maша", "Саня", "Миша", "Алекс", "Настя", "Михаил", "Ирина", "Жанна", "Николай", "Саша"]
    let lastNames = ["Пугачева", "Лука", "Белый", "Басков", "Круг", "Аллегров", "Дунец", "Михайленко", "Максимчик", "Новик", "Иванов"]
    let emails = ["123@example.com", "1223@example.com", "krug@example.com", "michael@example.com", "mic@example.com", "sss@example.com", "grew@example.com", "dgse@example.com", "4532@example.com", "fgfxg@example.com"]
    let phones = ["375-456-7890","375-456-8473","375-456-5574","375-456-2222","375-456-3333","375-456-5555","375-456-4444", "987-654-7786", "555-555-5555", "111-111-1111"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        for _ in 0..<10 {
            var firstName: String
            var lastName: String
            var email: String
            var phone: String
            
            repeat {
                firstName = firstNames.randomElement()!
            } while uniqueFirstNames.contains(firstName)
            uniqueFirstNames.insert(firstName)
            
            repeat {
                lastName = lastNames.randomElement()!
            } while uniqueLastNames.contains(lastName)
            uniqueLastNames.insert(lastName)
            
            repeat {
                email = emails.randomElement()!
            } while uniqueEmails.contains(email)
            uniqueEmails.insert(email)
            
            repeat {
                phone = phones.randomElement()!
            } while uniquePhones.contains(phone)
            uniquePhones.insert(phone)
            
            let person = Person(id: UUID(), firstName: firstName, lastName: lastName, email: email, phone: phone)
            people.append(person)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let person = people[indexPath.row]
        cell.textLabel?.text = "\(person.firstName) \(person.lastName)"
        return cell
    }
}




