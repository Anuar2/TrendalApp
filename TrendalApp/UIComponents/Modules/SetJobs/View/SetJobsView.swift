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
                
                SetJobsIconView()
                
                Text("У Вас еще не созданных резюме")
                    .font(Font.custom("Roboto", size: 14))
                    .foregroundColor(Color.fromHex("#6A7186"))
                    .tint(Color.white)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                 
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
        ChooseJobsView()
    }
}

struct SetJobsIconView: View {
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.white)
                .frame(width: 120, height: 120)
            Image(Assets.chooseJobsIcon.name)
        }
    }
}
