//
//  FeedTableViewCell.swift
//  Breakpoint
//
//  Created by Tiago Santos on 27/12/17.
//  Copyright © 2017 Tiago Santos. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    func configureCell(profileImage: UIImage, email: String, content: String) {
        self.profileImage.image = profileImage
        self.emailLabel.text = email
        self.messageLabel.text = content
    }
}
