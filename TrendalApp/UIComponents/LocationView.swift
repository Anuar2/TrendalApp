//
//  LocationView.swift
//  TrendalApp
//
//  Created by Sailau Almaz Maratuly on 06.02.2024.
//

import SwiftUI

struct LocationView: View {
    
    var location: String
    
    var body: some View {
        HStack {
            Image(systemName: "mappin.circle.fill")
            Text(location)
        }
        .font(.system(size: 12))
        .foregroundColor(Color.gray)
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView(location: "Алматы")
    }
}

