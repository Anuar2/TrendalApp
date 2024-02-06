//
//  ExperienceView.swift
//  TrendalApp
//
//  Created by Sailau Almaz Maratuly on 06.02.2024.
//

import SwiftUI

struct ExperienceView: View {
    
    var experience: String
    
    var body: some View {
        HStack {
            Image(systemName: "suitcase.fill")
            Text(experience)
        }
        .font(.system(size: 12))
        .foregroundColor(Color.gray)
    }
}

struct ExperienceView_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceView(experience: "От 1 до 3 лет")
    }
}


