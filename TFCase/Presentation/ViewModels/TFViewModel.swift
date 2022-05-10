//
//  TFViewModel.swift
//  TFCase
//
//  Created by Hasan Oztunc on 9.05.2022.
//

import Foundation

open class TFViewModel {
    
    required public init() {
        self.prepare()
    }
    
    func prepare() {
        
    }
    
    func showIndicator(in viewController: TFViewModelDelegate?) {
        if (viewController as AnyObject?) is TFControllerProtocol {
            let vc = viewController as! TFControllerProtocol
            vc.showIndicator()
        }
    }
    
    func hideIndicator(in viewController: TFViewModelDelegate?) {
        if (viewController as AnyObject?) is TFControllerProtocol {
            let vc = viewController as! TFControllerProtocol
            vc.hideIndicator()
        }
    }
}
