//
//  AppDelegate.swift
//  NCMBMemo
//
//  Created by 樋口裕貴 on 2020/04/18.
//  Copyright © 2020 Yuki Higuchi. All rights reserved.
//

import UIKit
import NCMB


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let applicationKey  = "b102acd51af9b9aa07d84ad5033e84ce7491d6b2ca69c00edde7d60eb89369ae"
        
        let clientKey = "d048e6d6a0c422e1f1651c1349780f8928d27994f46949bb27272dc437a82de3"
        
        
       
        NCMB.setApplicationKey(applicationKey, clientKey: clientKey)
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

