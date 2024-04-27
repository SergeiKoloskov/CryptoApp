//
//  StatistickModel.swift
//  CryptoApp
//
//  Created by MacBookPro on 17.08.2021.
//

import Foundation

struct StatistickModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let value: String
    let percentageChange: Double?
    
    init(title: String, value: String ,percentageChange: Double? = nil) {
        self.title = title
        self.value = value
        self.percentageChange = percentageChange
    }
    
}
