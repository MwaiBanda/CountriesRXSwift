//
//  LPasswordHint.swift
//  CountriesRXSwift
//
//  Created by Mwai Banda on 6/3/22.
//

import UIKit

class LPasswordHint: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHintLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupHintLabel()
    }
    
    func setupHintLabel() {
        font = .preferredFont(forTextStyle: .caption1)
        textColor = .red
    }
    
}
