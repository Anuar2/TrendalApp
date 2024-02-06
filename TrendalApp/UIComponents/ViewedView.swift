//
//  ViewedView.swift
//  TrendalApp
//
//  Created by Sailau Almaz Maratuly on 06.02.2024.
//

import SwiftUI

struct ViewedView: View {
    
    var viewed: Bool
    
    var body: some View {
        HStack {
            Image(systemName: "eye.fill")
            Text(viewed ? "Просмотрено" : "Не просмотрено")
        }
        .font(.system(size: 12))
        .foregroundColor(Color.gray)
    }
}

struct ViewedView_Previews: PreviewProvider {
    static var previews: some View {
        ViewedView(viewed: false)
    }
}
