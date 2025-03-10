//
//  BitcoinApp.swift
//  Bitcoin
//
//  Created by dam2 on 6/3/25.
//

import SwiftUI

@main
struct BitcoinApp: App {
    var body: some Scene {
        WindowGroup {
            BitcoinPriceView(viewModel: BitcoinPriceViewModel())
        }
    }
}
