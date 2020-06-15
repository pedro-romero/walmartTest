//
//  StoreAPI.swift
//  walmartTest
//
//  Created by Pedro Iván Romero Ojeda on 6/15/20.
//  Copyright © 2020 piro. All rights reserved.
//

import Foundation
import Alamofire

public protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var encoding: ParameterEncoding { get }
    var parameters: Parameters? { get }
    var jsonDecoder: JSONDecoder { get }
}

public extension APIConfiguration {
    var jsonDecoder: JSONDecoder {
        get {
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            return jsonDecoder
        }
    }
}

enum StoreApi: APIConfiguration {
    case stores
    
    var method: HTTPMethod {
        switch self {
        case .stores:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .stores:
            return "\(Config.baseUrl)/walmart-services/mg/address/storeLocatorCoordinates"
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .stores:
            return URLEncoding.default
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .stores:
            return nil
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = try URLRequest(url: path, method: method)
        urlRequest = try encoding.encode(urlRequest, with: parameters)
        return urlRequest
    }
}

extension Store {
    static func stores(completion: @escaping (Swift.Result<[Store], Error>) -> Void) {
        Alamofire.request(StoreApi.stores).validate()
            .responseData { (response) in
                switch response.result {
                case .success(let data):
                    let decoder = StoreApi.stores.jsonDecoder
                    do {
                        let stores = try decoder.decode(StoreResponse.self, from: data)
                        completion(.success(stores.responseArray))
                    } catch {
                        print(error.localizedDescription)
                        completion(.failure(error))
                    }
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                    completion(.failure(error))
                }
        }
    }
}
