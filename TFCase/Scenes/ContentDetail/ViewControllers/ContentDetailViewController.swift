//
//  ContentDetailViewController.swift
//  TFCase
//
//  Created by Hasan Oztunc on 9.05.2022.
//

import Foundation
import UIKit
import Kingfisher

final class ContentDetailViewController: TFViewController<ContentDetailViewModel> {
    
    @IBOutlet private weak var contentImageView: UIImageView!
    @IBOutlet private weak var contentNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.delegate = self
    }
}

extension ContentDetailViewController: ContentDetailViewModelDelegate {
    
    func updateView(with content: Content) {
        self.contentImageView.kf.setImage(with: try? content.bigImage.asURL())
        self.contentNameLabel.text = content.collectionName
    }
}
