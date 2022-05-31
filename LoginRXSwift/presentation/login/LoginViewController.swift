//
//  ViewController.swift
//  LoginRXSwift
//
//  Created by Mwai Banda on 5/31/22.
//

import UIKit
import RxSwift
import RxCocoa
import Swinject

final class LoginViewController: LBaseViewController {
    
    private var loginViewModel: LoginViewModelProvision!
    private var disposeBag: DisposeBag!

    @IBOutlet weak var txtUsername: LTextField!
    @IBOutlet weak var txtPassword: LTextField!
    @IBOutlet weak var btnLogin: LButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginViewModel = Assembler.sharedInstance.resolver.resolve(LoginViewModelProvision.self, name: Constants.LoginViewModel)
        self.disposeBag = Assembler.sharedInstance.resolver.resolve(DisposeBag.self, name: Constants.DisposeBag)
        
        txtUsername.becomeFirstResponder()
       

        txtUsername.rx.text
            .map { $0 ?? ""}
            .bind(to: loginViewModel.username)
            .disposed(by: disposeBag)
        
        txtPassword.rx.text
            .map { $0 ?? "" }
            .bind(to: loginViewModel.password)
            .disposed(by: disposeBag)
        
        loginViewModel.inputIsValid()
            .bind(to: btnLogin.rx.isEnabled)
            .disposed(by: disposeBag)
        
        loginViewModel.inputIsValid()
            .map { $0 ? 1 : 0.5 }
            .bind(to: btnLogin.rx.alpha)
            .disposed(by: disposeBag)
        
    }
    
    @IBAction func onLoginTapped(_ sender: Any) {
        print("Tapped")
    }
    
}

