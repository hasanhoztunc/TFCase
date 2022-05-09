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
        
        self.prepareUI()
        
        if viewModel == nil {
            self.viewModel = ViewModel()
        }
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        self.viewModel.prepare()
        
        super.viewWillAppear(animated)
    }
    
    func prepareUI() {
        
    }
}
