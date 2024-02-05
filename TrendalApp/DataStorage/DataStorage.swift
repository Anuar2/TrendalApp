//
//  DataStorage.swift
//  TrendalApp
//
//  Created by User on 05.02.2024.
//

import Foundation

class DataStorage {
    
    static let shared = DataStorage(storage: UserDefaultsStorage())
    
    private var storage: StorageProtocol
    
    private init(storage: StorageProtocol) {
        self.storage = storage
    }
    
    func set(value: Any, forKey key: Key) {
        storage.set(value: value, forKey: key.rawValue)
    }
    
    func data(forKey key: Key) -> Data? {
        return storage.data(forKey: key.rawValue)
    }
    
    func string(forKey key: Key) -> String? {
        return storage.string(forKey: key.rawValue)
    }
    
    func remove(forKey key: Key) {
        storage.remove(forKey: key.rawValue)
    }
    
    enum Key: String {
        case fullPhoneNumber
        case currentShop = "current_shop"
        case authTokenKey = "auth_token_key"
        case accessPinKey = "access_pin_key"
        case lattitude
        case longitude
        // другие ключи
    }
}
