//
//  AppDelegate.swift
//  BugSmash
//
//  Created by Lachy Schumacher on 1/1/20.
//  Copyright © 2020 Tydewest. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        self.window!.rootViewController = TabBarController()
        return true
    }
}

