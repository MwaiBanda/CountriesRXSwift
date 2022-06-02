//
//  CountryViewModel.swift
//  CountriesRXSwift
//
//  Created by Mwai Banda on 6/1/22.
//

import RxSwift

protocol CountryViewModelProvision {
    var service: CountryService { get set }
    var countries: PublishSubject<[Country]> { get }
    func fetchCountries()
}

class CountryViewModel: CountryViewModelProvision {
    internal var service: CountryService
    var countries = PublishSubject<[Country]>()
    
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
}
