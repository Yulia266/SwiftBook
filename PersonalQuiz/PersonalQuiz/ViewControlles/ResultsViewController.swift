//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 01.06.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var answersArray: [Answer] = []
    
    // 1. Передать массив с ответами на этот экран
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результаты на экране
    // 4. Избавится от кнопки back
    
    @IBOutlet var messageOfAnimalType: UILabel!
    @IBOutlet var messageOfDefinition: UILabel!
    
    override func viewDidLoad() {
          super.viewDidLoad()
          navigationItem.hidesBackButton = true
        
        let mostOftenChosenAnimal = findMostOftenChosenAnimal()
        messageOfAnimalType.text = "Вы - " + String(mostOftenChosenAnimal.rawValue)
        messageOfDefinition.text = mostOftenChosenAnimal.definition
      }
    
    private func findMostOftenChosenAnimal() -> AnimalType {
        var (cats, dogs, rabbits, turtles) = (0, 0, 0, 0)
        
        for answer in answersArray {
            switch answer.type {
            case .cat: cats += 1
            case .dog: dogs += 1
            case .rabbit: rabbits += 1
            case .turtle: turtles += 1
            }
        }
        let animalsArray: [AnimalType: Int] = [.cat: cats, .dog: dogs, .rabbit: rabbits, .turtle: turtles]
        
        let animalsArraySorted = animalsArray.sorted { $0.1 > $1.1 }
        return animalsArraySorted.first?.key ?? .dog
    }
}
