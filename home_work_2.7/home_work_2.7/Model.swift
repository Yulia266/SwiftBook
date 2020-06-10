//
//  Model.swift
//  home_work_2.7
//
//  Created by Юлия on 10.06.2020.
//  Copyright © 2020 Юлия. All rights reserved.
//

struct Person {
    let name: String
    let surname: String
    let email: String
    let phone: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
}

extension Person {
    static func getPerson() -> [Person] {
        
        let person = DataManager()
        
        let names = person.names.shuffled()
        let surnames = person.surnames.shuffled()
        let emails = person.emails.shuffled()
        let phones = person.phones.shuffled()
        
        var personsArray: [Person] = []
        
        for index in 0...person.names.count - 1 {
            personsArray.append(Person(name: names[index],
                                       surname: surnames[index],
                                       email: emails[index],
                                       phone: phones[index]))
        }
        
        return personsArray
        
    }
}
