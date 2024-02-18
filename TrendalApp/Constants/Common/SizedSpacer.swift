//
//  SizedSpacer.swift
//  TrendalApp
//
//  Created by Anuar Orazbekov on 11.02.2024.
//

import SwiftUI

struct SizedSpacer: View {
    let width: CGFloat?
    let height: CGFloat?
    
    init(width: CGFloat? = nil, height: CGFloat? = nil) {
            self.width = width
            self.height = height
    }
    
    var body: some View {
        Spacer()
            .frame(width: width, height: height)
    }
}

struct SizedSpacer_Previews: PreviewProvider {
    static var previews: some View {
        SizedSpacer(height: 0)
    }
}
