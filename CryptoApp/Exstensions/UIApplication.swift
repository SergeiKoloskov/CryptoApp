import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() { // dismiss the keyboard
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
