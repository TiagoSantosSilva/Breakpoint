//
//  FeedViewController.swift
//  Breakpoint
//
//  Created by Tiago Santos on 27/12/17.
//  Copyright © 2017 Tiago Santos. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var messageArray = [Message]()
    var dataService: DataService!
    
    override func viewDidLoad() {
        self.dataService = DataService()
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        dataService.getAllFeedMessages { (returnedMessageArray) in
            self.messageArray = returnedMessageArray.reversed()
            self.tableView.reloadData()
        }
    }
    
    @IBAction func postSomethingButtonWasTapped(_ sender: Any) {
        let postMessageViewController = PostMessageViewController()
        present(postMessageViewController, animated: true, completion: nil)
    }
    
    
}
