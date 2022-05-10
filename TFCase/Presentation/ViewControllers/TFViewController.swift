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
    
    private var indicator: UIActivityIndicatorView?
    
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

extension TFViewController: TFControllerProtocol {
    
    func showIndicator() {
        self.indicator = UIActivityIndicatorView(style: .gray)
        self.indicator?.frame.origin = CGPoint(x: self.view.frame.size.width / 2, y: self.view.frame.height / 2)
        if let indicator = indicator {
            self.view.addSubview(indicator)
            self.view.bringSubviewToFront(indicator)
        }
        self.indicator?.startAnimating()
    }
    
    func hideIndicator() {
        self.indicator?.stopAnimating()
        self.indicator?.removeFromSuperview()
        self.indicator = nil
    }
}
