//
// Config.swift
//  Converter
//
//  Created by Borys Klykavka on 12.06.2023.
//

import UIKit

struct Access: Decodable  {
    let AccessKeys: AccessKeys
}

struct AccessKeys: Decodable {
    let accessKeyToExchangeRates: String
}

struct ConfigValues {
    static func get() -> Access {
        guard let url = Bundle.main.url(forResource: "Keys", withExtension: "plist") else {
            fatalError("Could not find Keys.plist in your Bundle")
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            return try decoder.decode(Access.self, from: data)
        } catch let err {
            fatalError(err.localizedDescription)
        }
    }
}
