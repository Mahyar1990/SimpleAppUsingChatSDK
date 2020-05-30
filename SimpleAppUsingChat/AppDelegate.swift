//
//  AppDelegate.swift
//  SimpleAppUsingChat
//
//  Created by Mahyar Zhiani on 6/10/1397 AP.
//  Copyright © 1397 Mahyar Zhiani. All rights reserved.
//

import UIKit
import FanapPodChatSDK
//import Sentry

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
//        _ = SentrySDK(options: [
//            "dsn": "https://a06c7828c36d47c7bbb24605ba5d0d26@o376741.ingest.sentry.io/5198368",
//            "debug": true // Enabled debug when first installing is always helpful
//        ])
//        Chat.sharedInstance.runSentrySDK()
        window?.rootViewController = UINavigationController(rootViewController: MyViewController())
        
//        print("Chat init is called. \n here we will start using Sentry package")
//        SentrySDK.start(options: [
//            "dsn": "https://a06c7828c36d47c7bbb24605ba5d0d26@o376741.ingest.sentry.io/5198368",
//            "debug": true // Helpful to see what's going on. (Enabled debug when first installing is always helpful)
//        ])
        
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

