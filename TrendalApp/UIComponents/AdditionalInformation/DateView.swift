//
//  DateView.swift
//  TrendalApp
//
//  Created by Sailau Almaz Maratuly on 06.02.2024.
//

import SwiftUI

struct DateView: View {
    
    var date: String
    
    var body: some View {
        HStack {
            Image(systemName: "calendar")
            Text(DateFormatter.formattedDayMonth(date: date))
        }
        .font(.system(size: 12))
        .foregroundColor(Color.gray)
    }
}

struct DateView_Previews: PreviewProvider {
    static var previews: some View {
        DateView(date: "2024-02-06T12:00:00")
    }
}
