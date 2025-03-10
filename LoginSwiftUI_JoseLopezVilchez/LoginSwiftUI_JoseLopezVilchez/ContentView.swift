//
//  ContentView.swift
//  LoginSwiftUI_JoseLopezVilchez
//
//  Created by dam2 on 4/3/25.
//



import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var data : Data;
    
    var body: some View {
        
        if data.login {
            Login()
                .environmentObject(data)
        } else {
            Principal()
                .environmentObject(data)
        }
        
    }
}

#Preview {
    ContentView()
        .environmentObject(Data())
}
