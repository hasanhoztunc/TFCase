//
//  ContentCollectionViewCell.swift
//  TFCase
//
//  Created by Hasan Oztunc on 9.05.2022.
//

import Foundation
import UIKit
import Kingfisher

final class ContentCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var contentImageView: UIImageView!
    @IBOutlet private weak var contentNameLabel: UILabel!
    
    func configureCell(with viewModel: ContentCollectionViewCellViewModel) {
        self.contentImageView.kf.setImage(with: try? viewModel.contentImage.asURL())
        self.contentNameLabel.text = viewModel.contentName
    }
}
