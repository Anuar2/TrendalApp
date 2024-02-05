//
//  Endpoint.swift
//  TrendalApp
//
//  Created by User on 05.02.2024.
//

import Foundation
import Combine
import Alamofire

protocol Endpoint: URLRequestConvertible  {
    var method: Alamofire.HTTPMethod { get }
    var path: String { get }
    var headers: HTTPHeaders? { get }
    
    var baseUrl: URL { get }
    var fullUrl: URL { get }
    
    var parameterEncoding: Alamofire.ParameterEncoding { get }
    var params: [String: Any]? { get }
    
    var customBaseUrl: URL? { get }
    //яндекс апи
}

extension Endpoint {
    var customBaseUrl: URL? { return nil }
    var baseUrl: URL { return customBaseUrl ?? ApiRouter.BaseURL }
    var fullUrl: URL { return self.baseUrl.appendingPathComponent(path) }

    var headers: HTTPHeaders? { return nil }
    
    var parameterEncoding: Alamofire.ParameterEncoding {
        if case .get = method { return URLEncoding.default } else { return JSONEncoding.default }
    }
    var params: [String: Any]? { return nil }
    
    public func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: self.fullUrl)
        urlRequest.httpMethod = method.rawValue
        
        if let customHeader = headers {
            urlRequest.headers = customHeader
        }
        
        return try parameterEncoding.encode(urlRequest, with: params)
    }
}

struct ApiRouter {
    static let BaseURL = URL(string: "http://195.49.210.47/api/")!
}
