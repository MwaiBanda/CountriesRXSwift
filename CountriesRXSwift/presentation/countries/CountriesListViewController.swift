//
//  CountriesListViewController.swift
//  LoginRXSwift
//
//  Created by Mwai Banda on 5/31/22.
//

import UIKit
import Swinject

class CountriesListViewController: LBaseViewController {
    
    private var countryViewModel: CountryViewModelProvision!

    override func viewDidLoad() {
        super.viewDidLoad()
        countryViewModel = Assembler.sharedInstance.resolver.resolve(CountryViewModelProvision.self, name: Constants.CountryViewModel)
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = "Countries"
        self.tabBarController?.navigationItem.hidesBackButton = true
        self.tabBarController?.navigationItem.largeTitleDisplayMode = .always
        countryViewModel.fetchCountries()
    }

}
