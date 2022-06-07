//
//  CountryGridViewModel.swift
//  CountriesRXSwift
//
//  Created by Mwai Banda on 6/6/22.
//

import Foundation

class CountryGridViewModel: ObservableObject {
    var service: CountryService
    @Published var countries = [Country]()
    
    init(service: CountryService) {
        self.service = service
    }
    
    func fetchCountries() {
        service.getCountries { result in
            switch result {
            case .success(let countries):
                DispatchQueue.main.async {
                    self.countries = countries
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
