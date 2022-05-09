//
//  TFViewController.swift
//  TFCase
//
//  Created by Hasan Oztunc on 9.05.2022.
//

import Foundation
import UIKit

open class TFViewController<ViewModel: TFViewModel>: UIViewController {
    
    var viewModel: ViewModel!
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        if viewModel == nil {
            self.viewModel = ViewModel()
        }
    }
}
