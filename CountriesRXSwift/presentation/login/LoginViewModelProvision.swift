//
//  LoginViewModelProvision.swift
//  CountriesRXSwift
//
//  Created by Mwai Banda on 6/3/22.
//

import RxSwift
import RxRelay
import RxCocoa


protocol LoginViewModelProvision {
    var username: PublishSubject<String> { get }
    var password: PublishSubject<String> { get }
    var passwordError1: BehaviorRelay<String> { get }
    var passwordError2: BehaviorRelay<String> { get }
    var passwordError3: BehaviorRelay<String> { get }
    var passwordError4: BehaviorRelay<String> { get }
    func inputIsValid() -> Observable<Bool>
}
