//
//  CreateGroupViewControllerExtension.swift
//  Breakpoint
//
//  Created by Tiago Santos on 29/12/17.
//  Copyright © 2017 Tiago Santos. All rights reserved.
//

import UIKit

extension CreateGroupViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell") as? UserCell else { return UITableViewCell() }
        let profileImage = UIImage(named: "defaultProfileImage")
        cell.configureCell(profileImage: profileImage!, email: emailArray[indexPath.row], isSelected: true)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

extension CreateGroupViewController: UITextFieldDelegate {
    
}
