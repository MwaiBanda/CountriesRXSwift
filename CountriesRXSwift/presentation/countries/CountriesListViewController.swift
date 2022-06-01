//
//  CountriesListViewController.swift
//  LoginRXSwift
//
//  Created by Mwai Banda on 5/31/22.
//

import UIKit

class CountriesListViewController: LBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = "Countries"
        self.tabBarController?.navigationItem.hidesBackButton = true
        self.tabBarController?.navigationItem.largeTitleDisplayMode = .always
    }

}
