//
//  ContentView.swift
//  PruebaUI
//
//  Created by dam2 on 11/2/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList();
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
