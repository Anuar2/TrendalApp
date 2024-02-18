//
//  JobSelectionView.swift
//  TrendalApp
//
//  Created by Sailau Almaz Maratuly on 13.02.2024.
//

import SwiftUI

struct JobSelectionView: View {
    var body: some View {
        ZStack {
            backgroundColor
            VStack (alignment: .leading) {
                BackButtonView()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                VStack (alignment: .leading) {
                    titleView
                    SizedSpacer(height: 10)
                    Text("Новую работу или\nспециалиста?")
                        .foregroundColor(.gray)
                }
                .padding(.leading, 20)
                
                SizedSpacer(height: 50)
                JobSelectView().padding(10)
                JobSelectView().padding(10)
                
                Spacer()
                DefaultButton()
                SizedSpacer(height: 20)
            }
        }
    }
    
    private var backgroundColor: some View {
        Color.fromHex("#0F172A").ignoresSafeArea()
    }
    
    private var titleView: some View {
        VStack {
            Text("Что Вы ").foregroundColor(.white) +
            Text("ищете?").foregroundColor(.primaryShade)
        }.font(Font.custom("SF Pro Display", size: 32))
    }
    
    
}

struct JobSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        JobSelectionView()
    }
}
