//
//  CreateGroupViewController.swift
//  Breakpoint
//
//  Created by Tiago Santos on 27/12/17.
//  Copyright © 2017 Tiago Santos. All rights reserved.
//

import UIKit

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
    }
}
