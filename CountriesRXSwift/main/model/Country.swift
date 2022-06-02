//
//  Country.swift
//  CountriesRXSwift
//
//  Created by Mwai Banda on 6/1/22.
//

import Foundation

struct CountryResponse: Codable {
    var fetchMessage: String
    var collection: [Country]
    
    enum CodingKeys: String, CodingKey {
        case fetchMessage = "msg"
        case collection = "data"
    }
}

struct Country: Codable {
    var name: String
    var flag: String
    var abbreviation: String

    enum CodingKeys: String, CodingKey {
        case name
        case flag
        case abbreviation = "iso3"
    }
}
