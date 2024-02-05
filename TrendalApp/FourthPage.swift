//
//  FourthPage.swift
//  TrendalApp
//
//  Created by Anuar on 12.10.2023.
//

import SwiftUI

struct FourthPage: View {
    @State var namePlaceHolder = "Имя"
    @State var lastNamePlaceHolder = "Фамилия"
    @State private var isKeyboardVisible = false

    var body: some View {
        NavigationView {
            ZStack {
                backgroundColor
                
                VStack {
                    BackButtonView()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    Text("Личные данные")
                        .font(Font.custom("SF Pro Display", size: 32))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 16)
                        .padding(.bottom, 8)
                    
                    Text("Пожалуйста расскажите немного о себе")
                    .font(Font.custom("Roboto", size: 14))
                    .foregroundColor(Color.fromHex("#6A7186"))
                    .tint(Color.white)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 16)
                    
                    TextFieldView(placeHolder: $namePlaceHolder)
                        .padding(.leading)
                        .padding(.trailing)
                        .padding(.bottom, 10)
                        .onTapGesture {
                            withAnimation {
                                isKeyboardVisible = true
                            }
                        }
                    TextFieldView(placeHolder: $lastNamePlaceHolder)
                        .padding(.leading)
                        .padding(.trailing)
                    
                    GenderSelect()
                        .padding(.top, 10)
                    
                    Spacer()
                    
                    DefaultButton(buttonTitle: "Далее")
                        .padding()
                    
                }
                .onAppear {
                    keyboardObserver()
                }
            }
        }
    }
    
    @ViewBuilder
    private var backgroundColor: some View {
        Color.fromHex("#0F172A").ignoresSafeArea()
    }
    
    private func keyboardObserver() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notification in
            withAnimation {
                isKeyboardVisible = true
            }
        }
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { notification in
            withAnimation {
                isKeyboardVisible = false
            }
        }
    }
}

struct FourthPage_Previews: PreviewProvider {
    static var previews: some View {
        FourthPage()
    }
}
