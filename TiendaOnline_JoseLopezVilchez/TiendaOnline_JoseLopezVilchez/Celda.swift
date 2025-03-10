//
//  Celda.swift
//  TiendaOnline_JoseLopezVilchez
//
//  Created by dam2 on 7/3/25.
//

import SwiftUI

struct Celda: View {
    
    let producto: Producto;
    
    var body: some View {
        //nombre, precio, categoria e imagen
        HStack {
            AsyncImage(url: URL(string : producto.image)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Color.gray
            }
            .frame(width: 60, height: 60)
            //.clipShape(.rect(cornerSize: CGSize(width: 20, height: 20)))
            .clipShape(.rect(cornerRadius: 20))
            
            VStack {
                HStack {
                    Text(producto.title)
                        .font(.title)
                        .bold()
                    
                    Spacer()
                }
                
                HStack {
                    Text(String(format: "%g", producto.price))
                        .bold()
                    
                    Spacer()
                    
                    Text(producto.category)
                }
            }
            .padding([.leading, .trailing])
        }
        .frame(height: 80)
    }
}

#Preview {
    Celda(producto: Producto(id: 1, title: "aaaa", price: 2.2, description: "agfdrgdrf", category: "gthtdhdg", image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg", rating: Rating(rate: 2.9, count: 1)))
}

/*
//AsyncImage(url: ) - esto vale para descargar imágenes de internet
AsyncImage(url: URL(string : "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg")) { image in
    image.resizable()
        .aspectRatio(contentMode: .fit)
} placeholder: {
    Color.gray
}
.frame(width: 300, height: 300)
//.clipShape(.rect(cornerSize: CGSize(width: 20, height: 20)))
.clipShape(.rect(cornerRadius: 20))

//AsyncImage(url: URL(string : "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg"), scale: 5)

AsyncImage(url: URL(string : "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg")) { phase in
    
    switch phase {
    case .failure:
        Image(systemName: "photo")
    case .success(let image):
        image.resizable()
    default:
        ProgressView()
    }
}
*/
