//
//  SelectGenderView.swift
//  TrendalApp
//
//  Created by Anuar Orazbekov on 14.02.2024.
//

import SwiftUI

struct SelectGenderView: View {
    @State var namePlaceHolder = "Имя"
    @State var lastNamePlaceHolder = "Фамилия"
    @State private var isKeyboardVisible = false
    
    var router = SelectGenderRouter()
    
    var body: some View {
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
                
                SizedSpacer(height: 40)
                
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
                    .padding()
                
                Spacer()
                
                DefaultButton(buttonTitle: "Далее", action: {
                    
                })
                    .padding()
                
            }
            .onAppear {
                keyboardObserver()
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
        SelectGenderView()
    }
}
