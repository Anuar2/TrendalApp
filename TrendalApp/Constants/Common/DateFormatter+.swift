//
//  DateFormatter.swift
//  TrendalApp
//
//  Created by User on 05.02.2024.
//

import Foundation

// MARK: - TimeFormat

// TODO: Refactor | AzSu
public extension DateFormatter {
    
    static var iso8601Formatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.timeZone = Calendar.current.timeZone
        return formatter
    }
    
    static var dayMonthFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM"
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.timeZone = Calendar.current.timeZone
        return formatter
    }
    
    static func formattedDayMonth(date: String) -> String {
        guard let formattedDateString = DateFormatter.iso8601Formatter.date(from: date) else { return ""}
        let formattedString = DateFormatter.dayMonthFormatter.string(from: formattedDateString)
        return formattedString
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
