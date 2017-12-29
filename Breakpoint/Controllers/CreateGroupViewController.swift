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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func closeButtonWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonWasPressed(_ sender: Any) {
    }
}
