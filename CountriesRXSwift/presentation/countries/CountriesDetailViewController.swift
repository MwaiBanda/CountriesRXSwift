//
//  CountriesDetailViewController.swift
//  LoginRXSwift
//
//  Created by Mwai Banda on 5/31/22.
//

import UIKit
import Swinject
import RxSwift
import RxCocoa

class CountriesDetailViewController: LBaseViewController {
    var country: Country?
    @IBOutlet weak var countryname: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let country = country {
            countryname.text = country.name
        }
    }
}


