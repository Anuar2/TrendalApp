//
//  ChooseJobsRouter.swift
//  TrendalApp
//
//  Created by Anuar Orazbekov on 15.02.2024.
//

import SwiftUI

protocol ChooseJobsRouterInput {
    func navigateToCreateCV() -> AnyView
}


final class ChooseJobsRouter: ChooseJobsRouterInput {
    func navigateToCreateCV() -> AnyView {
        let destination = AnyView(OtpViewScreen().navigationBarBackButtonHidden(true))
        return destination
    }
}
