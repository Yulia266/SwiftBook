//
//  File.swift
//  Home_Work_2.4
//
//  Created by Юлия on 30.05.2020.
//  Copyright © 2020 Юлия. All rights reserved.
//

import UIKit

class SuccessfulLoginViewController: UIViewController {
    
    @IBOutlet var welcomeLebel: UILabel!
    
    var welcomeLabel: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLebel.text = "Welcome, " + welcomeLabel
        
    }
    
}
