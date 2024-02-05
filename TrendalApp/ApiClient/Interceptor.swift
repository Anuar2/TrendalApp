//
//  Interceptor.swift
//  TrendalApp
//
//  Created by User on 05.02.2024.
//

import Foundation
import Alamofire

class CFInterceptor: RequestInterceptor {
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Swift.Result<URLRequest, Error>) -> Void) {
        var urlRequest = urlRequest
        
        if let authToken = AccountService.shared.authToken {
            urlRequest.setValue(authToken, forHTTPHeaderField: "Authorization")
        }
        
        completion(.success(urlRequest))
    }
}

extension Bundle {
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
    var releaseVersionNumberPretty: String {
        return "v\(releaseVersionNumber ?? "1.0.0")"
    }
}
