//
//  PersonDetailsViewController.swift
//  home_work_2.7
//
//  Created by Юлия on 10.06.2020.
//  Copyright © 2020 Юлия. All rights reserved.
//

import UIKit

class PersonDetailsTableViewController: UIViewController {
    
    @IBOutlet var phone: UILabel!
    @IBOutlet var email: UILabel!
    
    var personalDetails: Person!
    
    override func viewDidLoad() {
        phone.text = personalDetails.phone
        email.text = personalDetails.email
    }

}
    
