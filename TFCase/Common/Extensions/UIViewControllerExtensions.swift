//
//  UIViewControllerExtensions.swift
//  TFCase
//
//  Created by Hasan Oztunc on 9.05.2022.
//

import Foundation
import UIKit

extension UIViewController {
    
    func navigate<ViewController: UIViewController>(from: ViewController,
                                                    to storyboard: Storyboards,
                                                    configuration: ((UIViewController) -> Void)? = nil) {
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        guard let viewController = storyboard.instantiateInitialViewController() else {
            return
        }
        
        configuration?(viewController)
        
        from.navigationController?.pushViewController(viewController, animated: true)
    }
}
