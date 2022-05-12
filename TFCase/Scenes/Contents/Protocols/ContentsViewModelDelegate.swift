//
//  ContentsViewModelDelegate.swift
//  TFCase
//
//  Created by Hasan Oztunc on 9.05.2022.
//

import Foundation

protocol ContentsViewModelDelegate: TFViewModelDelegate, TFControllerProtocol {
    func contentsDidFetchSuccessfully(_ contents: [[ContentCollectionViewCellViewModel]])
    func contentsDidFetchWithError()
    func navigateToDetail(with data: Content)
}
