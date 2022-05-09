//
//  TFServiceRouter.swift
//  TFCase
//
//  Created by Hasan Oztunc on 9.05.2022.
//

import Foundation
import Alamofire

enum TFServiceRouter {
    case search(text: String, page: Int)
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        switch self {
        case .search(let searchText, let page):
            if let urlEncodedSearchText = searchText.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
                return "search?" + "term=" + urlEncodedSearchText + "&offset=" + "\(page * 25)" + "&limit=25"
            } else {
                return "search"
            }
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try (ServiceConstants.baseUrl + path).asURL()
        
        var urlRequest = URLRequest(url: url)
        urlRequest.method = method
        
        return urlRequest
    }
}
