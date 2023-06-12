//
//  NetworkManager.swift
//  Converter
//
//  Created by Borys Klykavka on 08.06.2023.
//

import Foundation


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



class NetworkManager {
    
 

    let key = "access_key=2d4d4d0b1468403c50a537e60400605d"
    public static let shared = NetworkManager()
    private init() {}

    public func converter(amount: String, fromCurrency: String, toCurrency: String, onSuccess: @escaping (ConverterData) -> (), onError: (Error) ->()) {
        
        print("Key : \(ConfigValues.get().AccessKeys.accessKeyToExchangeRates)")
//
        
        

        let url = "https://api.exchangeratesapi.io/v1/convert?" + key + "&from=" + fromCurrency + "&to=" + toCurrency + "&amount=" + amount
        
        print(url)
        
        guard let url = URL(string: url) else {
            return }
        let task = URLSession.shared.dataTask(with: url ){
            (data, response, error) in
            
            guard let data = data,
                  let jsonString = try? JSONDecoder().decode(ConverterResponseData.self, from: data) else {print("Error - cannot get information from url"); return}
            let viewData = ConverterData(result: jsonString.result)
            onSuccess(viewData)
        }
        task.resume()
    }
}
