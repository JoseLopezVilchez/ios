//
//  Device.swift
//  GridUI
//
//  Created by dam2 on 18/2/25.
//

import Foundation

struct Device : Identifiable, Hashable {
    let id = UUID();
    let name : String;
    let iconName : String;
}

enum DeviceRepository {
    static let all = [
        Device(name: "AirPods", iconName: "airpods"),
        Device(name: "AirPods Pro", iconName: "airpodspro"),
        Device(name: "Apple TV", iconName: "appletv"),
        Device(name: "Apple Watch", iconName: "applewatch"),
        Device(name: "HomePod", iconName: "homepod"),
        Device(name: "iPad", iconName: "ipad"),
        Device(name: "iPhone", iconName: "iphone"),
        Device(name: "iPod", iconName: "ipod"),
        Device(name: "Apple Pencil", iconName: "pencil.tip")
    ];
}
