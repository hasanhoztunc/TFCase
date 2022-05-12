//
//  Content.swift
//  TFCase
//
//  Created by Hasan Oztunc on 9.05.2022.
//

import Foundation

struct Content: Codable {
    let wrapperType: String
    let collectionName: String
    let smallImage: String
    let bigImage: String
    
    enum CodingKeys: String, CodingKey {
        case wrapperType, collectionName
        case smallImage = "artworkUrl60"
        case bigImage = "artworkUrl100"
    }
}
