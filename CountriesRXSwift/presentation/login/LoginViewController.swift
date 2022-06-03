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

    @IBOutlet weak var lbCountry: UILabel!
    @IBOutlet weak var txtUsername: LTextField!
    @IBOutlet weak var txtPassword: LTextField!
    @IBOutlet weak var btnLogin: LButton!
    
    @IBOutlet weak var lbPasswordError1: UILabel!
    @IBOutlet weak var lbPasswordError2: UILabel!
    @IBOutlet weak var lbPasswordError3: UILabel!
    @IBOutlet weak var lbPasswordError4: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginViewModel = Assembler.sharedInstance.resolver.resolve(LoginViewModelProvision.self, name: Constants.LoginViewModel)
        self.disposeBag = Assembler.sharedInstance.resolver.resolve(DisposeBag.self, name: Constants.DisposeBag)
        lbCountry.text = "🌍 Countries 🌎"
        lbCountry.font = .preferredCustomFont(forTextStyle: .title1, weight: .black)
        
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
            .map { $0 ? 1 : 0.8 }
            .bind(to: btnLogin.rx.alpha)
            .disposed(by: disposeBag)
        
        loginViewModel.passwordError1
            .bind(to: lbPasswordError1.rx.text)
            .disposed(by: disposeBag)
        
        loginViewModel.passwordError2
            .bind(to: lbPasswordError2.rx.text)
            .disposed(by: disposeBag)
        
        loginViewModel.passwordError3
            .bind(to: lbPasswordError3.rx.text)
            .disposed(by: disposeBag)
        
        loginViewModel.passwordError4
            .bind(to: lbPasswordError4.rx.text)
            .disposed(by: disposeBag)
        
        
    }
    
    @IBAction func onLoginTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let destination  = storyboard.instantiateViewController(withIdentifier: "TabBarController") as? UITabBarController {
            self.navigationController?.pushViewController(destination, animated: true)
        }
    }
    
}

