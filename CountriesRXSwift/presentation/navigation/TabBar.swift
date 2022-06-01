//
//  TabBar.swift
//  LoginRXSwift
//
//  Created by Mwai Banda on 5/31/22.
//

import UIKit

class TabBar: UITabBar {
  
    override func draw(_ rect: CGRect) {
       super.draw(rect)
        barTintColor = .gray
        tintColor = .black
        backgroundColor = .systemGray4.withAlphaComponent(0.4)
    }

}
