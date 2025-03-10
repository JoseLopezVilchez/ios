//
//  ContentView.swift
//  RestauranteUI
//
//  Created by dam2 on 18/2/25.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var order : Order;
    
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(menu) { section in
                    Section (section.name) {
                        ForEach (section.items) { item in
                            /*NavigationLink {
                                //destino de la navegación = primer parametro
                                ItemDetail(item: item)
                            } label: {
                                //vista del enlace = segundo parametro
                                ItemRow (item: item)
                            }*/
                            NavigationLink(value: item) {
                                ItemRow(item: item)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Menu")
            .listStyle(GroupedListStyle())
            .navigationDestination(for: MenuItem.self) { item in
                ItemDetail(item: item)
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(Order())
}
