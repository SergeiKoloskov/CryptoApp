//
//  String.swift
//  CryptoApp
//
//  Created by MacBookPro on 21.08.2021.
//

import Foundation

extension String {
    
    var removingHTML: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
    
}
