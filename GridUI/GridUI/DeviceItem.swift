//
//  DeviceItem.swift
//  GridUI
//
//  Created by dam2 on 18/2/25.
//

import SwiftUI

struct DeviceItem : View {
    
    let device : Device;
    
    var body: some View {
        VStack {
            Image(systemName: device.iconName)
                .font(.title)
            Text(device.name)
                .font(.caption)
                .multilineTextAlignment(.center)
                .foregroundStyle(.primary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(Color(white : 0.8))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

#Preview {
    DeviceItem(device: Device(name: "AirPods", iconName: "airpods"));
}
