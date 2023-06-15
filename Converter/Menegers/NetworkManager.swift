//
//  NetworkManager.swift
//  Converter
//
//  Created by Borys Klykavka on 08.06.2023.
//
// Converter works free for metalpriceapi.com !!!!!!!

import Foundation

enum NetworkError: Error, LocalizedError {

    case noDataInResponse

    public var errorDescription: String? {
        return localizedDescription
    }

    private var localizedDescription: String {
        switch self {
        case .noDataInResponse:
            return "No data in Response"
        }
    }
}

enum NetworkApiMethods: String {
    case convert = "convert"
    
    var path: String {
        let generalPath = #"/v1/"#
        return generalPath+self.rawValue
    }
}


enum Currency: Int, CaseIterable {
    case usd = 0
    case uah = 1
    case eur = 2
    case gpb = 3
    case chf = 4
    case jpy = 5
    
    var  stringValue: String {
        switch self {
        case .usd: return "USD"
        case .uah: return "UAH"
        case .eur: return "EUR"
        case .gpb: return "GPB"
        case .chf: return "CHF"
        case .jpy: return "JPY"
        }
    }
}

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

    public func convert(value: ConversationValue, onSuccess: @escaping (ConverterData) -> (), onError: @escaping (Error) ->()) {

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
                onError(NetworkError.noDataInResponse)
                return
            }
            let viewData = ConverterData(result: jsonString.result)
            onSuccess(viewData)
        }
        task.resume()
    }
}
