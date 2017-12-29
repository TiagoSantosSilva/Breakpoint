//
//  CreateGroupViewController.swift
//  Breakpoint
//
//  Created by Tiago Santos on 27/12/17.
//  Copyright © 2017 Tiago Santos. All rights reserved.
//

import UIKit
import Firebase

class CreateGroupViewController: UIViewController {

    @IBOutlet weak var addPeopleToYourGroupLabel: UILabel!
    @IBOutlet weak var descriptionField: InsetTextField!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var emailSearchField: InsetTextField!
    @IBOutlet weak var titleField: InsetTextField!
    @IBOutlet weak var tableView: UITableView!
    
    var emailArray = [String]()
    var chosenUserArray = [String]()
    var dataService: DataService!
    
    override func viewDidLoad() {
        dataService = DataService()
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        emailSearchField.delegate = self
        emailSearchField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange() {
        if emailSearchField.text == "" {
            emailArray = []
            tableView.reloadData()
        } else {
            dataService.getEmail(forSearchQuery: emailSearchField.text!, handler: { (returnedEmailArray) in
                self.emailArray = returnedEmailArray
                self.tableView.reloadData()
            })
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        doneButton.isHidden = true
    }
    
    @IBAction func closeButtonWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonWasPressed(_ sender: Any) {
        if titleField.text != "" && descriptionField.text != "" {
            dataService.getIds(forUserNames: chosenUserArray, handler: { (idsArray) in
                var userIds = idsArray
                userIds.append((Auth.auth().currentUser?.uid)!)
                
                self.dataService.createGroup(withTitle: self.titleField.text!, andDescription: self.descriptionField.text!, forUserIds: userIds, handler: { (groupCreated) in
                    if groupCreated {
                        self.dismiss(animated: true, completion: nil)
                    } else {
                        let alert = UIAlertController(title: "Error creating group", message: "Something went wrong when trying to create the group. Please try again.", preferredStyle: UIAlertControllerStyle.alert)
                        self.present(alert, animated: true, completion: nil)
                    }
                })
            })
        }
    }
}
