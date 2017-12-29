//
//  UserCell.swift
//  Breakpoint
//
//  Created by Tiago Santos on 29/12/17.
//  Copyright © 2017 Tiago Santos. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var checkImage: UIImageView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(profileImage image: UIImage, email: String, isSelected: Bool) {
        self.profileImage.image = image
        self.emailLabel.text = email
        
        if isSelected {
            self.checkImage.isHidden = false
        } else {
            self.checkImage.isHidden = true
        }
    }
}
