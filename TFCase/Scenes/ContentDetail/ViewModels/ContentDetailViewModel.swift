//
//  ContentDetailViewModel.swift
//  TFCase
//
//  Created by Hasan Oztunc on 9.05.2022.
//

import Foundation

final class ContentDetailViewModel: TFViewModel {
    
    weak var delegate: ContentDetailViewModelDelegate?
    var content: Content?
}
