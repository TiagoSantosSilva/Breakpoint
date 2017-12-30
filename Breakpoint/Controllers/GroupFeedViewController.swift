//
//  GroupFeedViewController.swift
//  Breakpoint
//
//  Created by Tiago Santos on 30/12/17.
//  Copyright © 2017 Tiago Santos. All rights reserved.
//

import UIKit
import Firebase

class GroupFeedViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var groupTitleLabel: UILabel!
    @IBOutlet weak var groupMembersLabel: UILabel!
    @IBOutlet weak var sendMessageButtonView: UIView!
    @IBOutlet weak var messageField: InsetTextField!
    @IBOutlet weak var sendButton: UIButton!
    
    var group: Group?
    var groupMessages = [Message]()
    var dataService: DataService!
    
    override func viewDidLoad() {
        dataService = DataService()
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
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
        
        dataService.getGroupsUrl().observe(.value) { (snapshot) in
            self.dataService.getAllMessagesFor(desiredGroup: self.group!, handler: { (returnedGroupMessages) in
                self.groupMessages = returnedGroupMessages
                self.tableView.reloadData()
                
                if self.groupMessages.count > 0 {
                    self.tableView.scrollToRow(at: IndexPath(row: self.groupMessages.count - 1, section: 0), at: .none, animated: true)
                }
            })
        }
    }
    
    @IBAction func backButtonWasPressed(_ sender: Any) {
        dismissDetail()
    }
    
    
    @IBAction func sendButtonWasPressed(_ sender: Any) {
        if messageField.text != "" {
            messageField.isEnabled = false
            sendButton.isEnabled = false
            dataService.uploadPost(withMessage: messageField.text!, forUID: (Auth.auth().currentUser?.uid)!, withGroupKey: group?.key, sendComplete: { (complete) in
                if complete {
                    self.messageField.text = ""
                    self.messageField.isEnabled = true
                    self.sendButton.isEnabled = true
                }
            })
        }
    }
}
