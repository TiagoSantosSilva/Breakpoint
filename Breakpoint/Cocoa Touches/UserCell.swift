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
    
    var showing = false
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            if showing {
                checkImage.isHidden = true
                showing = false
            } else {
                checkImage.isHidden = false
                showing = true
            }
        }
    }
    
    func configureCell(profileImage image: UIImage, email: String, isSelected: Bool) {
        self.profileImage.image = image
        self.emailLabel.text = email
        
        if isSelected {
            checkImage.isHidden = false
        } else {
            checkImage.isHidden = true
        }
    }
}
