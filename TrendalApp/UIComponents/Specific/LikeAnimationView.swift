//
//  LikeAnimationView.swift
//  TrendalApp
//
//  Created by Sailau Almaz Maratuly on 05.02.2024.
//

import SwiftUI

struct LikeAnimationView: View {
    
    @State private var circleSize = 0.0
    @State private var circleInnerBorder = 35
    @State private var circleHue = 200
    
    @State private var heart = Image(systemName: "heart")
    @State private var scaleHeart = 0.0
    
    @State private var splash = 0.0
    @State private var splashTransparency = 1.0
    
    @State private var isLiked = false
    
    var body: some View {
        ZStack {
            HStack {
                ZStack {
                    Image(systemName: "heart")
                    Image("splash")
                        .opacity(Double(splashTransparency))
                        .animation(Animation.easeInOut(duration: 0.5).delay(0.25))
                        .scaleEffect(CGFloat(splash))
                        .animation(Animation.easeInOut(duration: 0.5))
                    Image("splash")
                        .rotationEffect(.degrees(90))
                        .opacity(Double(splashTransparency))
                        .animation(Animation.easeInOut(duration: 0.5).delay(0.2))
                        .scaleEffect(CGFloat(splash))
                        .animation(Animation.easeOut(duration: 0.5))
                }
                .overlay(
                    Circle()
                        .strokeBorder(lineWidth:  CGFloat(circleInnerBorder))
                        .animation(Animation.easeInOut(duration: 0.5).delay(0.1))
                        .frame(width: 70, height: 70, alignment: .center)
                        .foregroundColor(Color(.systemPink))
                        .hueRotation(Angle(degrees: Double(circleHue)))
                        .scaleEffect(CGFloat(circleSize))
                        .animation(Animation.easeInOut(duration: 0.5))
                )
            }
            HStack {
                heart
                    .scaleEffect(CGFloat(scaleHeart))
                    .animation(Animation.interpolatingSpring(stiffness: 170, damping: 15).delay(0.25))
            }
        }
        .foregroundColor(Color.primaryShade)
        .onTapGesture {
            let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
            impactHeavy.impactOccurred()
            withAnimation {
                if isLiked {
                    // Undo like
                    heart = Image(systemName: "heart")
                    scaleHeart = 0
                    
                    circleSize = 0
                    circleInnerBorder = 35
                    circleHue = 200
                    
                    splash = 0
                    splashTransparency = 1
                    
                } else {
                    heart = Image(systemName: "heart.fill")
                    scaleHeart = 1
                    
                    circleSize = 0.5
                    circleInnerBorder = 0
                    circleHue = 300
                    
                    splash = 1.5
                    splashTransparency = 0
                    
                }
                isLiked.toggle()
            }
        }
    }
}


struct LikeAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        LikeAnimationView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
            .border(.red)
    }
}

