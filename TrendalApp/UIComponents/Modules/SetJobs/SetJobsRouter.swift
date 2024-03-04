//
//  SetJobsRouter.swift
//  TrendalApp
//
//  Created by Anuar Orazbekov on 04.03.2024.
//

import SwiftUI

protocol SetJobsRouterInput {
    func navigateToCreateCV() -> AnyView
}


final class SetJobsRouter: SetJobsRouterInput {
    func navigateToCreateCV() -> AnyView {
        let destination = AnyView(OtpViewScreen().navigationBarBackButtonHidden(true))
        return destination
    }
}
