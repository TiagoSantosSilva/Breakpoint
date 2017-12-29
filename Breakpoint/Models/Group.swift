//
//  Group.swift
//  Breakpoint
//
//  Created by Tiago Santos on 29/12/17.
//  Copyright © 2017 Tiago Santos. All rights reserved.
//

import Foundation

struct Group {
    private var title: String
    private var description: String
    private var key: String
    private var memberCount: Int
    private var members: [String]
    
    init(title: String, description: String, key: String, memberCount: Int, members: [String]) {
        self.title = title
        self.description = description
        self.key = key
        self.memberCount = memberCount
        self.members = members
    }
}
