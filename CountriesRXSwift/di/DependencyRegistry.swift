//
//  DependencyRegistry.swift
//  LoginRXSwift
//
//  Created by Mwai Banda on 5/31/22.
//

import Swinject
import RxSwift

extension Assembler {
    static let sharedInstance: Assembler = {
        let container = Container()
        let assembler = Assembler([
            ViewModelAssembly(),
            ServicesAssembly(),
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

class ServicesAssembly: Assembly {
    func assemble(container: Container) {
        container.register(CountryService.self, name: Constants.CountryService) { _ in
            CountryServiceImplementation()
        }
    }
}

class ViewModelAssembly: Assembly {
    func assemble(container: Container) {
        container.register(LoginViewModelProvision.self, name: Constants.LoginViewModel) { _ in
            LoginViewModel()
        }
        container.register(CountryViewModelProvision.self, name: Constants.CountryViewModel) { resolver in
            CountryViewModel(service: resolver.resolve(CountryService.self, name: Constants.CountryService)!)
        }
    }
}
