//
//  AppDelegate.swift
//  TFCase
//
//  Created by Hasan Oztunc on 9.05.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        app.router.startTheApp()
        
        return true
    }
}

