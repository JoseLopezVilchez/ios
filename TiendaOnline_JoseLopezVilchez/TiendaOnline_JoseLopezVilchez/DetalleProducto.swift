//
//  DetalleProducto.swift
//  TiendaOnline_JoseLopezVilchez
//
//  Created by dam2 on 7/3/25.
//

/*
 {
    "id":1,
    "title":"Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
    "price":109.95,
    "description":"Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
    "category":"men's clothing",
    "image":"https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
    "rating":{
       "rate":3.9,
       "count":120
    }
 },
 */

import SwiftUI

struct DetalleProducto: View {
    
    @EnvironmentObject var carrito : ListaCompra;
    let producto: Producto;
    
    var body: some View {
        
        VStack {
            AsyncImage(url: URL(string : producto.image)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Color.gray
            }
            .frame(height: 200)
            .clipShape(.rect(cornerRadius: 20))
            
            Text(producto.title)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            HStack {
                Text("Precio: \(String(format: "%g", producto.price))$")
                Spacer()
                Text("Categoría: \(producto.category)")
            }
            .padding([.leading, .trailing, .bottom])
            
            Text(producto.description)
                .font(.title2)
                .padding([.leading, .trailing, .bottom])
            
            HStack {
                Text("Rate: \(String(format: "%g", producto.rating.rate))")
                Spacer()
                Text("Count: \(producto.rating.count)")
            }
            .padding()
            
            Spacer()
            
            Button ("Comprar") {
                carrito.add(producto: producto)
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    DetalleProducto(producto: Producto(id: 1, title: "dgdgdf", price: 2.958, description: "kakakak", category: "jsiufhsei", image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg", rating: Rating(rate: 43.2, count: 22)))
        .environmentObject(ListaCompra())
}
