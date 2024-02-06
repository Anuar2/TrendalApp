//
//  PhoneNumberTextFieldView.swift
//  TrendalApp
//
//  Created by Anuar Orazbekov on 01.10.2023.
//

import SwiftUI

struct PhoneNumberTextFieldView: View {
    @Binding var placeHolder: String
    @State private var phoneText: String = ""
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
            
            TextField(placeHolder, text: $phoneText, onEditingChanged: { isEditing in
                if !isEditing {
                    formatPhoneNumber()
                }
            })
            .gesture(
                DragGesture().onChanged { _ in
                    UIApplication.shared.endEditing()
                }
            )
            .padding()
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

    private func formatPhoneNumber() {
        let cleanedText = phoneText.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        
        guard cleanedText.count >= 7 else {
            return
        }
        
        let formattedText = String(format: "%@-%@", String(cleanedText.prefix(3)), String(cleanedText.suffix(4)))
        
        phoneText = formattedText
    }
    
    func format(with mask: String, phone: String) -> String {
        let digits = phone.filter({ $0.isNumber })
        var result = ""
        
        var index = digits.startIndex
        for char in mask where index < digits.endIndex {
            if char == "X" {
                result.append(digits[index])
                index = digits.index(after: index)
            } else {
                result.append(char)
            }
        }
        return result
    }
}

struct PhoneNumberTextFieldView_Previews: PreviewProvider {
    @State static var placholderPreview: String = "Номер телефона"

    static var previews: some View {
        PhoneNumberTextFieldView(placeHolder: $placholderPreview)
    }
}
