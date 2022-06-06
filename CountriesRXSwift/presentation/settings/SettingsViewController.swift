//
//  SettingsViewController.swift
//  LoginRXSwift
//
//  Created by Mwai Banda on 5/31/22.
//

import UIKit
import SwiftUI

class SettingsViewController: LBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let childView = UIHostingController(rootView: SettingsView())
        addChild(childView)
        childView.view.frame = view.frame
        view.addSubview(childView.view)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = "Settings"
        self.tabBarController?.navigationItem.hidesBackButton = true

    }

}

struct SettingsView: View {
    var body: some View {
        ZStack {
            Color(.systemGray5).ignoresSafeArea(.all)
            VStack {
                Text("We are in SwiftUI Now")
            }
        }
    }
}
