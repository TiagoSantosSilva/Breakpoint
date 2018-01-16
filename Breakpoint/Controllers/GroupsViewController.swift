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
    
    var groupArray = [Group]()
    var dataService: DataService!
    
    override func viewDidLoad() {
        dataService = DataService()
        super.viewDidLoad()
        groupTableView.delegate = self
        groupTableView.dataSource = self
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidAppear(_ animated: Bool) {
        dataService.getGroupsUrl().observe(.value) { (dataSnapshot) in
            super.viewDidAppear(animated)
            self.dataService.getAllGroups { (groupArray) in
                self.groupArray = groupArray
                self.groupTableView.reloadData()
            }
        }
    }
    
    @IBAction func addGroupButtonWasPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "FirstStoryboard", bundle: nil)
        let createGroupViewController = storyboard.instantiateViewController(withIdentifier: "CreateGroupViewController")
        present(createGroupViewController, animated: true, completion: nil)
    }
}
