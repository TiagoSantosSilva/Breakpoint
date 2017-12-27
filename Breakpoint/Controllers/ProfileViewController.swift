//
//  ProfileViewController.swift
//  Breakpoint
//
//  Created by Tiago Santos on 27/12/17.
//  Copyright © 2017 Tiago Santos. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        emailLabel.text = Auth.auth().currentUser?.email
    }
    
    @IBAction func signOutButtonPressed(_ sender: Any) {
        let logoutPopup = UIAlertController(title: "Logout?", message: "Are you sure you want to logout?", preferredStyle: .actionSheet)
        let logoutAction = UIAlertAction(title: "Logout", style: .destructive) { (buttonTapped) in
            
            do {
                try Auth.auth().signOut()
                let authenticationViewController = AuthenticationViewController()
                self.present(authenticationViewController, animated: true, completion: nil)
            } catch {
                print(error.localizedDescription)
            }
        }
        
        logoutPopup.addAction(logoutAction)
        present(logoutPopup, animated: true, completion: nil)
    }
}
