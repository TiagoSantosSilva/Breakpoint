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
    @IBOutlet weak var sendMessageButtonView: UIView!
    @IBOutlet weak var messageField: InsetTextField!
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendButton.bindToKeyBoard()
    }
    
    @IBAction func backButtonWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func sendButtonWasPressed(_ sender: Any) {
    }
}
