//
//  SetJobsViewModel.swift
//  TrendalApp
//
//  Created by Anuar Orazbekov on 04.03.2024.
//

import SwiftUI

final class SetJobsViewModel: ObservableObject {
    var phoneModel = GenderModel()
    
    @Published var isNavigateToCreateCV = false
}
