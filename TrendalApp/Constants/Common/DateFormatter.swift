//
//  DateFormatter.swift
//  TrendalApp
//
//  Created by User on 05.02.2024.
//

import Foundation

// MARK: - TimeFormat

public extension DateFormatter {
    
    static var busTicketDateFormmater: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH-mm-ss"
        formatter.timeZone = Calendar.current.timeZone
        return formatter
    }
    
    static var ticketFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yy HH:mm"
        formatter.timeZone = Calendar.current.timeZone
        return formatter
    }
}

public extension NumberFormatter {
    static var priceFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        
        //        formatter.locale = Locale(identifier: "kk_KZ")
        //        formatter.numberStyle = .currency
        //        formatter.groupingSeparator = ""
        //        formatter.currencySymbol = "₸ "
        formatter.numberStyle = .currency
        formatter.groupingSeparator = ""
        formatter.currencySymbol = ""
        return formatter

    }
}

public extension Int {
    var customPriceCurrency: String {
        let number = NSNumber(value: self)
        return (NumberFormatter.priceFormatter.string(from: number) ?? "")
    }
}
