//
//  File.swift
//  TrendalApp
//
//  Created by User on 05.02.2024.
//

import Foundation
import Alamofire

class NetworkLogger: EventMonitor {
    let queue = DispatchQueue(label: "com.by.networklogger")
    
    func request(_ request: Request, didCreateTask task: URLSessionTask) {
        print("\n")

        if let headersDescription = request.request?.headers {
            print("-----------REQUEST CREATED----------")
            print("\(request.description)")
            print(".............///...")
            print("\n")
            print("----------HEADERS:---------")
            print("\(headersDescription)")
            print(".......................")
        }
                
        if let requestBody = request.request?.httpBody {
            print("-------------/BODY/------------------//")
            
            if let dataString = NSString(data: requestBody, encoding: String.Encoding.utf8.rawValue) {
                print(dataString)
            }
            
            print("//...........BODY-END.............//")
        }
        print("\n")
    }
    
    func requestDidFinish(_ request: Request) {
        print("//------------/REQUEST RESPONSE-----------//")
        print("\(request.description)")
        print("//..........RESPONSE-END..........//")
        print("\n")
    }
    
    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        guard let data = response.data else { return }
        
        print("------------------/ JSON DATA /-----------------")
        print(data.prettyPrintedJsonString ?? "Nothing, but ...\(data.debugDescription)")
        print("/................./JSON DATA END/.............../")
        print("\n")
    }
}

extension Data {
    var prettyPrintedJsonString: String? {
        if #available(iOS 13.0, *) {
            guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
                  let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted, .sortedKeys, .withoutEscapingSlashes]),
                  let prettyPrintedString = String(data: data, encoding: .utf8) else { return nil }
            
            return prettyPrintedString
        } else {
            guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
                  let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
                  let prettyPrintedString = String(data: data, encoding: .utf8) else { return nil }
            
            return prettyPrintedString
        }
    }
}
