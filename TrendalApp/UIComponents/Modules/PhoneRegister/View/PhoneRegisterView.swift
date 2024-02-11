//
//  SecondPage.swift
//  TrendalApp
//
//  Created by Anuar Orazbekov on 02.10.2023.
//

import SwiftUI

struct PhoneRegisterView: View {
    
    @State static var placholderPreview: String = "Номер телефона"
    var router = PhoneRegisterRouter()
    
    var body: some View {
        NavigationView {
            ZStack {
                backgroundColor
                VStack(spacing: 16) {
                    Image("logo")
                        .resizable()
                        .frame(width: 114, height: 24)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Привет")
                        .font(Font.custom("SF Pro Display", size: 32))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 8)
                    Text("На указанный номер телефона будет отправлен СМС с кодом для подтверждения")
                        .font(Font.custom("Roboto", size: 14))
                        .foregroundColor(Color.fromHex("#6A7186"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 40)
                    PhoneNumberTextFieldView(placeHolder: PhoneRegisterView.$placholderPreview)
                        .padding(.bottom, 40)
                    
                    DefaultButton(buttonTitle: "Войти") {
                        NavigationLink(destination: router.navigateToOtp()) {
                            EmptyView()
                        }
                    }
                    
                    Spacer()
                    
                    Text(.init("""
Продолжаю, вы соглашаетесь
с условиями \("[с Условиями обслуживания](https://google.com)") и \("[Политикой конфиденциальности.](https://google.com)")
"""))
                    .font(Font.custom("Roboto", size: 14))
                    .foregroundColor(Color.fromHex("#6A7186"))
                    .tint(Color.fromHex("#38BDF8"))
                    .multilineTextAlignment(.leading)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .bottom)
                    .onOpenURL { _ in }
                }
                .padding()
            }
        }
    }
    
    @ViewBuilder
    private var backgroundColor: some View {
        Color.fromHex("#0F172A").ignoresSafeArea()
    }
}

struct SecondPage_Previews: PreviewProvider {
    static var previews: some View {
        PhoneRegisterView()
    }
}
