//
//  Examen4App.swift
//  Examen4
//
//  Created by Alfonso Marín on 13/3/24.
//

import SwiftUI

@main
struct Examen4App: App {
    var body: some Scene {
        
        @StateObject var mensajes : ChatModel = ChatModel();
        
        WindowGroup {
            ContentView()
        }
    }
}
