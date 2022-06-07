//
//  CountyGridTests.swift
//  CountriesRXSwiftTests
//
//  Created by Mwai Banda on 6/7/22.
//

import XCTest
@testable import CountriesRXSwift

class CountyGridTests: XCTestCase {
    var sut: CountryGridViewModelProvision!
    var mockService: CountryService!
    override func setUpWithError() throws {
        mockService = MockContentServiceImpl()
        sut = CountryGridViewModel(service: mockService)
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        sut = nil
        mockService = nil
        try super.tearDownWithError()
    }

    func testFetchCountries() throws {
        sut.fetchCountries()
        XCTAssertEqual(sut.countries.last?.name, "Zambia")
        XCTAssertEqual(sut.countries.last?.unicodeFlag, "🇿🇲")
    }

}
