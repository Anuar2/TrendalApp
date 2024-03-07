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
    @State var isNavigateToJobSelection = false
    
    var router = SelectGenderRouter()
    var viewModel = SelectGenderViewModel()
    
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
                    isNavigateToJobSelection = true
                })
                    .padding()
                
            }
            .onAppear {
                keyboardObserver()
            }
//            /Всегда забываю как этот боттомщит открывается, пускай пока стоит 
            .bottomSheet(isPresented: $isNavigateToJobSelection) {
                router.navigateToJobSelection()
            }
            .bottomSheetConfiguration(.init(background: {
               Color.fromHex("#0F172A")
            }, dim: {
                AnyView(Color.black.opacity(0.3))
            }, indicator: {
                AnyView(
                    RoundedRectangle(cornerRadius: 2)
                        .fill(.gray)
                        .frame(width: 64, height: 4)
                        .padding([.top], 12)
                        .padding([.bottom], 16)
                )
            }))
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

struct SelectGenderView_Previews: PreviewProvider {
    static var previews: some View {
        SelectGenderView()
    }
}
