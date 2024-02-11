//
//  OTPViewModel.swift
//  TrendalApp
//
//  Created by Anuar Orazbekov on 12.02.2024.
//

import SwiftUI

final class OTPViewModel: ObservableObject {
    var phoneModel = OTPModel()
    
    @Published var isNavigateToGender = false
}

