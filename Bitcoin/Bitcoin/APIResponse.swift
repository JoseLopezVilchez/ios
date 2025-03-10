//
//  APIResponse.swift
//  Bitcoin
//
//  Created by dam2 on 6/3/25.
//

import Foundation

struct APIResponse : Decodable {
    let time : APITime;
    let disclaimer : String;
    let chartName : String;
    let bpi : APIBitcoinPrice;
}

struct APITime : Decodable {
    let updated : String;
    let updatedISO : String;
    let updateduk : String;
}

struct APIBitcoinPrice : Decodable {
    let USD : BPImodel;
    let GBP : BPImodel;
    let EUR : BPImodel;
}

struct BPImodel : Decodable {
    let code : String;
    let symbol : String;
    let rate : String;
    let description : String;
    let rate_float : Double;
}
