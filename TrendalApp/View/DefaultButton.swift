//
//  DefaultButton.swift
//  TrendalApp
//
//  Created by Anuar Orazbekov on 01.10.2023.
//

import SwiftUI

struct DefaultButton: View {
    
    var buttonTitle: String?
    
    var body: some View {
        HStack(alignment: .center) {
            Text(buttonTitle ?? "Войти")
                .font(Font.custom("SF Pro Display", size: 16))
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .center)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .frame(alignment: .center)
        .background(Color.setColorWithHex(hex: "#38BDF8"))
        .cornerRadius(12)
    }
}

struct DefaultButton_Previews: PreviewProvider {
    static var previews: some View {
        DefaultButton()
    }
}
