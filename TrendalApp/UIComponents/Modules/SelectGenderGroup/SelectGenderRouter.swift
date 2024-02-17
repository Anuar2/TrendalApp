//
//  SelectGenderRouter.swift
//  TrendalApp
//
//  Created by Anuar Orazbekov on 14.02.2024.
//


import SwiftUI

protocol SelectGenderRouterInput {
    func navigateToJobSelection() -> AnyView
}


final class SelectGenderRouter: SelectGenderRouterInput {
    func navigateToJobSelection() -> AnyView {
        let destination = AnyView(ChooseJobsView().presentationDetents([.medium, .large]))
        return destination
    }
}
