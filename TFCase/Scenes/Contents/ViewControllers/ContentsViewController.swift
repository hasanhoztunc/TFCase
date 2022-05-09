//
//  ViewController.swift
//  TFCase
//
//  Created by Hasan Oztunc on 9.05.2022.
//

import UIKit

final class ContentsViewController: TFViewController<ContentsViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.delegate = self
    }
}

extension ContentsViewController: ContentsViewModelDelegate {
    
}
