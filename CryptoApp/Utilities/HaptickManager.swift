import Foundation
import SwiftUI

class HaptickManager {
    
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notofocation(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
