//
//  Text+Utils.swift
//  TrendalApp
//
//  Created by Anuar Orazbekov on 01.10.2023.
//

import SwiftUI

struct TitleModifier : ViewModifier {
    @State var size: CGFloat
    @State var textAlignment: TextAlignment = .leading

    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.black)
            .multilineTextAlignment(textAlignment)
            .modifier(PaddingModifier())
    }
}

struct RegularTextModifier : ViewModifier {
    @State var size: CGFloat
    @State var textAlignment: TextAlignment = .leading
    
    @State var padding = EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.red)
            .multilineTextAlignment(textAlignment)
            .padding(padding)
    }
}


struct PaddingModifier : ViewModifier {
    @State var top: CGFloat = 0
    @State var leading: CGFloat = 20
    @State var bottom: CGFloat = 0
    @State var trailing: CGFloat = 20
    
    func body(content: Content) -> some View {
        content
            .padding(EdgeInsets(top: top, leading: leading, bottom: bottom, trailing: trailing))
    }
}

struct SelfSize : ViewModifier {
    @State var borderColor: Color = .clear
    
    func body(content: Content) -> some View {
        content
            .border(borderColor)
    }
}

struct MaxSize : ViewModifier {
    @State var alignment: Alignment = .leading
    @State var borderColor: Color = .clear
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, alignment: alignment)
            .border(borderColor)
    }
}

extension String {
    subscript(idx: Int) -> String {
        String(self[index(startIndex, offsetBy: idx)])
    }
}
