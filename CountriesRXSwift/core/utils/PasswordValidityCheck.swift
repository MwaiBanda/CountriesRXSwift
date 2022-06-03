//
//  PasswordValidityCheck.swift
//  CountriesRXSwift
//
//  Created by Mwai Banda on 6/3/22.
//

import Foundation

enum PasswordValidityCheck: Hashable {
    case containsUppercase
    case containsNumber
    case containsSpecialCharacter
    case isLongEnough
}
