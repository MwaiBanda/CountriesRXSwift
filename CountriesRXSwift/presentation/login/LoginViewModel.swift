//
//  LoginViewModel.swift
//  LoginRXSwift
//
//  Created by Mwai Banda on 5/31/22.
//

import RxSwift
import RxCocoa





final class LoginViewModel: LoginViewModelProvision {
    let username = PublishSubject<String>()
    let password = PublishSubject<String>()
    let passwordError1 = BehaviorRelay<String>(value: "")
    let passwordError2 = BehaviorRelay<String>(value: "")
    let passwordError3 = BehaviorRelay<String>(value: "")
    let passwordError4 = BehaviorRelay<String>(value: "")
    var passwordChecks = Set([PasswordValidityCheck]())

    func setUsername(username: String) {
        self.username.onNext(username)

    }
    func setPassword(password: String) {
        self.password.onNext(password)
    }
    func inputIsValid() -> Observable<Bool> {
        return Observable.combineLatest(username.asObserver(), password.asObserver()).startWith(("", "")).map { [unowned self] username, password in
            
            return !username.isEmpty && isValidPassword(password: password)
        }.startWith(false)
    }
    
    func isValidPassword(password: String) -> Bool {
        passwordChecks.removeAll()
        if password.count > 6 {
            passwordChecks.insert(.isLongEnough)
        }
        password.forEach { char in
            if char.isUppercase {
                passwordChecks.insert(.containsUppercase)
            }
            if char.isNumber {
                passwordChecks.insert(.containsNumber)
            }
            if char.isSymbol || char.isCurrencySymbol || char.isMathSymbol || char.isPunctuation {
                passwordChecks.insert(.containsSpecialCharacter)
            }
        }
        if password.isEmpty {
            clearPasswordErrorMessages()
        } else {
            assignErrors(passwordChecks: passwordChecks)
        }
        return passwordChecks.count == 4
    }
    
    func assignErrors(passwordChecks: Set<PasswordValidityCheck>) {
        
        var allPasswordChecks: Set<PasswordValidityCheck> = Set(arrayLiteral:  .isLongEnough, .containsUppercase, .containsNumber, .containsSpecialCharacter)
        
        switch passwordChecks.count {
        case 0:
            setPasswordError1(check: allPasswordChecks[allPasswordChecks.index(allPasswordChecks.startIndex, offsetBy: 0)])
            setPasswordError2(check: allPasswordChecks[allPasswordChecks.index(allPasswordChecks.startIndex, offsetBy: 1)])
            setPasswordError3(check: allPasswordChecks[allPasswordChecks.index(allPasswordChecks.startIndex, offsetBy: 2)])
            setPasswordError4(check: allPasswordChecks[allPasswordChecks.index(allPasswordChecks.startIndex, offsetBy: 3)])
        case 1:
            let missingChecks = allPasswordChecks.subtracting(passwordChecks)
            setPasswordError1(check: missingChecks[missingChecks.index(missingChecks.startIndex, offsetBy: 0)])
            setPasswordError2(check: missingChecks[missingChecks.index(missingChecks.startIndex, offsetBy: 1)])
            setPasswordError3(check: missingChecks[missingChecks.index(missingChecks.startIndex, offsetBy: 2)])
            passwordError4.accept("")
        case 2:
            allPasswordChecks = Set(arrayLiteral:  .isLongEnough, .containsUppercase, .containsNumber, .containsSpecialCharacter)
            let missingChecks = allPasswordChecks.subtracting(passwordChecks)
            setPasswordError1(check: missingChecks[missingChecks.index(missingChecks.startIndex, offsetBy: 0)])
            setPasswordError2(check: missingChecks[missingChecks.index(missingChecks.startIndex, offsetBy: 1)])
            passwordError3.accept("")
            passwordError4.accept("")
            
            
        case 3:
            allPasswordChecks = Set(arrayLiteral:  .isLongEnough, .containsUppercase, .containsNumber, .containsSpecialCharacter)
            let missingChecks = allPasswordChecks.subtracting(passwordChecks)
            setPasswordError1(check: missingChecks[missingChecks.index(missingChecks.startIndex, offsetBy: 0)])
            passwordError2.accept("")
            passwordError3.accept("")
            passwordError4.accept("")
            
        case 4:
            clearPasswordErrorMessages()
        default:
            break
        }
    }
    func clearPasswordErrorMessages() {
        passwordError1.accept("")
        passwordError2.accept("")
        passwordError3.accept("")
        passwordError4.accept("")
    }
    
    func setPasswordError1(check: PasswordValidityCheck) {
        switch check {
        case .isLongEnough:
            passwordError1.accept(Constants.PasswordNotLong)
        case .containsUppercase:
            passwordError1.accept(Constants.PasswordNoUpperCase)
        case .containsNumber:
            passwordError1.accept(Constants.PasswordNoNumber)
        case .containsSpecialCharacter:
            passwordError1.accept(Constants.PasswordNoSPCharacter)
            
        }
    }
    func setPasswordError2(check: PasswordValidityCheck) {
        switch check {
        case .isLongEnough:
            passwordError2.accept(Constants.PasswordNotLong)
        case .containsUppercase:
            passwordError2.accept(Constants.PasswordNoUpperCase)
        case .containsNumber:
            passwordError2.accept(Constants.PasswordNoNumber)
        case .containsSpecialCharacter:
            passwordError2.accept(Constants.PasswordNoSPCharacter)
            
        }
    }
    
    func setPasswordError3(check: PasswordValidityCheck) {
        switch check {
        case .isLongEnough:
            passwordError3.accept(Constants.PasswordNotLong)
        case .containsUppercase:
            passwordError3.accept(Constants.PasswordNoUpperCase)
        case .containsNumber:
            passwordError3.accept(Constants.PasswordNoNumber)
        case .containsSpecialCharacter:
            passwordError3.accept(Constants.PasswordNoSPCharacter)
        }
    }
    
    func setPasswordError4(check: PasswordValidityCheck) {
        switch check {
        case .isLongEnough:
            passwordError4.accept(Constants.PasswordNotLong)
        case .containsUppercase:
            passwordError4.accept(Constants.PasswordNoUpperCase)
        case .containsNumber:
            passwordError4.accept(Constants.PasswordNoNumber)
        case .containsSpecialCharacter:
            passwordError4.accept(Constants.PasswordNoSPCharacter)
            
        }
    }
}


