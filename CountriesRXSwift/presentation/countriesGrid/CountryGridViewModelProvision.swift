//
//  CountryGridViewModelProvision.swift
//  CountriesRXSwift
//
//  Created by Mwai Banda on 6/7/22.
//

import SwiftUI

protocol CountryGridViewModelProvision {
    var service: CountryService { get }
    var countries : [Country] { get }
    func fetchCountries() 

}
