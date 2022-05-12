//
//  AppRouter.swift
//  TFCase
//
//  Created by Hasan Oztunc on 9.05.2022.
//

import Foundation
import UIKit

final class AppRouter {
    
    var window: UIWindow!
    
    init() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    func startTheApp() {
        let storyboard = UIStoryboard(name: Storyboards.contents.rawValue, bundle: nil)
        let viewController = storyboard.instantiateInitialViewController()
        
        self.window.rootViewController = viewController
        self.window.makeKeyAndVisible()
    }
}
