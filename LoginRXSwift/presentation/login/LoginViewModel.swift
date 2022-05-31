//
//  LoginViewModel.swift
//  LoginRXSwift
//
//  Created by Mwai Banda on 5/31/22.
//

import RxSwift
import RxCocoa

protocol LoginViewModelProvision {
    var username: PublishSubject<String> { get }
    var password: PublishSubject<String> { get }
    func inputIsValid() -> Observable<Bool>
}


final class LoginViewModel: LoginViewModelProvision {
    let username = PublishSubject<String>()
    let password = PublishSubject<String>()
    
    func inputIsValid() -> Observable<Bool> {
        return Observable.combineLatest(username.asObserver(), password.asObserver()).startWith(("", "")).map { username, password in
            return !username.isEmpty && password.count > 3
         }.startWith(false)
    }
}

