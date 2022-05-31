//
//  DependencyRegistry.swift
//  LoginRXSwift
//
//  Created by Mwai Banda on 5/31/22.
//

import Foundation
import Swinject
import RxSwift

extension Assembler {
    static let sharedInstance: Assembler = {
        let container = Container()
        let assembler = Assembler([
            ViewModelAssembly(),
            UtilitiesAssembly()
        ])
        return assembler
    }()
}

class UtilitiesAssembly: Assembly {
    func assemble(container: Container) {
        container.register(DisposeBag.self, name: Constants.DisposeBag) { _ in
            DisposeBag()
        }
    }
    
    
}

class ViewModelAssembly: Assembly {
    func assemble(container: Container) {
        container.register(LoginViewModelProvision.self, name: Constants.LoginViewModel) { _ in
            LoginViewModel()
        }
    }
}
