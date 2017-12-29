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
    
    func uploadPost(withMessage message: String, forUID uid: String, withGroupKey groupKey: String?, sendComplete: @escaping (_ status: Bool) -> ()) {
        if groupKey != nil {
            // Send to groups reference
        } else {
            getFeedUrl().childByAutoId().updateChildValues(["content": message, "senderId": uid])
            sendComplete(true)
        }
    }
    
    func getAllFeedMessages(handler: @escaping (_ messages: [Message]) -> ()) {
        self.feedReference.observeSingleEvent(of: .value) { (feedMessageSnapshot) in
            var messageArray = [Message]()
            guard let feedMessageSnapshot = feedMessageSnapshot.children.allObjects as? [DataSnapshot] else { return }
            
            for message in feedMessageSnapshot {
                let content = message.childSnapshot(forPath: "content").value as! String
                let senderId = message.childSnapshot(forPath: "senderId").value as! String
                
                let message = Message(content: content, senderId: senderId)
                messageArray.append(message)
            }
            
            handler(messageArray)
        }
    }
    
    func getUsername(forUID uid: String, handler: @escaping (_ username: String) -> ()) {
        self.usersReference.observeSingleEvent(of: .value) { (userSnapshot) in
            guard let userSnapshot = userSnapshot.children.allObjects as? [DataSnapshot] else { return }
            
            for user in userSnapshot {
                if user.key == uid {
                    handler(user.childSnapshot(forPath: "email").value as! String)
                }
            }
        }
    }
    
    func getEmail(forSearchQuery query: String, handler: @escaping (_ emailArray: [String]) -> ()) {
        var emailArray = [String]()
        
        getUsersUrl().observe(.value) { (userSnapshot) in
            guard let userSnapshot = userSnapshot.children.allObjects as? [DataSnapshot] else { return }
            
            for user in userSnapshot {
                let email = user.childSnapshot(forPath: "email").value as! String
                
                if email.contains(query) && email != Auth.auth().currentUser?.email {
                    emailArray.append(email)
                }
            }
            handler(emailArray)
        }
    }
    
    func getIds(forUserNames usernames: [String], handler: @escaping (_ uidArray: [String]) -> ()) {
        getUsersUrl().observeSingleEvent(of: .value) { (userSnapshot) in
            var idArray = [String]()
            guard let userSnapshot = userSnapshot.children.allObjects as? [DataSnapshot] else { return }
            
            for user in userSnapshot {
                let email = user.childSnapshot(forPath: "email").value as! String
                
                if usernames.contains(email) {
                    idArray.append(user.key)
                }
            }
            handler(idArray)
        }
    }
    
    func createGroup(withTitle title: String, andDescription description: String, forUserIds ids: [String], handler: @escaping (_ groupCreated: Bool) -> ()) {
        getGroupsUrl().childByAutoId().updateChildValues(["title": title, "description": description, "members": ids])
        handler(true)
    }
    
    func getAllGroups(handler: @escaping (_ groupArray: [Group]) -> ()) {
        var groupArray = [Group]()
        getGroupsUrl().observeSingleEvent(of: .value) { (groupSnapshot) in
            guard let groupSnapshot = groupSnapshot.children.allObjects as? [DataSnapshot] else { return }
            
            for group in groupSnapshot {
                let memberArray = group.childSnapshot(forPath: "members").value as! [String]
                if memberArray.contains((Auth.auth().currentUser?.uid)!) {
                    let groupTitle = group.childSnapshot(forPath: "title").value as! String
                    let groupDescription = group.childSnapshot(forPath: "description").value as! String
                    let group = Group(title: groupTitle, description: groupDescription, key: group.key, memberCount: memberArray.count, members: memberArray)
                    groupArray.append(group)
                }
            }
            handler(groupArray)
        }
    }
}
