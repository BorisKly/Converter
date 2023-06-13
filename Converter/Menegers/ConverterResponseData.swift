//
//  Responce.swift
//  Converter
//
//  Created by Borys Klykavka on 08.06.2023.
//

import Foundation

struct ConverterResponseData: Codable {
   // let success: Bool
  //  let query: Query
   // let info: Info
   // let historical, date: String
    let result: Double
}

//// MARK: - Info
//struct Info: Codable {
//    let timestamp: Int
//    let rate: Double
//}

//// MARK: - Query
//struct Query: Codable {
//    let from, to: String
//    let amount: Int
//}
