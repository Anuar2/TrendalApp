//
//  User.swift
//  TrendalApp
//
//  Created by User on 05.02.2024.
//

import Foundation

struct User: Decodable {
    let phone: String
    var firstname: String?
    var lastname: String?
    
    private enum CodingKeys : String, CodingKey {
        case phone = "cellphone"
        case firstname, lastname
    }
}

extension User {
    var fullname: String {
        if lastname == nil && firstname == nil {
            return "Личная информация"
        }
        
        return "\(lastname ?? "") \(firstname ?? "")".trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var username: String {
        if lastname == nil && firstname == nil { return "" }
        if firstname == nil { return lastname?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "" }
        return firstname?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
    }
}
