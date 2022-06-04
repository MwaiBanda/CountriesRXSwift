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
    var passwordChecks: Set<PasswordValidityCheck> { get }
    
    func setUsername(username: String) 
    func setPassword(password: String)

    func inputIsValid() -> Observable<Bool>
    func isValidPassword(password: String) -> Bool
    func assignErrors(passwordChecks: Set<PasswordValidityCheck>)
    func clearPasswordErrorMessages()
    func setPasswordError1(check: PasswordValidityCheck)
    func setPasswordError2(check: PasswordValidityCheck)
    func setPasswordError3(check: PasswordValidityCheck)
    func setPasswordError4(check: PasswordValidityCheck)


}
