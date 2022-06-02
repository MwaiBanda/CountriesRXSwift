//
//  CountryViewModel.swift
//  CountriesRXSwift
//
//  Created by Mwai Banda on 6/1/22.
//

import RxSwift

protocol CountryViewModelProvision {
    var service: CountryService { get }
    var countries: PublishSubject<[Country]> { get }
    var selectedCountry: PublishSubject<Country> { get }
    func fetchCountries()
    func setSelectedCountry(country: Country) 
}

class CountryViewModel: CountryViewModelProvision {
    internal let service: CountryService
    let countries = PublishSubject<[Country]>()
    let selectedCountry = PublishSubject<Country>()

    init(service: CountryService){
        self.service = service
    }
    
    func fetchCountries() {
        service.getCountries { result in
            switch result {
            case .success(let countries):
                self.countries.onNext(countries)
                self.countries.onCompleted()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func setSelectedCountry(country: Country) {
        self.selectedCountry.onNext(country)
        self.selectedCountry.onCompleted()
    }
}
