//
//  Date+Local.swift
//  Converter
//
//  Created by Borys Klykavka on 08.06.2023.
//

import Foundation

extension Date {

    func getFormattedDate(format: LocalDateFormats) -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = format.rawValue
        dateFormat.locale = Locale(identifier: "en_US")
        return dateFormat.string(from: self)
    }

}
