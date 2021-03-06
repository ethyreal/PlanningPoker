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
    var coordinator: AppCoordinator?
    let dependencies: Dependencies
    
    override init() {
        self.dependencies = Dependencies()
        super.init()
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)

        coordinator = AppCoordinator(with: dependencies)

        window?.rootViewController = coordinator?.rootController
        coordinator?.start(animated: false)
        window?.makeKeyAndVisible()
        return true
    }
}

