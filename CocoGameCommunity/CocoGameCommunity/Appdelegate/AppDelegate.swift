//
//  AppDelegate.swift
//  CocoGameCommunity
//
//  Created by student on 2018/12/26.
//  Copyright © 2018年 余鑫. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // 创建窗口
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        sleep(2)
        
        // 创建视图
        let community = CommunityViewController()
        let gamelibrary = GameLibraryViewController()
        let friend = FriendViewController()
        let personalCenter = PersonalCenterViewController()
        
        // 设置视图属性
        community.tabBarItem = UITabBarItem(title: "论坛", image: UIImage(named: "community.png")?.withRenderingMode(.alwaysOriginal), selectedImage: nil)
        community.title = "论坛"
        gamelibrary.tabBarItem = UITabBarItem(title: "游戏库", image: nil, selectedImage: nil)
        gamelibrary.title = "游戏库"
        friend.tabBarItem = UITabBarItem(title: "好友", image: nil, selectedImage: nil)
        friend.title = "好友"
        personalCenter.tabBarItem = UITabBarItem(title: "个人中心", image: UIImage(named: "man.png")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "woman.png")?.withRenderingMode(.alwaysOriginal))
        personalCenter.title = "个人中心"
        
        // 创建导航控制器
        let navCommunity = UINavigationController(rootViewController: community)
        navCommunity.navigationBar.isHidden = true
        let navGameLibrary = UINavigationController(rootViewController: gamelibrary)
        navGameLibrary.navigationBar.isHidden = true
        let navFriend = UINavigationController(rootViewController: friend)
        navFriend.navigationBar.isHidden = true
        let navPersonalCenter = UINavigationController(rootViewController: personalCenter)
        navPersonalCenter.navigationBar.isHidden = true
        
        // 创建分栏控制器
        let tabbar = UITabBarController()
        tabbar.viewControllers = [navCommunity, navGameLibrary, navFriend, navPersonalCenter]
        
        window?.rootViewController = tabbar
        
        NSLog("appdelegate")
        
        return true
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "CocoGameCommunity")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

