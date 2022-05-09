//
//  ContentCollectionViewCell.swift
//  TFCase
//
//  Created by Hasan Oztunc on 9.05.2022.
//

import Foundation
import UIKit

final class ContentCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var contentImageView: UIImageView!
    @IBOutlet private weak var contentNameLabel: UILabel!
    
    func configureCell(with viewModel: ContentCollectionViewCellViewModel) {
        self.contentNameLabel.text = viewModel.contentName
    }
}
