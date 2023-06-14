//
//  NetworkManager.swift
//  Converter
//
//  Created by Borys Klykavka on 08.06.2023.
//

import Foundation

// Converter works free for metalpriceapi.com !!!!!!!



enum NetworkApiMethods: String {
    case convert = "convert"
    
    var path: String {
        let generalPath = #"/v1/"#
        return generalPath+self.rawValue
    }
}


enum Currency: Int, CaseIterable {
    case case0 = 0
    case case1 = 1
    case case2 = 2
    case case3 = 3
    case case4 = 4
    case case5 = 5
    
    var  stringValue: String {
        switch self {
        case .case0:
            return "USD"
        case .case1:
            return "UAH"
        case .case2:
            return "UER"
        case .case3:
            return "GPB"
        case .case4:
            return "CHF"
        case .case5:
            return "JPY"
        }
    }
}

//enum Currency: String, CaseIterable {
//    case usd = "USD"
//    case uah = "UAH"
//    case eur = "EUR"
//    case gbp = "GBP"
//    case chf = "CHF"
//    case jpy = "JPY"
//}

struct ConversationValue {
    var amount: String
    var fromCurrency: Currency
    var toCurrency: Currency
}

class NetworkManager {
    
    let key = ConfigValues.get().AccessKeys.accessKeyToExchangeRates
    let scheme = "https"
    let host = "api.metalpriceapi.com"
    
    public static let shared = NetworkManager()
    private init() {}

    public func convert(value: ConversationValue, onSuccess: @escaping (ConverterData) -> (), onError: (Error) ->()) {

        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = NetworkApiMethods.convert.path
    
        
        let quertyItems: [URLQueryItem] = [
            URLQueryItem(name: "api_key", value: key),
            URLQueryItem(name: "from", value: value.fromCurrency.stringValue),
            URLQueryItem(name: "to", value: value.toCurrency.stringValue),
            URLQueryItem(name: "amount", value: String(value.amount))
        ]
        
        components.queryItems = quertyItems

        guard let url = components.url else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url ){
            (data, response, error) in
            guard let data = data,
                  let jsonString = try? JSONDecoder().decode(ConverterResponseData.self, from: data) else {
                print("Error - cannot get information from url"); return}
            let viewData = ConverterData(result: jsonString.result)
            onSuccess(viewData)
        }
        task.resume()
    }
}
