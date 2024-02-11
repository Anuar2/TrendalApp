//
//  FirtsPage.swift
//  TrendalApp
//
//  Created by Anuar Orazbekov on 02.10.2023.
//

import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        NavigationView {
            ZStack {
                backgroundColor
                Image("logo")
                    .resizable()
                    .frame(width: 187, height: 41)
            }
        }
    }
    
    
    @ViewBuilder
    private var backgroundColor: some View {
        Color.fromHex("#0F172A").ignoresSafeArea()
    }
}

struct FirtsPage_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}
