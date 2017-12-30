//
//  GroupFeedCell.swift
//  Breakpoint
//
//  Created by Tiago Santos on 30/12/17.
//  Copyright © 2017 Tiago Santos. All rights reserved.
//

import UIKit

class GroupFeedCell: UITableViewCell {
    
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!

    func configureCell(profileImage: UIImage, email: String, message: String) {
        self.profileImage.image = profileImage
        self.emailLabel.text = email
        self.messageLabel.text = message
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
