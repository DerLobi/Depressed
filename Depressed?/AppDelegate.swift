//
//  AppDelegate.swift
//  Depressed?
//
//  Created by Christian Lobach on 27/10/15.
//  Copyright © 2015 Christian Lobach. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        window?.tintColor = UIColor(red:0.44, green:0.24, blue:0.78, alpha:1)
        UINavigationBar.appearance().titleTextAttributes = [
            NSForegroundColorAttributeName: UIColor.whiteColor()
        ]
        
        return true
    }

}

