//
//  UserDefaultsStorage.swift
//  TrendalApp
//
//  Created by User on 05.02.2024.
//

import Foundation

class UserDefaultsStorage: StorageProtocol {
    private let defaults = UserDefaults.standard
    
    func set(value: Any, forKey key: String) {
        defaults.set(value, forKey: key)
    }
    
    func data(forKey key: String) -> Data? {
        return defaults.data(forKey: key)
    }
    
    func string(forKey key: String) -> String? {
        return defaults.string(forKey: key)
    }
    
    func remove(forKey key: String) {
        defaults.removeObject(forKey: key)
    }
}
