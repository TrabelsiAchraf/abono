//
//  CurrencyGenerator.swift
//  Abono
//
//  Created by Achraf Trabelsi on 03/08/2022.
//

import Foundation

struct Currency: Hashable {
    let text: String
    let flag: String
}

struct CurrencyGenerator {
    static var currencies: [Currency] {
        return [
            .init(text: "EUR", flag: "🇪🇺"),
            .init(text: "USD", flag: "🇺🇸"),
            .init(text: "CAD", flag: "🇨🇦"),
            .init(text: "DTN", flag: "🇹🇳"),
            .init(text: "AUD", flag: "🇦🇺"),
            .init(text: "INR", flag: "🇮🇳"),
            .init(text: "TRY", flag: "🇹🇷"),
            .init(text: "ISK", flag: "🇦🇽"),
            .init(text: "BGN", flag: "🇧🇬"),
            .init(text: "BRL", flag: "🇧🇷"),
            .init(text: "JPY", flag: "🇯🇵"),
            .init(text: "ZAR", flag: "🇿🇦"),
            .init(text: "KRW", flag: "🇰🇷"),
            .init(text: "CHF", flag: "🇨🇭"),
            .init(text: "MXN", flag: "🇲🇽"),
            .init(text: "CNY", flag: "🇨🇳"),
            .init(text: "CZK", flag: "🇨🇿"),
            .init(text: "SEK", flag: "🇸🇪")
        ]
    }
}
