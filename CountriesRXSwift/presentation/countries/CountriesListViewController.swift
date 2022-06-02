//
//  CountriesListViewController.swift
//  LoginRXSwift
//
//  Created by Mwai Banda on 5/31/22.
//

import UIKit
import Swinject
import RxSwift
import SDWebImage




class CountriesListViewController: LBaseViewController {
    private var countryViewModel: CountryViewModelProvision!
    private var disposeBag: DisposeBag!
    private let tableView: UITableView = {
        let table =  UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.countryViewModel = Assembler.sharedInstance.resolver.resolve(CountryViewModelProvision.self, name: Constants.CountryViewModel)
        self.disposeBag = Assembler.sharedInstance.resolver.resolve(DisposeBag.self, name: Constants.DisposeBag)
        view.addSubview(tableView)
        tableView.frame = view.bounds
        
        countryViewModel.countries.bind(to: tableView.rx.items(cellIdentifier: "cell", cellType: UITableViewCell.self)){ row, country, cell in
            cell.textLabel?.text = "\(country.unicodeFlag) \(country.name)"
            
        }.disposed(by: disposeBag)
        
        tableView.rx.modelSelected(Country.self).bind { country in
            self.countryViewModel.setSelectedCountry(country: country)
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            if let destination  = storyboard.instantiateViewController(withIdentifier: "CountriesDetailViewController") as? CountriesDetailViewController {
                destination.country = country
                self.navigationController?.pushViewController(destination, animated: true)
            }
        }.disposed(by: disposeBag)
    }
   

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = "Countries"
        self.tabBarController?.navigationItem.hidesBackButton = true
        self.tabBarController?.navigationItem.largeTitleDisplayMode = .always
        countryViewModel.fetchCountries()
        
    }

}
