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
    private var countryViewModel: CountryViewModelProvision!
    private var disposeBag: DisposeBag!
    @IBOutlet weak var lbCountryName: UILabel!
    @IBOutlet weak var imgCountryFlag: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.countryViewModel = Assembler.sharedInstance.resolver.resolve(CountryViewModelProvision.self, name: Constants.CountryViewModel)
        self.disposeBag = Assembler.sharedInstance.resolver.resolve(DisposeBag.self, name: Constants.DisposeBag)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cityCell")
        tableView.backgroundColor = .systemGray5

        countryViewModel.selectedCountry
            .map{ $0.name }
            .asObservable()
            .bind(to: lbCountryName.rx.text)
            .disposed(by: disposeBag)
        
        lbCountryName.font = .preferredCustomFont(forTextStyle: .title1, weight: .black)
        
       
        countryViewModel.selectedCities.bind(to: tableView.rx.items(cellIdentifier: "cityCell", cellType: UITableViewCell.self)){ row, city, cell in
            cell.textLabel?.text = city
            cell.backgroundColor = .systemGray5
        }.disposed(by: disposeBag)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let country = country {
            self.countryViewModel.setSelectedCountry(country: country)
            if let imageURL = country.flagURL {
                imgCountryFlag.sd_setImage(with: URL(string: imageURL))
            } else {
                imgCountryFlag.image = UIImage(systemName: "photo")
                imgCountryFlag.tintColor = .gray
            }
        }
        self.tabBarController?.navigationItem.backBarButtonItem?.tintColor = .orange
       
    }
    
}


