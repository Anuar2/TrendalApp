//
//  Router+Auth.swift
//  TrendalApp
//
//  Created by User on 05.02.2024.
//

import Foundation
import Alamofire

extension ApiRouter {
    
    enum Auth: Endpoint {
        case loginStart(params: Parameters)
        case authComplete(params: Parameters, smsTokenHeader: String)
        
        case changePin(params: Parameters)
        case checkPin(params: Parameters)
        
        case logout
        
        var method: HTTPMethod {
            switch self {
            case .logout:
                return .delete
            default:
                return .post
            }
        }
        
        var path: String {
            switch self {
            case .loginStart:
                return "auth/start"
            case .authComplete:
                return "auth/complete"
            case .changePin:
                return "auth/pin/change"
            case .logout:
                return "auth/logout"
            case .checkPin:
                return "/auth/pin/check"
            }
        }
        
        var headers: HTTPHeaders? {
            switch self {
            case let .authComplete(_, header):
                return ["smsToken": header]
            default: return nil
            }
        }
        
        var params: [String : Any]? {
            switch self {
            case .loginStart(let params):
                return params
            case let .authComplete(params, _):
                return params
            case .changePin(let params):
                return params
            case .checkPin(let params):
                return params
                
            default: return nil
            }
        }
    }
}

