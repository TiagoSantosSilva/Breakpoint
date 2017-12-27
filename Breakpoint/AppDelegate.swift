//
//  AppDelegate.swift
//  Breakpoint
//
//  Created by Tiago Santos on 26/12/17.
//  Copyright © 2017 Tiago Santos. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FirebaseApp.configure()
        let storyboard = UIStoryboard(name: "FirstStoryboard", bundle: nil)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let tabBarController = UITabBarController()
        tabBarController.tabBar.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2705882353, blue: 0.3137254902, alpha: 1)
        tabBarController.tabBar.tintColor = #colorLiteral(red: 0.4922404289, green: 0.7722371817, blue: 0.4631441236, alpha: 1)
        tabBarController.tabBar.unselectedItemTintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        
        let feedViewController = storyboard.instantiateViewController(withIdentifier: "FeedViewController")
        feedViewController.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(named: "feed-tabIcon"), tag: 1)
        
        let groupsViewController = storyboard.instantiateViewController(withIdentifier: "GroupsViewController")
        groupsViewController.tabBarItem = UITabBarItem(title: "Groups", image: UIImage(named: "groups-tabIcon"), tag: 2)
        
        let profileViewController = storyboard.instantiateViewController(withIdentifier: "ProfileViewController")
        profileViewController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "me-tabIcon"), tag: 3)
        
        let controllers = [feedViewController, groupsViewController, profileViewController]
        tabBarController.viewControllers = controllers
        
        window?.rootViewController = tabBarController
        
        if Auth.auth().currentUser == nil {
            let authenticationViewController = AuthenticationViewController()
            window?.rootViewController?.present(authenticationViewController, animated: true, completion: nil)
        }
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}

