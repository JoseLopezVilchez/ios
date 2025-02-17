//
//  PruebaUIApp.swift
//  PruebaUI
//
//  Created by dam2 on 11/2/25.
//

import SwiftUI

@main
struct PruebaUIApp: App {
    
    @State private var modelData = ModelData();
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
