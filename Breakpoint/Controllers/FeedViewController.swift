//
//  FeedViewController.swift
//  Breakpoint
//
//  Created by Tiago Santos on 27/12/17.
//  Copyright © 2017 Tiago Santos. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func postSomethingButtonWasTapped(_ sender: Any) {
        let postMessageViewController = PostMessageViewController()
        present(postMessageViewController, animated: true, completion: nil)
    }
}
