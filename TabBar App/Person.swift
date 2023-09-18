//
//  Person.swift
//  TabBar App
//
//  Created by Kate on 18/09/2023.
//

import Foundation

// MARK: - Person

struct Person {
    let firstName: String
    let lastName: String
    let email: String
    let phone: String
}

// MARK: - PersonData

struct PersonData {
    
    static func createPersons() -> [Person] {
        
        var persons: [Person] = []

        // перемешиваем и записываем
        let firstNames = DataStorage.firstNames.shuffled()
        let lastName = DataStorage.lastNames.shuffled()
        let emails = DataStorage.emails.shuffled()
        let phones = DataStorage.phones.shuffled()

        for index in 0 ..< firstNames.count {
            let person = Person(firstName: firstNames[safe: index] ?? "No data",
                                lastName: lastName[safe: index] ?? "No data",
                                email: emails[safe: index] ?? "No data",
                                phone: phones[safe: index] ?? "No data")
            persons.append(person)
        }
        return persons
    }
}


extension Collection {
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

