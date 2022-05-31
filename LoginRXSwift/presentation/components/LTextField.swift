//
//  LTextField.swift
//  LoginRXSwift
//
//  Created by Mwai Banda on 5/31/22.
//

import Foundation
import UIKit


class LTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLTextField()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLTextField()
    }
    private func setupLTextField(){
        layer.cornerRadius = 5
        backgroundColor = .white
    }
}
