//
//  RegistrationData.swift
//  Home_Work_2.4
//
//  Created by Юлия on 30.05.2020.
//  Copyright © 2020 Юлия. All rights reserved.
//

struct LoginData {
    let userName: String?
    let password: String?
}

extension LoginData {
    static func getLoginData()  -> LoginData {
        return LoginData(userName: "Yulia",
                                password: "pass")
        
    }
}
