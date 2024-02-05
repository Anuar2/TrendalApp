//
//  AccountService.swift
//  TrendalApp
//
//  Created by User on 05.02.2024.
//

import Foundation
import Combine
import Alamofire

class AccountService: ObservableObject {
    @Published private(set) var authToken: String?
    @Published private(set) var accessPin: String?
    
    @Published var currentUser: User = .init(phone: DataStorage.shared.string(forKey: .fullPhoneNumber) ?? "")
    
    @Published var isLockViewPresented = false
    @Published var isLockChangeViewPresented = false
    
    static let shared = AccountService()
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    var hasAuthToken: Bool {
        return DataStorage.shared.string(forKey: .authTokenKey) != nil
    }
    
    var hasAccessPin: Bool {
        return DataStorage.shared.string(forKey: .accessPinKey) != nil
    }
    
    var isPinNeeded: Bool {
        return authToken != nil && accessPin == nil
    }
    
    private init() {
        self.getData()
        
        // BUG!!!
        if authToken != nil {
            self.getUserRequest()
        }
    }
    
    private func getData() {
        self.authToken = DataStorage.shared.string(forKey: .authTokenKey)
        self.accessPin = DataStorage.shared.string(forKey: .accessPinKey)
        
        self.isLockViewPresented = authToken != nil
    }
    
    func activatePin() {
        self.isLockChangeViewPresented = true
    }
    
    private func removeData() {
        DataStorage.shared.remove(forKey: .authTokenKey)
        DataStorage.shared.remove(forKey: .accessPinKey)
        DataStorage.shared.remove(forKey: .fullPhoneNumber)
        DataStorage.shared.remove(forKey: .currentShop)
        
        self.authToken = nil
        self.accessPin = nil
        self.currentUser = .init(phone: DataStorage.shared.string(forKey: .fullPhoneNumber) ?? "")
    }
    
    func writeAuthToken(_ token: String) {
        DataStorage.shared.set(value: token, forKey: .authTokenKey)
        print("token written /(token)")
    }
    
    private func writeAccessPin(_ pin: String) {
        guard let token = DataStorage.shared.string(forKey: .authTokenKey) else { return }
        DataStorage.shared.set(value: pin, forKey: .accessPinKey)
        self.accessPin = pin
        self.authToken = token
    }
    
    func registerWithPinRequest(newPin: String) {
//        let params: Parameters = [ "newPin" : newPin, "oldPin" : accessPin ?? ""]
//        let endpoint = ApiRouter.Auth.changePin(params: params)
//        
//        APIClient.fetchPublisher(endpoint, KeyResponse.self)
//            .sink { _ in
//                self.writeAccessPin(newPin)
//                
//                // fix me
//                self.isLockChangeViewPresented = false
//            }
//            .store(in: &cancellableSet)
    }
    
    func getUserRequest() {
//        APIClient.fetchPublisher(ApiRouter.UserRouter.getUser, User.self)
//            .sink { user in
//                guard let user = user.value else { return }
//                self.currentUser = user
//                DataStorage.shared.set(value: user.phone, forKey: .fullPhoneNumber)
//                print("User received")
//            }
//            .store(in: &cancellableSet)
    }
    
    func updateUserRequest(_ username: String, _ lastname: String, _ phone: String) {
        
//        let params: Parameters = [ "firstname" : username, "lastname" : lastname]
//        APIClient.fetchPublisher(ApiRouter.UserRouter.updateUser(params: params), User.self)
//            .sink { user in
//                guard let user = user.value else { return }
//                self.currentUser = user
//                print("User updated")
//            }
//            .store(in: &cancellableSet)
    }
    
    func logoutRequest() {
        removeData()
//        APIClient.fetchPublisherEmpty(ApiRouter.Auth.logout)
//            .sink { [weak self] _ in self?.removeData() }
//            .store(in: &cancellableSet)
    }
}
