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
                Image(systemName: "suitcase.fill").foregroundColor(.white)
                
                
            }
            Spacer().frame(width: 20)
            VStack(alignment: .leading) {
                Text("Я специалист").foregroundColor(.white)
                Text("У нас легко найти работу\n своей мечты.").foregroundColor(.gray)
            }
//            Spacer().frame(width: 10)
            Spacer()

            Image(systemName: "checkmark.circle.fill")
        }
        .padding()
        .foregroundColor(Color.primaryShade)
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
