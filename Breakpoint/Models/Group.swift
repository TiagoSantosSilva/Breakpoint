//
//  Group.swift
//  Breakpoint
//
//  Created by Tiago Santos on 29/12/17.
//  Copyright © 2017 Tiago Santos. All rights reserved.
//

import Foundation

struct Group {
    public private(set) var title: String
    public private(set) var description: String
    public private(set) var key: String
    public private(set) var memberCount: Int
    public private(set) var members: [String]
    
    init(title: String, description: String, key: String, memberCount: Int, members: [String]) {
        self.title = title
        self.description = description
        self.key = key
        self.memberCount = memberCount
        self.members = members
    }
}
