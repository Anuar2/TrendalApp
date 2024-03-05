//
//  SetJobsView.swift
//  TrendalApp
//
//  Created by Anuar Orazbekov on 04.03.2024.
//

import SwiftUI

struct SetJobsView: View {
    var router = SetJobsRouter()
    
    var body: some View {
        ZStack {
            backgroundColor
            VStack {
                Text("Выберите вакансию")
                    .font(Font.custom("SF Pro Display", size: 18))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 16)
                    .padding(.bottom, 10)
                
                Spacer()
                 
                DefaultButton(buttonTitle: "Отправить отклик") {
                    print("jopa")
                }
                .padding()
                
            }
        }
    }
    
    @ViewBuilder
    private var backgroundColor: some View {
        Color.fromHex("#0F172A").ignoresSafeArea()
    }
}

struct SetJobsView_Previews: PreviewProvider {
    static var previews: some View {
        SetJobsView()
    }
}
