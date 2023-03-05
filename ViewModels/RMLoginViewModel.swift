//
//  LoginViewModel.swift
//  Rickaland
//
//  Created by Алексей  on 03.03.2023.
//

import Foundation

protocol RMLoginViewModelDelegate: AnyObject {
    func didAuthenticateUser()
}

class RMLoginViewModel {
    
    var email: String = ""
    var password: String = ""
    
    var loginModel: RMLoginModel
    weak var delegate: RMLoginViewModelDelegate?
    
    init(email: String, password: String) {
        self.loginModel = RMLoginModel(email: email, password: password)
    }
    
    func validateCredentials() -> Bool {
        return !loginModel.email.isEmpty && !loginModel.password.isEmpty
    }
    
    func loginCheck(email: String, password: String) {
        if email == "Hello" && password == "1234" {
            delegate?.didAuthenticateUser()
        } else {
            print("Error!")
        }
    }
}
