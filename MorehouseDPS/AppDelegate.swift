//
//  AppDelegate.swift
//  MorehouseDPS
//
//  Created by icbrahimc on 5/18/17.
//  Copyright © 2017 icbrahimc. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FBSDKCoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Facebook sdk delegate.
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
        // Firebase sdk delegate.
        FirebaseApp.configure()
        
        // The main view controller for the application.
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // Home controllers.
        let homeViewController = BookCollectionViewController()
        let homeNav = UINavigationController(rootViewController: homeViewController)
        homeNav.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "homeLib"), tag: 1)
        
        // User controllers.
        let userViewController = UserViewController()
        let userNav = UINavigationController(rootViewController: userViewController)
        userNav.tabBarItem = UITabBarItem(title: "Profile", image: #imageLiteral(resourceName: "user"), tag: 1)
        
        let navControllers = [homeNav, userNav]
        
        for navs in navControllers {
            navs.navigationBar.tintColor = UIColor.dpsGreen
            navs.navigationBar.barStyle = .blackTranslucent
        }
        
        let tabController = UITabBarController()
        tabController.viewControllers = navControllers
        tabController.tabBar.tintColor = UIColor.dpsGreen
        tabController.tabBar.backgroundColor = .black
        tabController.tabBar.barTintColor = .black
        
        self.window!.rootViewController = tabController
        self.window!.makeKeyAndVisible()
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        let handle: Bool = FBSDKApplicationDelegate.sharedInstance().application(app, open: url, options: options)
        return handle
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

