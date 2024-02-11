//
//  PhoneRegisterRouter.swift
//  TrendalApp
//
//  Created by Anuar Orazbekov on 11.02.2024.
//

import SwiftUI

protocol PhoneRegisterRouterInput {
    func navigateToOtp() -> AnyView
}


final class PhoneRegisterRouter: PhoneRegisterRouterInput {
    func navigateToOtp() -> AnyView {
        let destination = AnyView(OtpViewScreen().navigationBarBackButtonHidden(true))
        return destination
    }
}
