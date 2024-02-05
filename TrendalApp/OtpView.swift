//
//  OtpView.swift
//  TrendalApp
//
//  Created by Anuar Orazbekov on 01.10.2023.
//

import SwiftUI

struct OtpView: View {
    let numberOfFields: Int
    
    @Binding var enterValue: [String]
    @Binding var isFocusLost: Bool
    @FocusState private var focusField: Int?
    @State private var oldValue = ""
    
    init(isFocusLost: Binding<Bool>, enterValue: Binding<[String]>) {
        self.numberOfFields = enterValue.count
        self._isFocusLost = isFocusLost
        self._enterValue = enterValue
    }
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<numberOfFields, id: \.self) { index in
                TextField("0", text: $enterValue[index], onEditingChanged: { editing in
                    if editing {
                        oldValue = enterValue[index]
                    }
                })
                .foregroundColor(.white)
                .keyboardType(.numberPad)
                .frame(width: 48, height: 56)
                .background(Color.fromHex("#597766"))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .inset(by: 0.5)
                        .stroke(focusField == index ? Color.fromHex("#597766") : Color.fromHex("38BDF8"), lineWidth: 1)
                )
                .multilineTextAlignment(.center)
                .focused($focusField, equals: index)
                .tag(index)
                .onChange(of: enterValue[index]) { newValue in
                    if enterValue[index].count > 1 {
                        let currentValue = Array(enterValue[index])
                        let suffix = String(enterValue[index].suffix(1))
                        let prefix = String(enterValue[index].prefix(1))
                        enterValue[index] = currentValue[0] == Character(oldValue) ? suffix : prefix
                    }
                    
                    if !newValue.isEmpty {
                        focusField = index == numberOfFields - 1 ? nil : (focusField ?? 0) + 1
                    } else {
                        focusField = (focusField ?? 0) - 1
                    }
                    
                    isFocusLost = index == numberOfFields - 1
                }
            }
        }
    }
}

//struct OtpView_Previews: PreviewProvider {
//
//    @Published var shouldConfrimOtp: Bool = false
//    @Published var otpModel = OTPModel(digits: ["", "", "", ""])
//
//    @State private var enterValue = [""]
//    static var previews: some View {
//        OtpView(isFocusLost: $shouldConfrimOtp, enterValue: $enterValue)
//    }
//}
