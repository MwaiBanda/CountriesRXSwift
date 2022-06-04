//
//  LoginRXSwiftTests.swift
//  LoginRXSwiftTests
//
//  Created by Mwai Banda on 5/31/22.
//

import XCTest
import RxTest
import RxSwift
@testable import CountriesRXSwift

class LoginRXSwiftTests: XCTestCase {
    var sut : LoginViewModelProvision!
    var scheduler: TestScheduler!
    var disposeBag: DisposeBag!
    
    override func setUpWithError() throws {
        sut = LoginViewModel()
        scheduler = TestScheduler(initialClock: 0)
        disposeBag = DisposeBag()
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
         sut = nil
         scheduler = nil
         disposeBag = nil
        try super.tearDownWithError()
    }

    func testUsernameAcceptsInput() throws {
        let username = scheduler.createObserver(String.self)

        let observable = scheduler.createHotObservable([
            .next(100, "1"),
            .next(101, "2")
        ])
        
        observable.subscribe(username).disposed(by: disposeBag)
        
        scheduler.start()
        
        let results = username.events.compactMap {
          $0.value.element
        }
        
        XCTAssertEqual(results, ["1", "2"])
    }

    func testPerformance() throws {
        self.measure { }
    }

}
