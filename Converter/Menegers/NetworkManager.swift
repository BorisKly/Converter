//
//  NetworkManager.swift
//  Converter
//
//  Created by Borys Klykavka on 08.06.2023.
//

import Foundation

// Converter works free for metalpriceapi.com !!!!!!!

enum CurrencyToShow: String {
    case usd
    case eur
    case gbp
    case chf
    var description: String {
        switch self {
        case .usd: return "USD"
        case .eur: return "EUR"
        case .gbp: return "GBP"
        case .chf: return "CHF"
        }
    }
 }

enum NetworkApiMethods: String {
    case convert = "convert"
    case latest = "latest"
    
    var path: String {
        let generalPath = #"/v1/"#
        return generalPath+self.rawValue
    }
}

enum Currency: String {
    case usd = "USD"
    case uah = "UAH"
    case eur = "EUR"
    case gbp = "GBP"
    case chf = "CHF"
    case jpy = "JPY"
}

struct ConversationValue {
    var amount: String
    var fromCurrency: Currency
    var toCurrency: Currency
}

struct LatestValue {
    var base: Currency
    var rates: Rates
}

struct Rates {
    var currencyRates: [Currency: Double]
}

class NetworkManager {
    
    let key = ConfigValues.get().AccessKeys.accessKeyToExchangeRates
    let scheme = "https"
    let host = "api.metalpriceapi.com"
    
    public static let shared = NetworkManager()
    private init() {}

    public func convert(value: ConversationValue, onSuccess: @escaping (ConverterData) -> (), onError: (Error) ->()) {
        
        print("Key : \(ConfigValues.get().AccessKeys.accessKeyToExchangeRates)")

        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = NetworkApiMethods.convert.path
    
        
        let quertyItems: [URLQueryItem] = [
            URLQueryItem(name: "api_key", value: key),
            URLQueryItem(name: "from", value: value.fromCurrency.rawValue),
            URLQueryItem(name: "to", value: value.toCurrency.rawValue),
            URLQueryItem(name: "amount", value: String(value.amount))
        ]
        
        components.queryItems = quertyItems

        guard let url = components.url else {
            return
        }
        
        print(url.absoluteString)
 
        let task = URLSession.shared.dataTask(with: url ){
            (data, response, error) in
            guard let data = data,
                  let jsonString = try? JSONDecoder().decode(ConverterResponseData.self, from: data) else {
                print(data)
                print(response)
                print(error)
                print("Error - cannot get information from url"); return}
            let viewData = ConverterData(result: jsonString.result)
            print(viewData)
            onSuccess(viewData)
        }
        task.resume()
    }
}
