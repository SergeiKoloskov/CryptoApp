//
//  MarketDataModel.swift
//  CryptoApp
//
//  Created by MacBookPro on 17.08.2021.
//

import Foundation
import SwiftUI

// JSON Data
/*
 
 URL: https://api.coingecko.com/api/v3/global
 
 JSON Response:
 {
   "data": {
     "active_cryptocurrencies": 8948,
     "upcoming_icos": 0,
     "ongoing_icos": 50,
     "ended_icos": 3375,
     "markets": 635,
     "total_market_cap": {
       "btc": 44559562.455012776,
       "eth": 644378792.1077293,
       "ltc": 11506951578.370253,
       "bch": 3031063970.1873546,
       "bnb": 4845032290.698939,
       "eos": 380194886229.884,
       "xrp": 1723452875738.0642,
       "xlm": 5564328967551.17,
       "link": 72396065653.21564,
       "dot": 79832193836.57857,
       "yfi": 50845796.68697981,
       "usd": 2045941196028.0627,
       "aed": 7515151201250.27,
       "ars": 198962461866619.28,
       "aud": 2820994869613.39,
       "bdt": 173796278301287.22,
       "bhd": 771418036079.9877,
       "bmd": 2045941196028.0627,
       "brl": 10814231379845.525,
       "cad": 2584668202060.1904,
       "chf": 1870759527059.3564,
       "clp": 1617971216642912.2,
       "cny": 13270179191557.62,
       "czk": 44443499805136.52,
       "dkk": 12988307827039.613,
       "eur": 1746507472283.3743,
       "gbp": 1489479971708.7617,
       "hkd": 15941728286507.135,
       "huf": 614376154367684,
       "idr": 29506359334997100,
       "ils": 6622629813895.008,
       "inr": 152176701064210.6,
       "jpy": 224134869982986.97,
       "krw": 2408136107559102.5,
       "kwd": 615437525236.0072,
       "lkr": 408198306466031.8,
       "mmk": 3367898778342864,
       "mxn": 40936729997908.86,
       "myr": 8670698788766.904,
       "ngn": 842313990404752,
       "nok": 18209879155835.805,
       "nzd": 2960849271950.282,
       "php": 103340984929146.98,
       "pkr": 336615118447580.1,
       "pln": 7974870096115.389,
       "rub": 150507208956369.12,
       "sar": 7673840538237.778,
       "sek": 17899765619047.848,
       "sgd": 2786991326935.407,
       "thb": 68191220063615.33,
       "try": 17259559929692.734,
       "twd": 57119607235368.17,
       "uah": 54546087366885.29,
       "vef": 204860091958.2899,
       "vnd": 46924921151930056,
       "zar": 30494686010738.797,
       "xdr": 1438196409689.1226,
       "xag": 86600680783.12347,
       "xau": 1146688662.1378481,
       "bits": 44559562455012.77,
       "sats": 4455956245501277.5
     },
     "total_volume": {
       "btc": 3082196.1828018827,
       "eth": 44571843.70511031,
       "ltc": 795938745.2770876,
       "bch": 209659459.92337292,
       "bnb": 335132106.5376438,
       "eos": 26298176249.859417,
       "xrp": 119211670451.24806,
       "xlm": 384886039241.41113,
       "link": 5007654135.551627,
       "dot": 5522012999.03298,
       "yfi": 3517016.591407301,
       "usd": 141518268968.67148,
       "aed": 519824905575.7234,
       "ars": 13762283709703.973,
       "aud": 195128927210.7282,
       "bdt": 12021532440005.814,
       "bhd": 53359180278.099556,
       "bmd": 141518268968.67148,
       "brl": 748023114287.7064,
       "cad": 178782151962.15707,
       "chf": 129400908706.49799,
       "clp": 111915477465804.77,
       "cny": 917901644357.7002,
       "czk": 3074168100013.242,
       "dkk": 898404530923.6157,
       "eur": 120806362713.76147,
       "gbp": 103027705619.76529,
       "hkd": 1102693369611.6116,
       "huf": 42496553679322.55,
       "idr": 2040962323239282,
       "ils": 458088975920.8315,
       "inr": 10526100825272.537,
       "jpy": 15503465533168.479,
       "krw": 166571382425032.44,
       "kwd": 42569968970.19722,
       "lkr": 28235179896257.254,
       "mmk": 232958408627814.75,
       "mxn": 2831603947263.4414,
       "myr": 599754423889.228,
       "ngn": 58263071334401.95,
       "nok": 1259581937772.9705,
       "nzd": 204802691522.6198,
       "php": 7148122013028.693,
       "pkr": 23283752711889.99,
       "pln": 551623777576.4463,
       "rub": 10410621634757.55,
       "sar": 530801487071.7393,
       "sek": 1238131306154.0437,
       "sgd": 192776893580.46915,
       "thb": 4716803904725.82,
       "try": 1193848117019.7124,
       "twd": 3950977650683.579,
       "uah": 3772966631769.0425,
       "vef": 14170224271.833075,
       "vnd": 3245808640934885,
       "zar": 2109325128875.1716,
       "xdr": 99480408689.79657,
       "xag": 5990190949.636671,
       "xau": 79316744.20887129,
       "bits": 3082196182801.883,
       "sats": 308219618280188.25
     },
     "market_cap_percentage": {
       "btc": 42.16637005574164,
       "eth": 18.16526248372683,
       "ada": 3.2333397538933086,
       "bnb": 3.186268579544496,
       "usdt": 3.1453830627220243,
       "xrp": 2.6847833002729513,
       "doge": 2.0530520522822178,
       "usdc": 1.3437618568828684,
       "dot": 1.2790306905022717,
       "sol": 0.9355392315124623
     },
     "market_cap_change_percentage_24h_usd": -0.8200966347162908,
     "updated_at": 1629224065
   }
 }
 
 */

struct GlobalData: Codable {
    let data: MarketDataModel?
}

struct MarketDataModel: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    
    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap: String {
        if let item = totalMarketCap.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var volume: String {
        if let item = totalVolume.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: { $0.key == "btc" }) {
            return item.value.asPrecentString()
        }
        return ""
    }
}
