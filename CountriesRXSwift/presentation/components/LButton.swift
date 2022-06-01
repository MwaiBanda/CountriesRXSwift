//
//  LButton.swift
//  LoginRXSwift
//
//  Created by Mwai Banda on 5/31/22.
//

import UIKit

class LButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLBtn()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLBtn()
    }
    
    private func setupLBtn() {
        layer.cornerRadius = 5
        backgroundColor = .orange
        setTitleColor(.black, for: .normal)
        
        
    }
}
