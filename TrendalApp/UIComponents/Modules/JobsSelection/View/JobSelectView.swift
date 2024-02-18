//
//  JobSelectView.swift
//  TrendalApp
//
//  Created by Sailau Almaz Maratuly on 13.02.2024.
//

import SwiftUI

struct JobSelectView: View {
    var body: some View {
        HStack {
            ZStack {
                Circle().frame(width: 56)
                Image(systemName: "suitcase.fill")
                    .foregroundColor(.white)                
            }
            SizedSpacer(width: 20)
            VStack(alignment: .leading) {
                Text("Я специалист")
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                    .bold()
                SizedSpacer(height: 3)
                Text("У нас легко найти работу\nсвоей мечты.")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }
            Spacer()
            Image(systemName: "checkmark.circle.fill")
                .foregroundStyle(.white, Color.primaryShade)
        }
        .padding()
        .foregroundColor(.primaryShade)
        .background(Color.mainGray)
        .cornerRadius(20)
        
            
        
        
    }
}

struct JobSelectView_Previews: PreviewProvider {
    static var previews: some View {
        JobSelectView().background(
            Color.mainGray
        )
    }
}
