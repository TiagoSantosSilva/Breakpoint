//
//  AuthenticationViewController.swift
//  Breakpoint
//
//  Created by Tiago Santos on 26/12/17.
//  Copyright © 2017 Tiago Santos. All rights reserved.
//

import UIKit
import Firebase

class AuthenticationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if Auth.auth().currentUser != nil {
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func signInWithEmailButtonWasPressed(_ sender: Any) {
        let loginViewController = LoginViewController()
        present(loginViewController, animated: true, completion: nil)
    }
    
    
    @IBAction func googleSignInButtonWasPressed(_ sender: Any) {
    }
    
    
    @IBAction func facebookSignInButtonWasPressed(_ sender: Any) {
    }
}
