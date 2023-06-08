//
//  ConverterModel.swift
//  Converter
//
//  Created by Borys Klykavka on 08.06.2023.
//

import Foundation

class ConverterModel {

    var jsonP: ConverterData?
    var amount: String = ""
    var fromCurrency: String = ""
    var toCurrency: String = ""


    public func setModel(onSuccess: @escaping () -> Void) {
        NetworkManager.shared.converter(amount: amount, fromCurrency: fromCurrency, toCurrency: toCurrency, onSuccess: { [weak self] json in
            self?.jsonP = json
        DispatchQueue.main.async {
            onSuccess()
        }
    }, onError: { print( $0 )})
    }
}
