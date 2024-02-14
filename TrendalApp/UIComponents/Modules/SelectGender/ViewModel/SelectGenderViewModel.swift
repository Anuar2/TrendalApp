//
//  SelectGenderViewModel.swift
//  TrendalApp
//
//  Created by Anuar Orazbekov on 12.02.2024.
//

import SwiftUI

final class SelectGenderViewModel: ObservableObject {
    var phoneModel = GenderModel()
    
    @Published var isNavigateToJobSelection = false
}
