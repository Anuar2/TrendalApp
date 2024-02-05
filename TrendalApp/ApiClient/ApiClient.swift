//
//  ApiClient.swift
//  TrendalApp
//
//  Created by User on 05.02.2024.
//

import Foundation
import Combine
import Alamofire

struct BackendError: Codable, Error {
    var status: String
    var message: String
}

enum CFError: Error, LocalizedError {
//    var id: String { localizedDescription }
    case urlError(URLError)
    case responseError((Int, String))
    case decodingError(DecodingError)
    case genericError
    
    var localizedDescription: String {
        return "localized Errors"
    }
}

final class APIClient {
    fileprivate static var session: Session!
    static let defaultHeaders: HTTPHeaders = [.defaultAcceptEncoding, .defaultUserAgent]
    
    fileprivate static func client() -> Session {
        if session == nil {
            let delegate = SessionDelegate(fileManager: .default)
            let rootQueue = DispatchQueue(label: "com.app.session.rootQueue")
            let networkLogger = NetworkLogger()
            
            let conf: URLSessionConfiguration = {
                let configuration = URLSessionConfiguration.default
                configuration.headers = APIClient.defaultHeaders
                configuration.timeoutIntervalForRequest = 60
                configuration.timeoutIntervalForResource = 60
                return configuration
            }()
            
            let interceptor = CFInterceptor()
            self.session = Session(configuration: conf,
                                   delegate: delegate,
                                   rootQueue: rootQueue,
                                   startRequestsImmediately: true,
                                   interceptor: interceptor,
                                   eventMonitors: [networkLogger])
            return session
        }
        
        return session
    }
    
    static func fetchPublisher<T: Decodable>(_ endpoint: Endpoint, _ type: T.Type) -> AnyPublisher<DataResponse<T, CFError>, Never> {
        return client()
            .request(endpoint)
            .customValidate()
            .publishDecodable(type: T.self)
            .map { response in
                response.mapError { error in
//                    guard let httpResponse = response as? HTTPURLResponse,
//                          200...299 ~= httpResponse.statusCode else {
//                        return BYError.genericError
//                    }
//                    let backendError = response.data.flatMap { try? JSONDecoder().decode(BackendError.self, from: $0)}
                    
                    return CFError.genericError
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    static func fetchPublisherEmpty(_ endpoint: Endpoint) -> AnyPublisher<Void, Never> {
        return client()
            .request(endpoint)
            .customValidate()
            .publishDecodable(type: Empty.self, emptyResponseCodes: [200])
            .map { $0.value == nil ? () : () }
//            .map { $0.data == nil ? () : () }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    static func fetchAsyncEmpty(_ endpoint: Endpoint) async throws -> Void {
        let _ = try await client()
            .request(endpoint)
            .customValidate()
            .serializingDecodable(Empty.self, emptyResponseCodes: [200])
            .value
        return
    }
    
    static func fetchAsync<T: Decodable>(_ endpoint: Endpoint, _ model: T.Type) async throws -> T {
        let model = try await client()
            .request(endpoint)
            .customValidate()
            .serializingDecodable(T.self, emptyResponseCodes: [200])
            .value
        return model
    }
    
//        guard let httpResponse = response as? HTTPURLResponse,
//              200...299 ~= httpResponse.statusCode else {
//            throw BYError.responseError(
//                ((response as? HTTPURLResponse)?.statusCode ?? 500,
//                 String(data: data, encoding: .utf8) ?? ""))
//        }
    
    // Асинхронная выборка на основе URL с сообщениями об ошибках
}

extension DataRequest {
    func customValidate() -> Self {
        return self.validate { request, response, data -> Request.ValidationResult in
            let statusCode = response.statusCode
            if statusCode == 401 || statusCode == 403 {
                return .failure(CFError.responseError((statusCode, "ошибка")))
            } else {
                return .success(())
            }
        }
    }
}
