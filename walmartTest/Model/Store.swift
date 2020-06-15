//
//  Store.swift
//  walmartTest
//
//  Created by Pedro Iván Romero Ojeda on 6/15/20.
//  Copyright © 2020 piro. All rights reserved.
//

import Foundation

struct Store: Codable {
    let codeMessage: Int
    let message: String
    let id: Int
    let businessID: String
    let storeID: String
    let name: String
    let address: String
    let telephone: String
    let manager: String
    let zipCode: String
    let latSpan: String
    let latPoint: String
    let lonPoint: String
    let opens: String
}

struct StoreResponse: Codable {
    let codeMessage: Int
    let message: String
    let responseArray: [Store]
}
