//
//  SpinnerView.swift
//  TrendalApp
//
//  Created by Anuar Orazbekov on 12.02.2024.
//

import SwiftUI

struct SpinnerView: View {
    // MARK: - Properties
    @State private var showSpinner:Bool = false
    @State private var degree:Int = 270
    @State private var spinnerLength = 0.6
    
    // MARK: - Body
    var body: some View {
        ZStack{
            VStack{
                    Circle()
                        .trim(from: 0.0,to: spinnerLength)
                        .stroke(LinearGradient(colors: [.gray,.white], startPoint: .topLeading, endPoint: .bottomTrailing),style: StrokeStyle(lineWidth: 8.0,lineCap: .round,lineJoin:.round))
                        .animation(Animation.easeIn(duration: 1.5).repeatForever(autoreverses: true))
                        .frame(width: 60,height: 60)
                        .rotationEffect(Angle(degrees: Double(degree)))
                        .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                        .onAppear{
                            degree = 270 + 360
                            spinnerLength = 0
                        }
                }
        }
    }
}

struct SpinnerView_Previews: PreviewProvider {
    static var previews: some View {
        SpinnerView()
    }
}
