//
//  CountriesGridView.swift
//  CountriesRXSwift
//
//  Created by Mwai Banda on 6/6/22.
//

import SwiftUI
import Swinject
import Algorithms
import SDWebImageSwiftUI

struct CountryGridView: View {
    @StateObject private var countryGridViewModel = CountryGridViewModel(service: Assembler.sharedInstance.resolver.resolve(CountryService.self, name: Constants.CountryService)!)
   
    
    var body: some View {
        ZStack {
            Color(.systemGray5).ignoresSafeArea(.all)
            ScrollView {
                ForEach(countryGridViewModel.countries.chunks(ofCount: Int(screenBounds.width/95)), id: \.self) { row in
                    HStack(alignment: .top) {
                        ForEach(row, id: \.id) { country in
                            NavigationLink {
                            } label: {
                                CountryView(country: country)
                            }
                        }
                    }.padding(.horizontal)
                }
            }
            .padding(.top, 1)
            .frame(width: screenBounds.width)
        }.navigationTitle("Countries")
        .onAppear {
            countryGridViewModel.fetchCountries()
        }
    }
}




struct CountryView: View {
    var country: Country
    var body: some View {
        VStack(alignment: .center){
            WebImage(url: URL(string: country.flagURL ?? ""), context: [.imageThumbnailPixelSize : CGSize.zero])
                .resizable()
                .placeholder(Image(systemName: "photo"))
                .foregroundColor(.gray.opacity(0.5))
                .frame(width: 95, height: 75)
                .cornerRadius(7)
            
            Text(country.name)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
        }
    }
}
