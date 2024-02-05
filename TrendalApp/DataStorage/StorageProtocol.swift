//
//  StorageProtocol.swift
//  TrendalApp
//
//  Created by User on 05.02.2024.
//

import Foundation

protocol StorageProtocol {
    func set(value: Any, forKey key: String)
    func data(forKey key: String) -> Data?
    func string(forKey key: String) -> String?
    func remove(forKey key: String)
}
