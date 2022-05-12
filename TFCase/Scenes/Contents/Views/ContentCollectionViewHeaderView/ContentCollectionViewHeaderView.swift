//
//  ContentCollectionViewHeaderView.swift
//  TFCase
//
//  Created by Hasan Oztunc on 12.05.2022.
//

import Foundation
import UIKit

final class ContentCollectionViewHeaderView: UICollectionReusableView {
   
   @IBOutlet private weak var titleLabel: UILabel!
   
   func configureView(with title: String) {
      self.titleLabel.text = title
   }
}
