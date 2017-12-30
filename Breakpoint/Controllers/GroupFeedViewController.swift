//
//  GroupFeedViewController.swift
//  Breakpoint
//
//  Created by Tiago Santos on 30/12/17.
//  Copyright © 2017 Tiago Santos. All rights reserved.
//

import UIKit

class GroupFeedViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var groupTitleLabel: UILabel!
    @IBOutlet weak var groupMembersLabel: UILabel!
    @IBOutlet weak var sendMessageButtonView: UIView!
    @IBOutlet weak var messageField: InsetTextField!
    @IBOutlet weak var sendButton: UIButton!
    
    var group: Group?
    var dataService: DataService!
    
    override func viewDidLoad() {
        dataService = DataService()
        super.viewDidLoad()
        sendMessageButtonView.bindToKeyBoard()
    }
    
    func initData(forGroup group: Group) {
        self.group = group
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        groupTitleLabel.text = group?.title
        dataService.getEmails(group: self.group!) { (emailArray) in
            self.groupMembersLabel.text = emailArray.joined(separator: ", ")
        }
    }
    
    @IBAction func backButtonWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func sendButtonWasPressed(_ sender: Any) {
    }
}
