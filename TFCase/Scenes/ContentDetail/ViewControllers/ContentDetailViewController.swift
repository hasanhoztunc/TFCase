//
//  ContentDetailViewController.swift
//  TFCase
//
//  Created by Hasan Oztunc on 9.05.2022.
//

import Foundation

final class ContentDetailViewController: TFViewController<ContentDetailViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.delegate = self
    }
}

extension ContentDetailViewController: ContentDetailViewModelDelegate {
    
}
