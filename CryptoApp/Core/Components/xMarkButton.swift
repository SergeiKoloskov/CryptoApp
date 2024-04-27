//
//  xMarkButton.swift
//  CryptoApp
//
//  Created by MacBookPro on 19.08.2021.
//

import SwiftUI

struct xMarkButton: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "xmark")
                .font(.headline)
        })
    }
}

struct xMarkButton_Previews: PreviewProvider {
    static var previews: some View {
        xMarkButton()
    }
}
