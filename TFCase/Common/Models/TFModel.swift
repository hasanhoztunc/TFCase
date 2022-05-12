//
//  TFModel.swift
//  TFCase
//
//  Created by Hasan Oztunc on 9.05.2022.
//

import Foundation

struct TFModel<TModel: Codable>: Codable {
    let resultCount: Int
    let results: TModel
}
