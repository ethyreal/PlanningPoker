//
//  AppDelegate.swift
//  PlanningPoker
//
//  Created by George Webster on 1/6/20.
//  Copyright © 2020 George Webster. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var nav: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let menu = MenuViewController()
        let nav = UINavigationController(rootViewController: menu)
        window?.rootViewController = nav
        self.nav = nav
        window?.makeKeyAndVisible()
        return true
    }
}

