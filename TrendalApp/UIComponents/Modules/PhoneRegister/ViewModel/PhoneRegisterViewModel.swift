//
//  PhoneRegisterViewModel.swift
//  TrendalApp
//
//  Created by Anuar Orazbekov on 11.02.2024.
//

import SwiftUI

final class PhoneRegisterViewModel: ObservableObject {
    var phoneModel = PhoneNumberModel(number: "")
    
    @Published var isNavigateToOtp = false
}
