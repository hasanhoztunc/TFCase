//
//  TFService.swift
//  TFCase
//
//  Created by Hasan Oztunc on 9.05.2022.
//

import Foundation
import Alamofire

final class TFService {
    
    static let shared = TFService()
    
    private init() {}
    
    func execute<TModel: TFModel>(request: TFServiceRouter,
                                  responseModel: TModel.Type,
                                  completion: @escaping (Result<TModel, TFServiceError>) -> Void) {
        do {
            let urlRequest = try request.asURLRequest()
            
            AF.request(urlRequest).validate().responseJSON { response in
                switch response.result {
                case .success(let data):
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
                        let jsonModel = try JSONDecoder().decode(responseModel, from: jsonData)
                        completion(.success(jsonModel))
                    } catch {
                        
                    }
                case .failure:
                    completion(.failure(.badRequestError))
                }
            }
        } catch {
            completion(.failure(.badURLError))
        }
    }
}
