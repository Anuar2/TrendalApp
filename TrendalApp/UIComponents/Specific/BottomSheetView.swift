//
//  BottomSheetView.swift
//  TrendalApp
//
//  Created by Anuar Orazbekov on 15.02.2024.
//

import SwiftUI

struct BottomSheetView<Content: View>: View {
    @Binding var isSheetPresented: Bool
    let content: Content
    
    init(isSheetPresented: Binding<Bool>, @ViewBuilder content: () -> Content) {
        _isSheetPresented = isSheetPresented
        self.content = content()
    }
    
    var body: some View {
        VStack {
            Spacer()
            content
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .padding()
        .edgesIgnoringSafeArea(.bottom)
        .presentationDetents([.medium, .large])
        .animation(.spring())
        .onTapGesture {
            withAnimation {
                isSheetPresented = false
            }
        }
    }
}
