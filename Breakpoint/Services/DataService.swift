//
//  DataService.swift
//  Breakpoint
//
//  Created by Tiago Santos on 26/12/17.
//  Copyright © 2017 Tiago Santos. All rights reserved.
//

import Foundation
import Firebase

class DataService {
    private let databaseUrl: DatabaseReference!
    private let usersReference: DatabaseReference!
    private let groupsReference: DatabaseReference!
    private let feedReference: DatabaseReference!
    
    init() {
        databaseUrl = Database.database().reference()
        usersReference = databaseUrl.child("users")
        groupsReference = databaseUrl.child("groups")
        feedReference = databaseUrl.child("feed")
    }
    
    func getDatabaseUrl() -> DatabaseReference {
        return databaseUrl
    }
    
    func getUsersUrl() -> DatabaseReference {
        return usersReference
    }
    
    func getGroupsUrl() -> DatabaseReference {
        return groupsReference
    }
    
    func getFeedUrl() -> DatabaseReference {
        return feedReference
    }
    
    func createDatabaseUser(uniqueId: String, userData: Dictionary<String, Any>) {
        usersReference.child(uniqueId).updateChildValues(userData)
    }
}
