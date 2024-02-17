//
//  ChooseJobsViewModel.swift
//  TrendalApp
//
//  Created by Anuar Orazbekov on 15.02.2024.
//

import SwiftUI

final class ChooseJobsViewModel: ObservableObject {
    var phoneModel = GenderModel()
    
    @Published var isNavigateToCreateCV = false
}
