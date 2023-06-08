//
//  EnumPickerDelegate.swift
//  Converter
//
//  Created by Borys Klykavka on 08.06.2023.
//

import UIKit

class EnumPickerDelegate:NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
   
    let values: [CurrencyToShow]
    
    let model = ConverterModel()
    
    init(values: [CurrencyToShow]) {
        self.values = values
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        values.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        values[row].description
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedValue = values[row].description
        print(selectedValue)
    }
}
