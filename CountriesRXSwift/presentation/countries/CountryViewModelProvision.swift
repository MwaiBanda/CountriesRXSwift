//
//  CountryViewModelProvision.swift
//  CountriesRXSwift
//
//  Created by Mwai Banda on 6/2/22.
//

import RxSwift

protocol CountryViewModelProvision {
    var service: CountryService { get }
    var countries: PublishSubject<[Country]> { get }
    var selectedCities: PublishSubject<[String]> { get }
    var selectedCountry: PublishSubject<Country> { get }
    
    func fetchCountries()
    func setSelectedCountry(country: Country)
}
