//
//  testView.swift
//  TrendalApp
//
//  Created by Anuar Orazbekov on 29.02.2024.
//

import SwiftUI

struct AnimatedExampleView: View {
    @State var isExpanded: Bool = true
    
    private var rectangleId = "Rectangle"
    
    @Namespace var expansionAnimation
    
    var body: some View {
        VStack {
            if isExpanded {
                smallSizeView()
            } else {
                largeSizeView()
            }
        }
        .padding()
        .onTapGesture {
            withAnimation {
                isExpanded.toggle()
            }
        }
    }
    
    @ViewBuilder
    func smallSizeView() -> some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(.black)
            .frame(width: 300,height: 300)
            .matchedGeometryEffect(id: rectangleId, in: expansionAnimation)
            .overlay {
                Text("Privet")
                    .font(.headline)
                    .foregroundStyle(.white)
            }
    }
    
    @ViewBuilder
    func largeSizeView() -> some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(.black)
            .matchedGeometryEffect(id: rectangleId, in: expansionAnimation)
            .overlay {
                Text("Powel nahui")
                    .font(.headline)
                    .foregroundStyle(.white)
            }
    }
    
}

#Preview {
    AnimatedExampleView()
}
