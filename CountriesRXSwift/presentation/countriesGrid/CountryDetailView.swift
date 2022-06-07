//
//  CountryDetailView.swift
//  CountriesRXSwift
//
//  Created by Mwai Banda on 6/6/22.
//

import SwiftUI

struct CountryDetailView: View {
    var country: Country
    var body: some View {
        Text(country.name)
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView(country: Country(name: "Zambia", unicodeFlag: "🇿🇲"))
    }
}
