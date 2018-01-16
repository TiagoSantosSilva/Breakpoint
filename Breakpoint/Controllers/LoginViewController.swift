//
//  LoginViewController.swift
//  Breakpoint
//
//  Created by Tiago Santos on 26/12/17.
//  Copyright © 2017 Tiago Santos. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: InsetTextField!
    @IBOutlet weak var passwordField: InsetTextField!
    
    var authenticationService: AuthenticationService!
    var dataService: DataService!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        self.dataService = DataService()
        self.authenticationService = AuthenticationService(dataService: self.dataService)
        super.viewDidLoad()
    }
    
    @IBAction func signInButtonWasPresssed(_ sender: Any) {
        if emailField.text != nil && passwordField.text != nil {
            authenticationService.loginUser(withEmail: emailField.text!, andPassword: passwordField.text!, loginComplete: { (success, error) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                } else {
                    print("Login error: \(String(describing: error?.localizedDescription))")
                }
                
                
                self.authenticationService.registerUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, userCreationComplete: { (success, registrationError) in
                    if success {
                        self.authenticationService.loginUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, loginComplete: { (success, nil) in
                            self.dismiss(animated: true, completion: nil)
                            print("Successfuly registered user.")
                        })
                    } else {
                        print(String(describing: registrationError?.localizedDescription))
                    }
                })
            })
        }
    }
    
    @IBAction func closeButtonWasPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
