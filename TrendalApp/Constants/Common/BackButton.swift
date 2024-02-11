//
//  BackButton.swift
//  TrendalApp
//
//  Created by Anuar Orazbekov on 11.02.2024.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.presentationMode) var presentation
    let action: () -> Void
    var systemImage: String
    var body: some View {
        Button(action: {
            action()
            presentation.wrappedValue.dismiss()
        }) {
            ZStack {
                Circle()
                ///Нужно определить общий дизайн кнопки назад
//                    .fill(Color())
                Image(systemName: systemImage)
                    .font(.system(size: 16, weight: .semibold, design: .monospaced))
            }.frame(width: 35, height: 35, alignment: .center)
        }
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton(action: {}, systemImage: "chevron.left")
    }
}
