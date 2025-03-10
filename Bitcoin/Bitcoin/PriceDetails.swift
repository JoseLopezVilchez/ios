//
//  PriceDetail.swift
//  Bitcoin
//
//  Created by dam2 on 6/3/25.
//

import Foundation

enum Currency : CaseIterable { //permite recorrer todos los campos de la enumeracion
    case usd
    case gbp
    case eur
    
    var icon : String {
        switch self {
        case .usd:
            return "💵"
        case .gbp:
            return "💷"
        case .eur:
            return "💶"
        }
    }
    
    var code : String {
        switch self {
        case .usd:
            return "USD"
        case .gbp:
            return "GBP"
        case .eur:
            return "EUR"
        }
    }
    
}

struct PriceDetails {
    
    let currency : Currency;
    let rate : String;
    
    public init(currency : Currency, rate : String = "--") {
        self.currency = currency
        self.rate = rate
    }
    
    
}
