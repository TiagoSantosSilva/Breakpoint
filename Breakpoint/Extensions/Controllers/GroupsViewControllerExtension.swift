//
//  GroupsViewControllerExtension.swift
//  Breakpoint
//
//  Created by Tiago Santos on 29/12/17.
//  Copyright © 2017 Tiago Santos. All rights reserved.
//

import UIKit

extension GroupsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell") as? GroupCell else { return UITableViewCell() }
        let group = groupArray[indexPath.row]
        cell.configureCell(title: group.title, description: group.description, memberCount: group.memberCount)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}
