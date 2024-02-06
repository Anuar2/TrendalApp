//
//  TextFieldView.swift
//  TrendalApp
//
//  Created by Anuar Orazbekov on 01.10.2023.
//

import SwiftUI
import Combine


struct TextFieldView: View {
    @Binding var placeHolder: String
    @State private var text: String = ""
    @State private var changeBorder = false
    
    var body: some View {
        HStack {
            TextField(placeHolder, text: $text, onEditingChanged: { isEditing in
                if !isEditing {
                }
            })
            .gesture(
                DragGesture().onChanged { _ in
                    UIApplication.shared.endEditing()
                }
            )
            .padding()
            .onChange(of: text) { newValue in
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

struct TextFieldView_Previews: PreviewProvider {
    @State static var placholderPreview: String = "Имя"

    static var previews: some View {
        TextFieldView(placeHolder: $placholderPreview)
    }
}
