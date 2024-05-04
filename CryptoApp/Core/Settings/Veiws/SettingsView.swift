//
//  SettingsView.swift
//  CryptoApp
//
//  Created by MacBookPro on 22.08.2021.
//

import SwiftUI

struct SettingsView: View {
    
    
    let defaultUrl = URL(string: "https://www.google.com")!
    let youtubeUrl = URL(string: "https://www.youtube.com/c/swiftfulthinking")!
    let coffeeUrl = URL(string: "https://www.buymeacoffee.com/nicksarno")!
    let coingeckoUrl = URL(string: "https://www.coingecko.com")!
    let personalUrl = URL(string: "https://twitter.com/sergeikoloskov")!
    
    var body: some View {
        NavigationView {
            ZStack {
                // background layer
                Color.theme.background.ignoresSafeArea()
                
                // content layer
                List {
                    swiftfulthinkingSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                    coinGeckoSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                    developerSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                    appSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                }
            }
            .font(.headline)
            .accentColor(.blue)
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
//                        xMarkButton()
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

extension SettingsView {
    
    private var swiftfulthinkingSection: some View {
        Section(header: Text("Swiftful Thinking")) {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This app was made by following a @SwiftfulThinking course on YouTube. It uses MVVM Architecture, Combine and CoreData!")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
                    .fixedSize(horizontal: false, vertical: true)
                    
            }
            .padding(.vertical)
            Link("Subscribe on YouTube 🥳", destination: youtubeUrl)
            Link("Support his coffee addiction ☕️", destination: coffeeUrl)
        }
    }
    
    private var coinGeckoSection: some View {
        Section(header: Text("CoinGecko")) {
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("The cryptocurrency data that is used in this app comes from free a API from CoinGecko! Prices may be slightly delayed.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
                    .fixedSize(horizontal: false, vertical: true)
                    
            }
            .padding(.vertical)
            Link("Visit CoinGecko!", destination: coingeckoUrl)
        }
    }
    
    private var developerSection: some View {
        Section(header: Text("Developer")) {
            VStack(alignment: .leading) {
                Image("dev")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This app was developed by Sergei Koloskov. It uses SwiftUI and is written 100% in Swift. The project benefits from multi-threading, publisher and subscribers and data persictance.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
                    .fixedSize(horizontal: false, vertical: true)
                    
            }
            .padding(.vertical)
            Link("Visit Twitter", destination: personalUrl)
        }
    }
    
    private var appSection: some View {
        Section(header: Text("Application")) {
            Link("Terms of Service", destination: defaultUrl)
            Link("Privacy Policy", destination: defaultUrl)
            Link("Company Website", destination: defaultUrl)
            Link("Learn More", destination: defaultUrl)
        }
    }
    
}
