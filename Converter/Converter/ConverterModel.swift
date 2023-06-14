//
//  ConverterModel.swift
//  Converter
//
//  Created by Borys Klykavka on 08.06.2023.
//

import Foundation

class ConverterModel {
    
    var jsonConvertedAmount: ConverterData?
    
    var value = ConversationValue(amount: "", fromCurrency: .case0, toCurrency: .case0)
    
    
    public func setConverter(onSuccess: @escaping (ConverterData) -> Void) {
        NetworkManager.shared.convert(value: value,  onSuccess: { [weak self] json in
            self?.jsonConvertedAmount = json
            DispatchQueue.main.async {
                onSuccess(json)
            }
        }, onError: { print( $0 )})
    }
}
