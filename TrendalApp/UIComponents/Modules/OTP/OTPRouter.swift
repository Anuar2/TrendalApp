//
//  OTPRouter.swift
//  TrendalApp
//
//  Created by Anuar Orazbekov on 12.02.2024.
//

import SwiftUI

protocol OTPRouterRouterInput {
    func navigateToOtp() -> AnyView
}

final class OTPRouter: OTPRouterRouterInput {
    func navigateToOtp() -> AnyView {
        let destination = AnyView(FourthPage().navigationBarBackButtonHidden(true))
        return destination
    }
}
