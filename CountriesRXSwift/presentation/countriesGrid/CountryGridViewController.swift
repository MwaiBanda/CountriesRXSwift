//
//  SettingsViewController.swift
//  LoginRXSwift
//
//  Created by Mwai Banda on 5/31/22.
//

import UIKit
import SwiftUI
import Swinject

class CountryGridViewController: LBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let childView = UIHostingController(rootView: CountryGridView())
        addChild(childView)
        childView.view.frame = view.frame
        view.addSubview(childView.view)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.hidesBackButton = true

    }
}


