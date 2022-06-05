//
//  CountryViewModelTests.swift
//  CountriesRXSwiftTests
//
//  Created by Mwai Banda on 6/4/22.
//

import XCTest
import RxTest
import RxSwift
@testable import CountriesRXSwift


class CountryViewModelTests: XCTestCase {
    var sut: CountryViewModelProvision!
    var mockService: CountryService!
    var scheduler: TestScheduler!
    var disposeBag: DisposeBag!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        mockService = MockContentServiceImpl()
        sut = CountryViewModel(service: mockService)
        scheduler = TestScheduler(initialClock: 0)
        disposeBag = DisposeBag()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
        mockService = nil
        scheduler = nil
        disposeBag = nil
    }
    func testFetchCountries() throws {
        let countriesObserver = scheduler.createObserver([Country].self)
        
        sut.countries
            .bind(to: countriesObserver)
            .disposed(by: disposeBag)
        
        sut.fetchCountries()
        
        scheduler.start()
        
        let results = countriesObserver.events.compactMap {
            $0.value.element
        }
        XCTAssertEqual(results.last?.last?.name, "Zambia")
    }


}

class MockContentServiceImpl: CountryService  {
    func getCountries(onCompletion: @escaping (Result<[Country], Error>) -> Void) {
        onCompletion(.success([Country](repeating: Country(name: "Zambia", unicodeFlag: "🇿🇲", cities: ["Ndola", "Lusaka", "Livingstone", "Kitwe"]), count: 10)))
    }
}
