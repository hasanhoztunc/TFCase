//
//  ContentDetailViewModelDelegate.swift
//  TFCase
//
//  Created by Hasan Oztunc on 9.05.2022.
//

import Foundation

protocol ContentDetailViewModelDelegate: TFViewModelDelegate {
    func updateView(with content: Content)
}
