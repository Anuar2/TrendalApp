//
//  SizedSpacer.swift
//  TrendalApp
//
//  Created by Anuar Orazbekov on 11.02.2024.
//

import SwiftUI

struct SizedSpacer: View {
    let height: CGFloat
    var body: some View {
        Spacer()
            .frame(height: height)
    }
}

struct SizedSpacer_Previews: PreviewProvider {
    static var previews: some View {
        SizedSpacer(height: 0)
    }
}
