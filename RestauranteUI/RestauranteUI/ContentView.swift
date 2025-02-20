//
//  ContentView.swift
//  RestauranteUI
//
//  Created by dam2 on 18/2/25.
//

import SwiftUI

struct ContentView: View {
    
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(menu) { section in
                    Section (section.name) {
                        ForEach (section.items) { item in
                            ItemRow (item: item)
                        }
                    }
                }
            }
            .navigationTitle("Menu")
            .listStyle(GroupedListStyle())
        }
    }
}

#Preview {
    ContentView()
}
