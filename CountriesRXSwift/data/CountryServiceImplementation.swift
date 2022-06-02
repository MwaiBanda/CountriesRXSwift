//
//  CountryServiceImplementation.swift
//  CountriesRXSwift
//
//  Created by Mwai Banda on 6/1/22.
//

import Foundation

class CountryServiceImplementation: CountryService {
    var baseURL: String
    
    func getCountries(onCompletion: @escaping (Result<[Country], Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)api/v0.1/countries/flag/images") else {
            print("Error: Invalid URL")
            return
        }
        let request  = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, res, err) in
                if let error = err {
                    onCompletion(.failure(error))
                } else {
                    if let data = data, let response = res as? HTTPURLResponse {
                        if response.statusCode == 200 {
                            do {
                                let countryResponse = try JSONDecoder().decode(CountryResponse.self, from: data)
                                onCompletion(.success(countryResponse.collection))
                                print(countryResponse.collection)
                            } catch DecodingError.dataCorrupted(let context) {
                                print(context)
                            } catch DecodingError.keyNotFound(let key, let context) {
                                print("Key '\(key)' not found:", context.debugDescription)
                                print("codingPath:", context.codingPath)
                            } catch DecodingError.valueNotFound(let value, let context) {
                                print("Value '\(value)' not found:", context.debugDescription)
                                print("codingPath:", context.codingPath)
                            } catch DecodingError.typeMismatch(let type, let context) {
                                print("Type '\(type)' mismatch:", context.debugDescription)
                                print("codingPath:", context.codingPath)
                            } catch {
                                print("error: ", error)
                            }
                        }
                    }
                   
                }
            
        }
        task.resume()
    }
    
    init() {
        baseURL = "https://countriesnow.space/"
    }
}
