//
//  CountryViewModel.swift
//  CountriesRXSwift
//
//  Created by Mwai Banda on 6/1/22.
//

import RxSwift


class CountryViewModel: CountryViewModelProvision {
    internal let service: CountryService
    let countries = PublishSubject<[Country]>()
    let selectedCountry = PublishSubject<Country>()
    let selectedCities = PublishSubject<[String]>()
    
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
        self.selectedCities.onNext(country.cities ?? ["No Cities Available"])
        self.selectedCities.onCompleted()

    }
}
