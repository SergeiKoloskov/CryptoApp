//
//  DetailViewModel.swift
//  CryptoApp
//
//  Created by MacBookPro on 21.08.2021.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    
    @Published var overviewStatictic: [StatistickModel] = []
    @Published var additionalStatictic: [StatistickModel] = []
    @Published var coinDescription: String? = nil
    @Published var websiteUrl: String? = nil
    @Published var redditUrl: String? = nil
    
    @Published var coin: CoinModel
    private let coinDetailService: CoinDetailDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coin = coin
        self.coinDetailService = CoinDetailDataService(coin: coin)
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        
        coinDetailService.$coinDetails
            .combineLatest($coin)
            .map(mapDataToStatistics)
            .sink { [weak self] (returnedArrays) in
                self?.overviewStatictic = returnedArrays.overview
                self?.additionalStatictic = returnedArrays.additional
            }
            .store(in: &cancellables)
        
        coinDetailService.$coinDetails
            .sink { [weak self] returnedCoinDetails in
                self?.coinDescription = returnedCoinDetails?.readableDescription
                self?.websiteUrl = returnedCoinDetails?.links?.homepage?.first
                self?.redditUrl = returnedCoinDetails?.links?.subredditURL
            }
            .store(in: &cancellables)
        
    }
    
    private func mapDataToStatistics(coinDetailModel: CoinDetailModel?, coinModel: CoinModel) -> (overview: [StatistickModel], additional: [StatistickModel]) {
        let overviewArray = overviewArray(coinModel: coinModel)
        let additionalArray = createAddtitonalArray(coinModel: coinModel, coinDetailModel: coinDetailModel)
        
        return (overviewArray, additionalArray)
    }
    
    private func overviewArray(coinModel: CoinModel) -> [StatistickModel] {
        // overview
        let price = coinModel.currentPrice.asCurrencyWith6Decimals()
        let pricePercentChange = coinModel.priceChangePercentage24H
        let priceStat = StatistickModel(title: "Curren Ptice", value: price, percentageChange: pricePercentChange)
        
        let marketCap = "$" + (coinModel.marketCap?.formattedWithAbbreviations() ?? "")
        let marketCapPrecentChange = coinModel.marketCapChangePercentage24H
        let marketCapStat = StatistickModel(title: "Market Capitalization", value: marketCap, percentageChange: marketCapPrecentChange)
        
        let rank = "\(coinModel.rank)"
        let rankStat = StatistickModel(title: "Rank", value: rank)
        
        let volume = "$" + (coinModel.totalVolume?.formattedWithAbbreviations() ?? "")
        let volumeStat = StatistickModel(title: "Volume", value: volume)
        
        let overviewArray: [StatistickModel] = [
            priceStat, marketCapStat, rankStat, volumeStat
        ]
        return overviewArray
    }
    
    private func createAddtitonalArray(coinModel: CoinModel, coinDetailModel: CoinDetailModel?) -> [StatistickModel] {
        // additional
        
        let high = coinModel.high24H?.asCurrencyWith6Decimals() ?? "n/a"
        let highStat = StatistickModel(title: "24h High", value: high)
        
        let low = coinModel.low24H?.asCurrencyWith6Decimals() ?? "n/a"
        let lowStat = StatistickModel(title: "24h Low", value: low)
        
        let priceChange = coinModel.priceChange24H?.asCurrencyWith6Decimals() ?? "n/a"
        let pricePrecentChange2 = coinModel.priceChangePercentage24H
        let priceChangeStat = StatistickModel(title: "Prica Change", value: priceChange, percentageChange: pricePrecentChange2)
        
        let marketCapChange = "$" + (coinModel.marketCapChange24H?.formattedWithAbbreviations() ?? "")
        let marketCapPrecentChange2 = coinModel.marketCapChangePercentage24H
        let marketCapChangeStat = StatistickModel(title: "24h Market Cap Change", value: marketCapChange, percentageChange: marketCapPrecentChange2)
        
        let blockTime = coinDetailModel?.blockTimeInMinutes ?? 0
        let blockTimeString = blockTime == 0 ? "n/a" : "\(blockTime)"
        let blockStat = StatistickModel(title: "Block Time", value: blockTimeString)
        
        let hashing = coinDetailModel?.hashingAlgorithm ?? "n/a"
        let hashingStat = StatistickModel(title: "Hashing Algorithm", value: hashing)
        
        let additionalArray: [StatistickModel] = [
            highStat, lowStat, priceChangeStat, marketCapChangeStat, blockStat, hashingStat
        ]
        return additionalArray
    }
    
}
