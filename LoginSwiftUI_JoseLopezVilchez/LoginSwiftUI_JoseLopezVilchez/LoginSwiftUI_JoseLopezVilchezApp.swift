//
//  LoginSwiftUI_JoseLopezVilchezApp.swift
//  LoginSwiftUI_JoseLopezVilchez
//
//  Created by dam2 on 4/3/25.
//

import SwiftUI

@main
struct LoginSwiftUI_JoseLopezVilchezApp: App {
    
    @StateObject var data = Data();
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(data)
        }
    }
}
