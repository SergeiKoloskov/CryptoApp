//
//  HaptickManager.swift
//  CryptoApp
//
//  Created by MacBookPro on 19.08.2021.
//

import Foundation
import SwiftUI

class HaptickManager {
    
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notofocation(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
