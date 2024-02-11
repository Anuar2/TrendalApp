//
//  PhoneNumberTextFieldView.swift
//  TrendalApp
//
//  Created by Anuar Orazbekov on 01.10.2023.
//

import SwiftUI

struct PhoneNumberTextFieldView: View {
    @Binding var placeHolder: String
    @Binding var phoneText: String
    @State private var formattedText: String = ""
    @State private var changeBorder = false

    var body: some View {
        HStack {
            Text("+7")
                .font(Font.custom("SF Pro Display", size: 18))
                .opacity(changeBorder ? 1 : 0.3)
                .padding(.leading, 20)
                .padding(.trailing, 5)
                .foregroundColor(Color.gray)
            Divider()
                .frame(width: 2, height: 24)
                .background(Color.fromHex("E2E8F0"))
            
            TextField(placeHolder, text: $formattedText)
                .foregroundColor(.white)
                .padding()
                .onChange(of: formattedText) {
                    if !$0.isEmpty {
                        formattedText = $0.formatPhoneNumber(text: formattedText)
                        phoneText = formattedText
                    }
                }
                .onChange(of: phoneText) { newValue in
                    changeBorder = !newValue.isEmpty
                }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .inset(by: 0.5)
                .stroke(changeBorder ? Color.fromHex("#38BDF8") : Color.gray, lineWidth: 1)
        )
    }
}

struct PhoneNumberTextFieldView_Previews: PreviewProvider {
    @State static var placholderPreview: String = "Номер телефона"
    @State static var phoneText: String = ""
    static var previews: some View {
        PhoneNumberTextFieldView(placeHolder: $placholderPreview, phoneText: $phoneText)
    }
}

extension String {
    func formatPhoneNumber(text: String) -> String {
        let cleanNumber = text.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        
        let mask = "(XXX) XXX-XXXX"
        
        var result = ""
        var startIndex = cleanNumber.startIndex
        var endIndex = cleanNumber.endIndex
        
        for char in mask where startIndex < endIndex {
            if char == "X" {
                result.append(cleanNumber[startIndex])
                startIndex = cleanNumber.index(after: startIndex)
            } else {
                result.append(char)
            }
        }
        return result
    }
}
