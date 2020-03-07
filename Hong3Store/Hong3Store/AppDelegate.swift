//
//  AppDelegate.swift
//  Hong3Strore
//
//  Created by Hongdonghyun on 2020/02/28.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let appViewController = UINavigationController(rootViewController: AppViewController())
        let gameViewController = UINavigationController(rootViewController: GameViewController())
        let searchViewController = UINavigationController(rootViewController: SearchViewController())
        let tabBarController = UITabBarController()
        
        appViewController.tabBarItem = UITabBarItem(title: "앱", image: UIImage(systemName: "square.stack.3d.up.fill"), tag: 0)
        gameViewController.tabBarItem = UITabBarItem(title: "게임", image: UIImage(systemName: "gamecontroller.fill"), tag: 1)
        searchViewController.tabBarItem = UITabBarItem(title: "검색", image: UIImage(systemName: "magnifyingglass"), tag: 2)
        window = UIWindow(frame: UIScreen.main.bounds)
        
        tabBarController.viewControllers = [gameViewController, appViewController, searchViewController]
        tabBarController.selectedIndex = 1
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()

        return true
    }
}

