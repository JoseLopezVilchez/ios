//
//  CircleImage.swift
//  PruebaUI
//
//  Created by dam2 on 11/2/25.
//

import SwiftUI

struct CircleImage: View {
    
    var image : Image;
    
    var body: some View {
        image
            .frame(width: 200, height: 200) //el orden de los factores altera el producto
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 5)
    }
}

#Preview {
    let landmarks = ModelData().landmarks;
    return Group {
        CircleImage(image: landmarks[0].image)
    }
}
