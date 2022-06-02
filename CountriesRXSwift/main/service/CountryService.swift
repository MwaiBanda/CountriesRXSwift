//
//  CountryService.swift
//  CountriesRXSwift
//
//  Created by Mwai Banda on 6/1/22.
//

import Foundation

protocol CountryService {
    func getCountries(onCompletion: @escaping (Result<[Country], Error>) -> Void)
}
