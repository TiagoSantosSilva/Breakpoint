//
//  GroupsViewController.swift
//  Breakpoint
//
//  Created by Tiago Santos on 27/12/17.
//  Copyright © 2017 Tiago Santos. All rights reserved.
//

import UIKit

class GroupsViewController: UIViewController {

    @IBOutlet weak var groupTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groupTableView.delegate = self
        groupTableView.dataSource = self
    }
    
    @IBAction func addGroupButtonWasPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "FirstStoryboard", bundle: nil)
        let createGroupViewController = storyboard.instantiateViewController(withIdentifier: "CreateGroupViewController")
        present(createGroupViewController, animated: true, completion: nil)
    }
}
