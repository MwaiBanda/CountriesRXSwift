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
    @StateObject private var countryGridViewModel = Assembler.sharedInstance.resolver.resolve(CountryGridViewModel.self, name: Constants.CountryGridViewModel)!
   
    
    var body: some View {
        ZStack {
            Color(.systemGray5).ignoresSafeArea(.all)
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0)  {
                ForEach(
                    countryGridViewModel.countries
                    .chunks(ofCount: Int(screenBounds.width/140)),
                    id: \.self
                ) { row in
                    VStack(spacing: 0)  {
                    Divider()

                    HStack(alignment: .top) {
                        Spacer()
                        ForEach(row, id: \.id) { country in

                            NavigationLink {
                                CountryDetailView(country: country)
                            } label: {
                                CountryView(country: country)
                                    .padding(.vertical, 15)
                                    .frame(maxWidth: 130)
                            }
                            
                            if country.id != row.last?.id {
                            Divider()
                                    .padding(.horizontal)
                            }
                            
                        }
                        Spacer()
                    }
                    .padding(.horizontal)
                    }
                }
            }
            }
            .padding(.top, 1)
            .frame(width: screenBounds.width)
        }.navigationTitle("Countries")
        .onAppear {
            DispatchQueue.main.async {
            countryGridViewModel.fetchCountries()
            }
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
                .indicator(Indicator.progress)
                .transition(.fade(duration: 0.5))
                .aspectRatio(contentMode: .fill)
                .foregroundColor(.gray.opacity(0.5))
                .frame(width: 100, height: 75)
                .cornerRadius(7)
            
            Text(country.name)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
        }
    }
}
